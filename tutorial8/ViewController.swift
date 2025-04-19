//
//  ViewController.swift
//  tutorial8
//
//  Created by mobiledev on 19/4/2025.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.

            let db = Firestore.firestore()
            print("\nINITIALIZED FIRESTORE APP \(db.app.name)\n")
        
        let movieCollection = db.collection("movies")
        movieCollection.getDocuments() { (result, err) in
          //check for server error
          if let err = err
          {
              print("Error getting documents: \(err)")
          }
          else
          {
              //loop through the results
              for document in result!.documents
              {
                  //attempt to convert to Movie object
                  let conversionResult = Result
                  {
                      try document.data(as: Movie.self)
                  }

                  //check if conversionResult is success or failure (i.e. was an exception/error thrown?
                  switch conversionResult
                  {
                      //no problems (but could still be nil)
                      case .success(let movie):
                          print("Movie: \(movie)")
                          
                      case .failure(let error):
                          // A `Movie` value could not be initialized from the DocumentSnapshot.
                          print("Error decoding movie: \(error)")
                  }
              }
          }
        }
    }
}

