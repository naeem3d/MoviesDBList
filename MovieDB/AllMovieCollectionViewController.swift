//
//  AllMovieCollectionViewController.swift
//  MovieDB
//
//  Created by naeem alabboodi on 6/17/21.
//

import UIKit

class AllMovieCollectionViewController: UIViewController ,UICollectionViewDelegate, UISearchBarDelegate {
    
    
    enum Section{
        case main
    }
    
    var collectionView : UICollectionView!
    var datasource : UICollectionViewDiffableDataSource<Section, movieDetails>!
    var listMovies:[movieDetails] = []
    var page = 1
    var hasMoreMovie = true
    var filterMovies :[movieDetails] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        confgureViewCOntrller()
        configureSearchController()
        configureCollectionView()
        getMovies(page: page)
        configrueDatasource()
        
        
    }
    
 
    func confgureViewCOntrller(){
        view.backgroundColor = .systemGreen
    }
    
    func getMovies(page:Int){
        showLoadingView()
        NetworkManager.share.getMovies(page: page) {[weak self] result in
            guard let self = self else { return}
            self.dismissLoadingView()
            switch result{
            case .success(let movies) :
                if movies.count < 20 {self.hasMoreMovie = false}
                self.listMovies.append(contentsOf: movies)
                self.updatedata(on: self.listMovies)
                print("movieList.count = \(movies.count)")
               
            case .failure(let error) :
                print(error.rawValue)
                
            }
            
            
        }
        
    }
    
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createTwoColumnFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .label
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
        collectionView.delegate = self
    
    }
   
    
    func createTwoColumnFlowLayout() -> UICollectionViewLayout{
        let width = view.bounds.width
        let padding : CGFloat = 4
        let minimumSpace : CGFloat = 6
        let availableWidth = width - (padding * 2) - (minimumSpace * 2)
        
        let itemWidth = availableWidth / 2
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    func configrueDatasource(){
        datasource = UICollectionViewDiffableDataSource<Section,movieDetails>(collectionView: collectionView, cellProvider: { (collect, indexPath, movies )  -> UICollectionViewCell  in
            let cell = collect.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
            cell.movieTitle.text = movies.title
           
            let urlFinal = "https://image.tmdb.org/t/p/w500" + "\(movies.posterPath)"
            cell.MoviePosterView.GetMovieImage(from: urlFinal)
            return cell
        })
    }
    
    func updatedata(on movies:[movieDetails]){
        var snapshot  = NSDiffableDataSourceSnapshot<Section,movieDetails>()
        snapshot.appendSections([.main])
        snapshot.appendItems(movies)
        DispatchQueue.main.async {
            self.datasource.apply(snapshot, animatingDifferences: true)
        }
        
    }
    

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
     
        
        
        if offsetY > (contentHight - height) {
            guard hasMoreMovie else {return}
            page += 1
            getMovies(page: page)
        }
        
        print("offsetY = \(offsetY)")
        print("contentHight = \(contentHight)")
        print("height = \(height)")
    }
    
    
    func configureSearchController(){
        let searchController  = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "search for a movi"
        navigationItem.searchController = searchController
    }
    

    
     

}

extension AllMovieCollectionViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {return}
        filterMovies =       listMovies.filter{$0.title.lowercased().contains(filter.lowercased())}
        updatedata(on: filterMovies)
        
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       updatedata(on: listMovies)
    }
   
    
    
}
