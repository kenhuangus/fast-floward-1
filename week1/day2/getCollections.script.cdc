//W1Q4 Write a script that prints the contents of collections 
//for all five Playground accounts (0x01, 0x02, etc.). 
//Please use your framed canvas printer function to log each 
//Picture's canvas in a legible way. 
//Provide a log for accounts that don't yet have a Collection.
import Artist from 0x01

pub fun main() {
    let accts: [Address; 5] = [0x01, 0x02, 0x03, 0x04, 0x05];
    for acct in accts {
      let collectionRef = getAccount(acct)
        .getCapability<&Artist.Collection>(/public/ArtistPictureCollection)
        .borrow();
      if (collectionRef != nil) {
        let cr = collectionRef!
        let len = cr.collection.length
        var i = 0;
        while i < len {
          let canvas = cr.collection[i].canvas
          canvas.display();
          i = i + 1
        }
      } else {
        log("Account ".concat(acct.toString()).concat(" doesn't yet have a Collection"))
      }
    }
}