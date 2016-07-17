//
//  IndicationsView.swift
//  IUM
//
//  Created by Luca Pitzalis on 20/04/16.
//  Copyright © 2016 Luca Pitzalis. All rights reserved.
//

import UIKit

class IndicationsController : UIViewController, UITableViewDelegate,  UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var mapImage: UIImageView?
    var items = [String]()
    var flag = true
    static var operaCercata : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [/*"Area Preistorica",*/ "Area Greca", "Area Romana", "Area Bosch", "Area Michelangelo", "Area Leonardo Da Vinci", "Area Monet", /*"Area Medievale",*/ "Area van Gogh"]
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view, typically from a nib.
        let goToMap = UITapGestureRecognizer(target:self, action:#selector(IndicationsController.goToMap(_:)))

        mapImage!.userInteractionEnabled = true
        mapImage!.addGestureRecognizer(goToMap)
        
    }
    
    func goToMap(img: AnyObject)
    {
        
        let scrollView = self.view.superview as! UIScrollView!
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = UIFont(name:"Bellezza", size:22)
        cell.textLabel?.textColor = UIColor.blackColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var i = 1
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        if flag{
            switch currentCell.textLabel!.text! {
            case "Area Preistorica":
                break
            case "Area Greca":
                for currenOpera in Opera.opere{
                    if currenOpera.getAuthor()! == "Pitocrito"{
                        items.insert("\t"+currenOpera.getTitle()!, atIndex: indexPath.row+i)
                        i+=1
                    }
                }

                break
            case "Area Romana":
                for currenOpera in Opera.opere{
                    if currenOpera.getAuthor()! == "Sconosciuto"{
                        items.insert("\t"+currenOpera.getTitle()!, atIndex: indexPath.row+i)
                        i+=1
                    }
                }

                break
            case "Area Michelangelo":
                for currenOpera in Opera.opere{
                    if currenOpera.getAuthor()! == "Michelangelo"{
                        items.insert("\t"+currenOpera.getTitle()!, atIndex: indexPath.row+i)
                        i+=1
                    }
                }

                break
            case "Area Leonardo Da Vinci":
                for currenOpera in Opera.opere{
                    if currenOpera.getAuthor()! == "Leonardo da Vinci"{
                        items.insert("\t"+currenOpera.getTitle()!, atIndex: indexPath.row+i)
                        i+=1
                    }
                }
                break
            case "Area Bramante":
                for currenOpera in Opera.opere{
                    if currenOpera.getAuthor()! == "Bramante"{
                        items.insert("\t"+currenOpera.getTitle()!, atIndex: indexPath.row+i)
                        i+=1
                    }
                }
                break
            case "Area Bosch":
                for currenOpera in Opera.opere{
                    if currenOpera.getAuthor()! == "Hieronymus Bosch"{
                        items.insert("\t"+currenOpera.getTitle()!, atIndex: indexPath.row+i)
                        i+=1
                    }
                }
                break
            case "Area Monet":
                for currenOpera in Opera.opere{
                    if currenOpera.getAuthor()! == "Claude Monet"{
                        items.insert("\t"+currenOpera.getTitle()!, atIndex: indexPath.row+i)
                        i+=1
                    }
                }
                break
            case "Area van Gogh":
                for currenOpera in Opera.opere{
                    if currenOpera.getAuthor()! == "Vincent van Gogh"{
                        items.insert("\t"+currenOpera.getTitle()!, atIndex: indexPath.row+i)
                        i+=1
                    }
                }
                break

            case "Area Medievale":
                break

            default:
                break
            }
            flag = false
        }
        else{
            
            switch currentCell.textLabel!.text! {
            case "\tVergine delle rocce":
                selectedOpera("Vergine delle rocce")
                break
            case "\tCristo alla colonna":
                selectedOpera("Cristo alla colonna")
                break
            case "\tMorte di un avaro":
                selectedOpera("Morte di un avaro")
                break
            case "\tEcce Homo":
                selectedOpera("Ecce Homo")
                break
            case "\tColazione sull'erba":
                selectedOpera("Colazione sull'erba")
                break
            case "\tI mangiatori di patate":
                selectedOpera("I mangiatori di patate")
                break
            case "\tNike di Samotracia":
                selectedOpera("Nike di Samotracia")
                break
            case "\tAugusto di Prima Porta":
                selectedOpera("Augusto di Prima Porta")
                break
            case "\tDavid":
                
                selectedOpera("David")

               
                break

                
            default:
                break
            }
            
            items = [/*"Area Preistorica",*/ "Area Greca", "Area Romana", "Area Bosch", "Area Michelangelo", "Area Leonardo Da Vinci", "Area Monet", /*"Area Medievale",*/ "Area van Gogh"]
            flag = true
        }
        tableView.reloadData()
    }
    
    func selectedOpera(operaName : String){
        for opera in Opera.opere{
            if opera.getTitle() == operaName{
                IndicationsController.operaCercata = Opera.opere.indexOf(opera)!+1
                let scrollView = self.view.superview as! UIScrollView!
                scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
                MapView.staticMap!.searchedOpera()
            }
            
        }
    }

    
}