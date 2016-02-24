//
//  MasterViewController.m
//  NSURLSessionTutorial
//
//  Created by Himanshu Khatri on 2/23/16.
//  Copyright © 2016 bdAppManiac. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@property NSArray *filteredArray;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;


    
    NSArray* codeStr =@[@"AF", @"AL", @"DZ", @"AS", @"AD", @"AO", @"AI", @"AQ", @"AG", @"AR", @"AM", @"AW", @"AU", @"AT", @"AZ", @"BS", @"BH", @"BD", @"BB", @"BY", @"BE", @"BZ", @"BJ", @"BM", @"BT", @"BO", @"BA", @"BW", @"BV", @"BR", @"IO", @"BN", @"BG", @"BF", @"BI", @"KH", @"CM", @"CA", @"CV", @"KY", @"CF", @"TD", @"CL", @"CN", @"CX", @"CC", @"CO", @"KM", @"CG", @"CD", @"CK", @"CR", @"CI", @"HR", @"CU", @"CY", @"CZ", @"DK", @"DJ", @"DM", @"DO", @"TP", @"EC", @"EG", @"SV", @"GQ", @"ER", @"EE", @"ET", @"FK", @"FO", @"FJ", @"FI", @"FR", @"FX", @"GF", @"PF", @"TF", @"GA", @"GM", @"GE", @"DE", @"GH", @"GI", @"GR", @"GL", @"GD", @"GP", @"GU", @"GT", @"GN", @"GW", @"GY", @"HT", @"HM", @"VA", @"HN", @"HK", @"HU", @"IS", @"IN", @"ID", @"IR", @"IQ", @"IE", @"IL", @"IT", @"JM", @"JP", @"JO", @"KZ", @"KE", @"KI", @"KP", @"KR", @"KW", @"KG", @"LA", @"LV", @"LB", @"LS", @"LR", @"LY", @"LI", @"LT", @"LU", @"MO", @"MK", @"MG", @"MW", @"MY", @"MV", @"ML", @"MT", @"MH", @"MQ", @"MR", @"MU", @"YT", @"MX", @"FM", @"MD", @"MC", @"MN", @"ME", @"MS", @"MA", @"MZ", @"MM", @"NA", @"NR", @"NP", @"NL", @"AN", @"NC", @"NZ", @"NI", @"NE", @"NG", @"NU", @"NF", @"MP", @"NO", @"OM", @"PK", @"PW", @"PA", @"PG", @"PY", @"PE", @"PH", @"PN", @"PL", @"PT", @"PR", @"QA", @"RE", @"RO", @"RU", @"RW", @"KN", @"LC", @"VC", @"WS", @"SM", @"ST", @"SA", @"SN", @"RS", @"SC", @"SL", @"SG", @"SK", @"SI", @"SB", @"SO", @"ZA", @"SS", @"GS", @"ES", @"LK", @"SH", @"PM", @"SD", @"SR", @"SJ", @"SZ", @"SE", @"CH", @"SY", @"TW", @"TJ", @"TZ", @"TH", @"TG", @"TK", @"TO", @"TT", @"TN", @"TR", @"TM", @"TC", @"TV", @"UG", @"UA", @"AE", @"GB", @"US", @"UM", @"UY", @"UZ", @"VU", @"VE", @"VN", @"VG", @"VI", @"WF", @"EH", @"YE", @"ZM", @"ZW"];
    
    NSArray *name =@[@"AFGHANISTAN", @"ALBANIA", @"ALGERIA", @"AMERICAN SAMOA", @"ANDORRA", @"ANGOLA", @"ANGUILLA", @"ANTARCTICA", @"ANTIGUA AND BARBUDA", @"ARGENTINA", @"ARMENIA", @"ARUBA", @"AUSTRALIA", @"AUSTRIA", @"AZERBAIJAN", @"BAHAMAS", @"BAHRAIN", @"BANGLADESH", @"BARBADOS", @"BELARUS", @"BELGIUM", @"BELIZE", @"BENIN", @"BERMUDA", @"BHUTAN", @"BOLIVIA", @"BOSNIA AND HERZEGOWINA", @"BOTSWANA", @"BOUVET ISLAND", @"BRAZIL", @"BRITISH INDIAN OCEAN TERRITORY", @"BRUNEI DARUSSALAM", @"BULGARIA", @"BURKINA FASO", @"BURUNDI", @"CAMBODIA", @"CAMEROON", @"CANADA", @"CAPE VERDE", @"CAYMAN ISLANDS", @"CENTRAL AFRICAN REPUBLIC", @"CHAD", @"CHILE", @"CHINA", @"CHRISTMAS ISLAND", @"COCOS (KEELING) ISLANDS", @"COLOMBIA", @"COMOROS", @"CONGO", @"CONGO, THE DRC", @"COOK ISLANDS", @"COSTA RICA", @"COTE D'IVOIRE", @"CROATIA (local name: Hrvatska)", @"CUBA", @"CYPRUS", @"CZECH REPUBLIC", @"DENMARK", @"DJIBOUTI", @"DOMINICA", @"DOMINICAN REPUBLIC", @"EAST TIMOR", @"ECUADOR", @"EGYPT", @"EL SALVADOR", @"EQUATORIAL GUINEA", @"ERITREA", @"ESTONIA", @"ETHIOPIA", @"FALKLAND ISLANDS (MALVINAS)", @"FAROE ISLANDS", @"FIJI", @"FINLAND", @"FRANCE", @"FRANCE, METROPOLITAN", @"FRENCH GUIANA", @"FRENCH POLYNESIA", @"FRENCH SOUTHERN TERRITORIES", @"GABON", @"GAMBIA", @"GEORGIA", @"GERMANY", @"GHANA", @"GIBRALTAR", @"GREECE", @"GREENLAND", @"GRENADA", @"GUADELOUPE", @"GUAM", @"GUATEMALA", @"GUINEA", @"GUINEA-BISSAU", @"GUYANA", @"HAITI", @"HEARD AND MC DONALD ISLANDS", @"HOLY SEE (VATICAN CITY STATE)", @"HONDURAS", @"HONG KONG", @"HUNGARY", @"ICELAND", @"INDIA", @"INDONESIA", @"IRAN (ISLAMIC REPUBLIC OF)", @"IRAQ", @"IRELAND", @"ISRAEL", @"ITALY", @"JAMAICA", @"JAPAN", @"JORDAN", @"KAZAKHSTAN", @"KENYA", @"KIRIBATI", @"KOREA, D.P.R.O.", @"KOREA, REPUBLIC OF", @"KUWAIT", @"KYRGYZSTAN", @"LAOS", @"LATVIA", @"LEBANON", @"LESOTHO", @"LIBERIA", @"LIBYAN ARAB JAMAHIRIYA", @"LIECHTENSTEIN", @"LITHUANIA", @"LUXEMBOURG", @"MACAU", @"MACEDONIA", @"MADAGASCAR", @"MALAWI", @"MALAYSIA", @"MALDIVES", @"MALI", @"MALTA", @"MARSHALL ISLANDS", @"MARTINIQUE", @"MAURITANIA", @"MAURITIUS", @"MAYOTTE", @"MEXICO", @"MICRONESIA, FEDERATED STATES OF", @"MOLDOVA, REPUBLIC OF", @"MONACO", @"MONGOLIA", @"MONTENEGRO", @"MONTSERRAT", @"MOROCCO", @"MOZAMBIQUE", @"MYANMAR (Burma)", @"NAMIBIA", @"NAURU", @"NEPAL", @"NETHERLANDS", @"NETHERLANDS ANTILLES", @"NEW CALEDONIA", @"NEW ZEALAND", @"NICARAGUA", @"NIGER", @"NIGERIA", @"NIUE", @"NORFOLK ISLAND", @"NORTHERN MARIANA ISLANDS", @"NORWAY", @"OMAN", @"PAKISTAN", @"PALAU", @"PANAMA", @"PAPUA NEW GUINEA", @"PARAGUAY", @"PERU", @"PHILIPPINES", @"PITCAIRN", @"POLAND", @"PORTUGAL", @"PUERTO RICO", @"QATAR", @"REUNION", @"ROMANIA", @"RUSSIAN FEDERATION", @"RWANDA", @"SAINT KITTS AND NEVIS", @"SAINT LUCIA", @"SAINT VINCENT AND THE GRENADINES", @"SAMOA", @"SAN MARINO", @"SAO TOME AND PRINCIPE", @"SAUDI ARABIA", @"SENEGAL", @"SERBIA", @"SEYCHELLES", @"SIERRA LEONE", @"SINGAPORE", @"SLOVAKIA (Slovak Republic)", @"SLOVENIA", @"SOLOMON ISLANDS", @"SOMALIA", @"SOUTH AFRICA", @"SOUTH SUDAN", @"SOUTH GEORGIA AND SOUTH S.S.", @"SPAIN", @"SRI LANKA", @"ST. HELENA", @"ST. PIERRE AND MIQUELON", @"SUDAN", @"SURINAME", @"SVALBARD AND JAN MAYEN ISLANDS", @"SWAZILAND", @"SWEDEN", @"SWITZERLAND", @"SYRIAN ARAB REPUBLIC", @"TAIWAN, PROVINCE OF CHINA", @"TAJIKISTAN", @"TANZANIA, UNITED REPUBLIC OF", @"THAILAND", @"TOGO", @"TOKELAU", @"TONGA", @"TRINIDAD AND TOBAGO", @"TUNISIA", @"TURKEY", @"TURKMENISTAN", @"TURKS AND CAICOS ISLANDS", @"TUVALU", @"UGANDA", @"UKRAINE", @"UNITED ARAB EMIRATES", @"UNITED KINGDOM", @"UNITED STATES", @"U.S. MINOR ISLANDS", @"URUGUAY", @"UZBEKISTAN", @"VANUATU", @"VENEZUELA", @"VIET NAM", @"VIRGIN ISLANDS (BRITISH)", @"VIRGIN ISLANDS (U.S.)", @"WALLIS AND FUTUNA ISLANDS", @"WESTERN SAHARA", @"YEMEN", @"ZAMBIA", @"ZIMBABWE"];
    
    self.objects = [NSMutableArray new];
    for (int i=0; i<name.count; i++) {
        NSDictionary *dic = @{
                              @"name":name[i],
                              @"code":codeStr[i]
                              };
        [self.objects addObject:dic];
    }
    
    
 
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {

}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *object = self.objects[indexPath.row];
        if (!indexPath) {
            indexPath = self.searchDisplayController.searchResultsTableView.indexPathForSelectedRow;
            object = _filteredArray[indexPath.row];
        }
        
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
        
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == self.searchDisplayController.searchResultsTableView)
        return _filteredArray.count;
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"] ;//] forIndexPath:indexPath];

        NSDictionary *object = self.objects[indexPath.row];
    
    if(tableView == self.searchDisplayController.searchResultsTableView)
        object = [_filteredArray objectAtIndex:indexPath.row];

    cell.textLabel.text = object[@"name"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
#pragma mark - Search
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchString];
    _filteredArray = [_objects filteredArrayUsingPredicate:predicate] ;
    
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",self.searchDisplayController.searchBar.text];
    _filteredArray = [_objects filteredArrayUsingPredicate:predicate];
    return YES;
}
@end
