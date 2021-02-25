import UIKit
import SkeletonView

class ViewController1: UIViewController, SkeletonTableViewDataSource, UITableViewDelegate  {
//DECLARATIONS
//========================================================================================
    @IBOutlet weak var tableView: UITableView!
    var compendium = Compendium().compendium
    var index = 0;

//TABLEVIEW SET UP
//==========================================================================================
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return compendium.count;
    }//creates the row cound
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell";
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        //creates the cell
        index = indexPath.row;
        cell.textLabel?.text = compendium[indexPath.row].name
        cell.imageView?.image = UIImage(named: "vampire")
        cell.detailTextLabel?.text = compendium[indexPath.row].region
        
        return cell;
    }//populates the cell with data
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        self.view.hideSkeleton();
        return "Cell"
    }//sets up the skeleton gradient animation
    
    func gradientCustomize(){
        
        let gradient = SkeletonGradient(baseColor:#colorLiteral(red: 0.5489894748, green: 1, blue: 0.3998864293, alpha: 1) )
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight)
       // view.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation, transition: .none)
        
    }//customizes the skeleton gradient. place this into the viewDidLoad
    
// DATA TRANSFER
//============================================================================================
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewController2{
            let indexPath = self.tableView.indexPathForSelectedRow
            let destination = segue.destination as? ViewController2
            destination?.monsterImage.image = UIImage(named: "vampire")
            destination?.monsterDescribe.text = compendium[indexPath?.row ?? 0].description
            
        }
    }
    
//JSON METHODS
//======================================================================
    func jsonParse()->Compendium{
        
        var monster: Compendium?

        guard  let jsonURL = Bundle(for: type(of: self)).path(forResource: "compendium", ofType: "json")else{
            print("jsonParse() error: jsonURL");
            return monster!
        }
        
        guard let jsonString = try? String(contentsOf: URL(fileURLWithPath: jsonURL), encoding: String.Encoding.utf8)else{
            print("jsonParse() error: jsonString")
            return monster!
        }
        
        do{
            monster = try JSONDecoder().decode(Compendium.self, from: Data(jsonString.utf8))
        }catch{
            print("error");
        }
        
        guard let result = monster else{
            print("jsonParse() error: result")
            return monster!
        }
        //compendium = result.compendium
        //^maybe this?
        return result;
    }    //parse json file
    
    //VIEW DID LOAD
    //=====================================================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientCustomize();
        tableView.dataSource = self;
        tableView.delegate = self;
        compendium = jsonParse().compendium

    }
    
    
}

