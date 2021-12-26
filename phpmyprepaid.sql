-- MySQL dump 10.10
--
-- Host: localhost    Database: phpmyprepaid
-- ------------------------------------------------------
-- Server version	5.0.24a-Debian_9ubuntu1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AP`
--

DROP TABLE IF EXISTS `AP`;
CREATE TABLE `AP` (
  `ID` int(11) NOT NULL auto_increment,
  `aptype` int(10) NOT NULL,
  `dnsname` varchar(60) NOT NULL default '',
  `ipaddress` varchar(40) NOT NULL,
  `user` varchar(40) NOT NULL default '',
  `pass` varchar(40) NOT NULL default '',
  `macaddress` varchar(20) default NULL,
  `nasID` varchar(11) default NULL,
  `comunity` varchar(100) default NULL,
  `version` varchar(5) default NULL,
  `mib` varchar(254) default NULL,
  `latitude` varchar(200) default NULL,
  `longitude` varchar(200) default NULL,
  `LocationID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AP`
--




DROP TABLE IF EXISTS `cards_tpl`;
CREATE TABLE `cards_tpl` (
  `ID` int(11) NOT NULL auto_increment,
  `tpl_name` varchar(255) default NULL,
  `tpl_value` text,
  `tpl_location` int(11) NOT NULL default '-1',
  `cards_x` int(11) default NULL,
  `cards_y` int(11) default NULL,
  `margin_cell` int(11) default NULL,
  `margin_top` int(11) default NULL,
  PRIMARY KEY  (`ID`,`tpl_location`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

LOCK TABLES `cards_tpl` WRITE;
/*!40000 ALTER TABLE `cards_tpl` DISABLE KEYS */;
INSERT INTO `cards_tpl` VALUES (1,'default1','<table border=\\\"1\\\" cellpadding=\\\"1\\\" cellspacing=\\\"1\\\" height=\\\"204\\\" width=\\\"279\\\"> <tbody> <tr align=\\\"center\\\"> <td colspan=\\\"2\\\"><img src=\\\"http://localhost/phpmyprepaid/www/images/logo2.jpg\\\" _fcksavedurl=\\\"http://localhost/phpmyprepaid/www/images/logo2.jpg\\\" alt=\\\"\\\" height=\\\"45\\\" width=\\\"225\\\"></td> </tr> <tr> <td><font size=\\\"2\\\"><b>Login :</b></font></td> <td><font size=\\\"2\\\">%login<br></font></td> </tr> <tr> <td> <p><font size=\\\"2\\\"><b>Password:</b></font></p> </td> <td><font size=\\\"2\\\">%password</font></td> </tr> <tr> <td><font size=\\\"2\\\"><b>Validity :</b></font></td> <td><font size=\\\"2\\\">%validity<br></font></td> </tr> <tr> <td valign=\\\"top\\\"><font size=\\\"2\\\"><b>Price :</b></font></td> <td valign=\\\"top\\\"><font size=\\\"2\\\">%price<br></font></td> </tr> <tr> <td colspan=\\\"2\\\" valign=\\\"top\\\"><font size=\\\"1\\\"><b>Information: </b>To use this card, please connect your device to the nearest ssid. Open your web browser and enter each needed field.<br></font></td> </tr> </tbody> </table>',-1,2,5,10,40),(2,'default2','<table width=\"333\" height=\"258\" cellspacing=\"1\" cellpadding=\"1\" border=\"1\"> <tbody> <tr align=\"left\"> <td width=\"30\" colspan=\"2\"><font size=\"3\"><strong>Prepaid internet cards</strong></font></td> <td align=\"right\" colspan=\"2\"> <p>&nbsp;</p> <p><img width=\"141\" height=\"88\" src=\"http://localhost/phpmyprepaid/www/images/logo2.jpg\" alt=\"\" /></p> </td> </tr> <tr> <td bgcolor=\"#cccccc\"><strong>Login :</strong></td> <td width=\"30\"><input type=\"text\" name=\"login\" value=\"%login\" maxlength=\"15\" /></td> </tr> <tr> <td bgcolor=\"#cccccc\"> <p><strong>Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br /> </strong></p> </td> <td><input type=\"text\" name=\"passwd\" value=\"%password\" /></td> <td>&nbsp;</td> </tr> <tr> <td bgcolor=\"#cccccc\"><strong>Validity :</strong></td> <td><input type=\"text\" name=\"validity\" value=\"%validity\" maxlength=\"15\" /></td> <td>&nbsp;</td> </tr> <tr> <td bgcolor=\"#cccccc\"><strong>Price :</strong></td> <td valign=\"top\"><input type=\"text\" name=\"price\" value=\"%price\" /></td> <td valign=\"top\">&nbsp;</td> </tr> <tr> <td valign=\"top\" colspan=\"4\"><strong>Information: </strong>To use this card, please connect your device to the nearest ssid. Open your web browser, and enter login and password in desired field.</td> </tr> </tbody> </table>',-1,2,4,5,10);
/*!40000 ALTER TABLE `cards_tpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_config`
--

DROP TABLE IF EXISTS `ap_config`;
CREATE TABLE `ap_config` (
  `req_userpass` tinyint(1) NOT NULL default '0',
  `req_snmp` tinyint(1) default NULL,
  `disp_userpass` tinyint(1) default NULL,
  `disp_snmp` tinyint(1) default NULL,
  `conf_maclist` tinyint(4) default NULL,
  `maclist_tmp_file` varchar(255) default '/tmp/maclist',
  `maclist_location` varchar(255) default 'http://example.net/bridge-cgi-bin/maclist.pl',
  `wget_cmd` varchar(255) default 'wget',
  `wget_options` varchar(255) default '-q -O',
  `conf_maclist_age` int(11) default '3600',
  `location_id` int(11) NOT NULL default '1',
  PRIMARY KEY  (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ap_config`
--


/*!40000 ALTER TABLE `ap_config` DISABLE KEYS */;
LOCK TABLES `ap_config` WRITE;
INSERT INTO `ap_config` VALUES (1,1,1,1,0,'/tmp/maclist','http://example.net/bridge-cgi-bin/maclist.pl','wget','-q -O',3600,-1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `ap_config` ENABLE KEYS */;

--
-- Table structure for table `areacode`
--

DROP TABLE IF EXISTS `areacode`;
CREATE TABLE `areacode` (
  `area_code` varchar(255) default NULL,
  `area_short_name` varchar(255) default NULL,
  `area_name` varchar(255) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `areacode`
--


/*!40000 ALTER TABLE `areacode` DISABLE KEYS */;
LOCK TABLES `areacode` WRITE;
INSERT INTO `areacode` VALUES ('55','MX','Mexico: Mexico City area (country code + city code)'),('201','NJ','N New Jersey: Jersey City, Hackensack (see split 973, overlay 551)'),('202','DC','Washington, D.C.'),('203','CT','Connecticut: Fairfield County and New Haven County; Bridgeport, New Haven (see 860)'),('204','MB','Canada: Manitoba'),('205','AL','Central Alabama (including Birmingham; excludes the southeastern corner of Alabama and the deep south; see splits 256 and 334)'),('206','WA','W Washington state: Seattle and Bainbridge Island (see splits 253, 360, 425; overlay 564)'),('207','ME','Maine'),('208','ID','Idaho'),('209','CA','Cent. California: Stockton (see split 559)'),('210','TX','S Texas: San Antonio (see also splits 830, 956)'),('211','--','Local community info / referral services'),('212','NY','New York City, New York (Manhattan; see 646, 718)'),('213','CA','S California: Los Angeles (see 310, 323, 626, 818)'),('214','TX','Texas: Dallas Metro (overlays 469/972)'),('215','PA','SE Pennsylvania: Philadelphia (see overlays 267)'),('216','OH','Cleveland (see splits 330, 440)'),('217','IL','Cent. Illinois: Springfield'),('218','MN','N Minnesota: Duluth'),('219','IN','NW Indiana: Gary (see split 574, 260)'),('224','IL','Northern NE Illinois: Evanston, Waukegan, Northbrook (overlay on 847, eff 1/5/2002)'),('225','LA','Louisiana: Baton Rouge, New Roads, Donaldsonville, Albany, Gonzales, Greensburg, Plaquemine, Vacherie (split from 504)'),('226','ON','Canada: SW Ontario: Windsor (overlaid on 519; eff 6/2006)'),('228','MS','S Mississippi (coastal areas, Biloxi, Gulfport; split from 601)'),('229','GA','SW Georgia: Albany (split from 912; see also 478; perm 8/1/00)'),('231','MI','W Michigan: Northwestern portion of lower Peninsula; Traverse City, Muskegon, Cheboygan, Alanson'),('234','OH','NE Ohio: Canton, Akron (overlaid on 330; perm 10/30/00)'),('236','VA','Virginia (region unknown) / Unassigned?'),('239','FL','Florida (Lee, Collier, and Monroe Counties, excl the Keys; see 305; eff 3/11/02; mand 3/11/03)'),('240','MD','W Maryland: Silver Spring, Frederick, Gaithersburg (overlay, see 301)'),('242','--','Bahamas'),('246','--','Barbados'),('248','MI','Michigan: Oakland County, Pontiac (split from 810; see overlay 947)'),('250','BC','Canada: British Columbia (see 604)'),('251','AL','S Alabama: Mobile and coastal areas, Jackson, Evergreen, Monroeville (split from 334, eff 6/18/01; see also 205, 256)'),('252','NC','E North Carolina (Rocky Mount; split from 919)'),('253','WA','Washington: South Tier - Tacoma, Federal Way (split from 206, see also 425; overlay 564)'),('254','TX','Central Texas (Waco, Stephenville; split, see 817, 940)'),('256','AL','E and N Alabama (Huntsville, Florence, Gadsden; split from 205; see also 334)'),('260','IN','NE Indiana: Fort Wayne (see 219)'),('262','WI','SE Wisconsin: counties of Kenosha, Ozaukee, Racine, Walworth, Washington, Waukesha (split from 414)'),('264','--','Anguilla (split from 809)'),('267','PA','SE Pennsylvania: Philadelphia (see 215)'),('268','--','Antigua and Barbuda (split from 809)'),('269','MI','SW Michigan: Kalamazoo, Saugatuck, Hastings, Battle Creek, Sturgis to Lake Michigan (split from 616)'),('270','KY','W Kentucky: Bowling Green, Paducah (split from 502)'),('276','VA','S and SW Virginia: Bristol, Stuart, Martinsville (split from 540; perm 9/1/01, mand 3/16/02)'),('278','MI','Michigan (overlaid on 734, SUSPENDED)'),('281','TX','Texas: Houston Metro (split 713; overlay 832)'),('283','OH','SW Ohio: Cincinnati (cancelled: overlaid on 513)'),('284','--','British Virgin Islands (split from 809)'),('289','ON','Canada: S Cent. Ontario: Greater Toronto Area -- Durham, Halton, Hamilton-Wentworth, Niagara, Peel, York, and southern Simcoe County (excluding Toronto -- overlaid on 905, eff 6/9/01)'),('301','MD','W Maryland: Silver Spring, Frederick, Camp Springs, Prince George\'s County (see 240)'),('302','DE','Delaware'),('303','CO','Central Colorado: Denver (see 970, also 720 overlay)'),('304','WV','West Virginia'),('305','FL','SE Florida: Miami, the Keys (see 786, 954; 239)'),('306','SK','Canada: Saskatchewan'),('307','WY','Wyoming'),('308','NE','W Nebraska: North Platte'),('309','IL','W Cent. Illinois: Peoria'),('310','CA','S California: Beverly Hills, West Hollywood, West Los Angeles (see split 562; overlay 424)'),('311','--','Reserved for special applications'),('312','IL','Illinois: Chicago (downtown only -- in the loop; see 773; overlay 872)'),('313','MI','Michigan: Detroit and suburbs (see 734, overlay 679)'),('314','MO','SE Missouri: St Louis city and parts of the metro area only (see 573, 636, overlay 557)'),('315','NY','N Cent. New York: Syracuse'),('316','KS','S Kansas: Wichita (see split 620)'),('317','IN','Cent. Indiana: Indianapolis (see 765)'),('318','LA','N Louisiana: Shreveport, Ruston, Monroe, Alexandria (see split 337)'),('319','IA','E Iowa: Cedar Rapids (see split 563)'),('320','MN','Cent. Minnesota: Saint Cloud (rural Minn, excl St. Paul/Minneapolis)'),('321','FL','Florida: Brevard County, Cape Canaveral area; Metro Orlando (split from 407)'),('323','CA','S California: Los Angeles (outside downtown: Hollywood; split from 213)'),('325','TX','Central Texas: Abilene, Sweetwater, Snyder, San Angelo (split from 915)'),('330','OH','NE Ohio: Akron, Canton, Youngstown; Mahoning County, parts of Trumbull/Warren counties (see splits 216, 440, overlay 234)'),('331','IL','W NE Illinois, western suburbs of Chicago (part of what used to be 708; overlaid on 630; assigned but not in use)'),('334','AL','S Alabama: Auburn/Opelika, Montgomery and coastal areas (part of what used to be 205; see also 256, split 251)'),('336','NC','Cent. North Carolina: Greensboro, Winston-Salem, High Point (split from 910)'),('337','LA','SW Louisiana: Lake Charles, Lafayette (see split 318)'),('339','MA','Massachusetts: Boston suburbs, to the south and west (see splits 617, 508; overlaid on 781, eff 5/2/2001)'),('340','VI','US Virgin Islands (see also 809)'),('341','CA','(overlay on 510; SUSPENDED)'),('345','--','Cayman Islands'),('347','NY','New York (overlay for 718: NYC area, except Manhattan)'),('351','MA','Massachusetts: north of Boston to NH, 508, and 781 (overlaid on 978, eff 4/2/2001)'),('352','FL','Florida: Gainesville area, Ocala, Crystal River (split from 904)'),('360','WA','W Washington State: Olympia, Bellingham (except Seattle area; part of what used to be 206; see overlay 564)'),('361','TX','S Texas: Corpus Christi (split from 512; eff 2/13/99)'),('369','CA','Solano County (perm 12/02/00, mand 06/02/01)'),('380','OH','Ohio: Columbus (overlaid on 614; assigned but not in use)'),('385','UT','Utah: Salt Lake City Metro (split from 801, eff 3/30/02 POSTPONED; see also 435)'),('386','FL','N central Florida: Lake City (split from 904, perm 2/15/01, mand 11-05-01)'),('401','RI','Rhode Island'),('402','NE','E Nebraska: Omaha, Lincoln'),('403','AB','Canada: Southern Alberta (see 780, 867)'),('404','GA','N Georgia: Atlanta and suburbs (see overlay 678, split 770)'),('405','OK','W Oklahoma: Oklahoma City (see 580)'),('406','MT','Montana'),('407','FL','Central Florida: Metro Orlando (see overlay 689, eff 7/02; split 321)'),('408','CA','Cent. Coastal California: San Jose (see overlay 669)'),('409','TX','SE Texas: Galveston, Port Arthur, Beaumont (splits 936, 979)'),('410','MD','E Maryland: Baltimore, Annapolis, Chesapeake Bay area, Ocean City (see 443)'),('411','--','Reserved for special applications'),('412','PA','W Pennsylvania: Pittsburgh (see split 724, overlay 878)'),('413','MA','W Massachusetts: Springfield'),('414','WI','SE Wisconsin: Milwaukee County (see splits 920, 262)'),('415','CA','California: San Francisco County and Marin County on the north side of the Golden Gate Bridge, extending north to Sonoma County (see 650)'),('416','ON','Canada: S Cent. Ontario: Toronto (see overlay 647, eff 3/5/01)'),('417','MO','SW Missouri: Springfield'),('418','QC','Canada: NE Quebec: Quebec'),('419','OH','NW Ohio: Toledo (see overlay 567, perm 1/1/02)'),('423','TN','E Tennessee, except Knoxville metro area: Chattanooga, Bristol, Johnson City, Kingsport, Greeneville (see split 865; part of what used to be 615)'),('424','CA','S California: Los Angeles (see split 562; overlaid on 310 mand 7/26/2006)'),('425','WA','Washington: North Tier - Everett, Bellevue (split from 206, see also 253; overly 564)'),('430','TX','NE Texas: Tyler (overlaid on 903, eff 7/20/02)'),('432','TX','W Texas: Big Spring, Midland, Odessa (split from 915, eff 4/5/2003)'),('434','VA','E Virginia: Charlottesville, Lynchburg, Danville, South Boston, and Emporia (split from 804, eff 6/1/01; see also 757)'),('435','UT','Rural Utah outside Salt Lake City metro (see split 801)'),('438','QC','Canada: SW Quebec: Montreal city (overlaid on 514, [delayed until 6/06] eff 10/10/03, mand 2/7/04)'),('440','OH','Ohio: Cleveland metro area, excluding Cleveland (split from 216, see also 330)'),('441','--','Bermuda (part of what used to be 809)'),('442','CA','Far north suburbs of San Diego (Oceanside, Escondido, SUSPENDED -- originally perm 10/21/00, mand 04/14/01)'),('443','MD','E Maryland: Baltimore, Annapolis, Chesapeake Bay area, Ocean City (overlaid on 410)'),('450','QC','Canada: Southeastern Quebec; suburbs outside metro Montreal'),('456','--','Inbound International'),('464','IL','Illinois: south suburbs of Chicago (see 630; overlaid on 708)'),('469','TX','Texas: Dallas Metro (overlays 214/972)'),('470','GA','Georgia: Greater Atlanta Metropolitan Area (overlaid on 404/770/678; mand 9/2/01)'),('473','--','Grenada (\"new\" -- split from 809)'),('475','CT','Connecticut: New Haven, Greenwich, southwestern (postponed; was perm 01/06/01; mand 03/01/01???)'),('478','GA','Central Georgia: Macon (split from 912; see also 229; perm 08/01/00; mand 08/01/01)'),('479','AR','NW Arkansas: Fort Smith, Fayetteville, Springdale, Bentonville (SPLIt from 501, perm 01/19/02, mand 07/20/02)'),('480','AZ','Arizona: East Phoenix (see 520; also Phoenix split 602, 623)'),('484','PA','SE Pennsylvania: Allentown, Bethlehem, Reading, West Chester, Norristown (see 610)'),('500','--','Personal Communication Service'),('501','AR','Central Arkansas: Little Rock, Hot Springs, Conway (see split 479)'),('502','KY','N Central Kentucky: Louisville (see 270)'),('503','OR','Oregon (see 541, 971)'),('504','LA','E Louisiana: New Orleans metro area (see splits 225, 985)'),('505','NM','New Mexico'),('506','NB','Canada: New Brunswick'),('507','MN','S Minnesota: Rochester, Mankato, Worthington'),('508','MA','Cent. Massachusetts: Framingham; Cape Cod (see split 978, overlay 774)'),('509','WA','E and Central Washington state: Spokane, Yakima, Walla Walla, Ellensburg'),('510','CA','California: Oakland, East Bay (see 925)'),('511','--','Nationwide travel information'),('512','TX','S Texas: Austin (see split 361; overlay 737, perm 11/10/01)'),('513','OH','SW Ohio: Cincinnati (see split 937; overlay 283 cancelled)'),('514','QC','Canada: SW Quebec: Montreal city (see overlay 438, eff 10/10/03, mand 2/7/04)'),('515','IA','Cent. Iowa: Des Moines (see split 641)'),('516','NY','New York: Nassau County, Long Island; Hempstead (see split 631)'),('517','MI','Cent. Michigan: Lansing (see split 989)'),('518','NY','NE New York: Albany'),('519','ON','Canada: SW Ontario: Windsor (see overlay 226)'),('520','AZ','SE Arizona: Tucson area (split from 602; see split 928)'),('530','CA','NE California: Eldorado County area, excluding Eldorado Hills itself: incl cities of Auburn, Chico, Redding, So. Lake Tahoe, Marysville, Nevada City/Grass Valley (split from 916)'),('540','VA','Western and Southwest Virginia: Shenandoah and Roanoke valleys: Fredericksburg, Harrisonburg, Roanoke, Salem, Lexington and nearby areas (see split 276; split from 703)'),('541','OR','Oregon: Eugene, Medford (split from 503; 503 retains NW part [Portland/Salem], all else moves to 541; eastern oregon is UTC-7)'),('551','NJ','N New Jersey: Jersey City, Hackensack (overlaid on 201)'),('555','--','Reserved for directory assistance applications'),('557','MO','SE Missouri: St Louis metro area only (cancelled: overlaid on 314)'),('559','CA','Central California: Fresno (split from 209)'),('561','FL','S. Central Florida: Palm Beach County (West Palm Beach, Boca Raton, Vero Beach; see split 772, eff 2/11/02; mand 11/11/02)'),('562','CA','California: Long Beach (split from 310 Los Angeles)'),('563','IA','E Iowa: Davenport, Dubuque (split from 319, eff 3/25/01)'),('564','WA','W Washington State: Olympia, Bellingham (overlaid on 360; see also 206, 253, 425; assigned but not in use)'),('567','OH','NW Ohio: Toledo (overlaid on 419, perm 1/1/02)'),('570','PA','NE and N Central Pennsylvania: Wilkes-Barre, Scranton (see 717)'),('571','VA','Northern Virginia: Arlington, McLean, Tysons Corner (to be overlaid on 703 3/1/2000; see earlier split 540)'),('573','MO','SE Missouri: excluding St Louis metro area, includes Central/East Missouri, area between St. Louis and Kansas City'),('574','IN','N Indiana: Elkhart, South Bend (split from 219)'),('580','OK','W Oklahoma (rural areas outside Oklahoma City; split from 405)'),('585','NY','NW New York: Rochester (split from 716)'),('586','MI','Michigan: Macomb County (split from 810; perm 9/22/01, mand 3/23/02)'),('600','--','Canadian Services'),('601','MS','Mississippi: Meridian, Jackson area (see splits 228, 662; overlay 769)'),('602','AZ','Arizona: Phoenix (see 520; also Phoenix split 480, 623)'),('603','NH','New Hampshire'),('604','BC','Canada: British Columbia: Greater Vancouver (overlay 778, perm 11/3/01; see 250)'),('605','SD','South Dakota'),('606','KY','E Kentucky: area east of Frankfort: Ashland (see 859)'),('607','NY','S Cent. New York: Ithaca, Binghamton; Catskills'),('608','WI','SW Wisconsin: Madison'),('609','NJ','S New Jersey: Trenton (see 856)'),('610','PA','SE Pennsylvania: Allentown, Bethlehem, Reading, West Chester, Norristown (see overlays 484, 835)'),('611','--','Reserved for special applications'),('612','MN','Cent. Minnesota: Minneapolis (split from St. Paul, see 651; see splits 763, 952)'),('613','ON','Canada: SE Ontario: Ottawa'),('614','OH','SE Ohio: Columbus (see overlay 380)'),('615','TN','Northern Middle Tennessee: Nashville metro area (see 423, 931)'),('616','MI','W Michigan: Holland, Grand Haven, Greenville, Grand Rapids, Ionia (see split 269)'),('617','MA','Massachusetts: greater Boston (see overlay 857)'),('618','IL','S Illinois: Centralia'),('619','CA','S California: San Diego (see split 760; overlay 858, 935)'),('620','KS','S Kansas: Wichita (split from 316; perm 2/3/01)'),('623','AZ','Arizona: West Phoenix (see 520; also Phoenix split 480, 602)'),('626','CA','E S California: Pasadena (split from 818 Los Angeles)'),('627','CA','Napa, Sonoma counties (perm 10/13/01, mand 04/13/02)'),('628','CA','(Region unknown; perm 10/21/00)'),('630','IL','W NE Illinois, western suburbs of Chicago (part of what used to be 708; overlay 331)'),('631','NY','New York: Suffolk County, Long Island; Huntington, Riverhead (split 516)'),('636','MO','Missouri: W St. Louis metro area of St. Louis county, St. Charles County, Jefferson County area south (between 314 and 573)'),('641','IA','Iowa: Mason City, Marshalltown, Creston, Ottumwa (split from 515; perm 07/09/00)'),('646','NY','New York (overlay 212/917) NYC: Manhattan only'),('647','ON','Canada: S Cent. Ontario: Toronto (overlaid on 416; eff 3/5/01)'),('649','--','Turks & Caicos Islands'),('650','CA','California: Peninsula south of San Francisco -- San Mateo County, parts of Santa Clara County (split from 415)'),('651','MN','Cent. Minnesota: St. Paul (split from Minneapolis, see 612)'),('660','MO','N Missouri (split from 816)'),('661','CA','California: N Los Angeles, Mckittrick, Mojave, Newhall, Oildale, Palmdale, Taft, Tehachapi, Bakersfield, Earlimart, Lancaster (split from 805)'),('662','MS','N Mississippi: Tupelo, Grenada (split from 601)'),('664','--','Montserrat (split from 809)'),('669','CA','Cent. Coastal California: San Jose (rejected was: overlaid on 408)'),('670','MP','Commonwealth of the Northern Mariana Islands (CNMI, US Commonwealth)'),('671','GU','Guam'),('678','GA','N Georgia: metropolitan Atlanta (overlay; see 404, 770)'),('679','MI','Michigan: Dearborn area (overlaid on 313; assigned but not in use)'),('682','TX','Texas: Fort Worth areas (perm 10/7/00, mand 12/9/00)'),('684','--','American Samoa'),('689','FL','Central Florida: Metro Orlando (see overlay 321; overlaid on 407, assigned but not in use)'),('700','--','Interexchange Carrier Services'),('701','ND','North Dakota'),('702','NV','S. Nevada: Clark County, incl Las Vegas (see 775)'),('703','VA','Northern Virginia: Arlington, McLean, Tysons Corner (see split 540; overlay 571)'),('704','NC','W North Carolina: Charlotte (see split 828, overlay 980)'),('705','ON','Canada: NE Ontario: Sault Ste. Marie/N Ontario: N Bay, Sudbury'),('706','GA','N Georgia: Columbus, Augusta (see overlay 762)'),('707','CA','NW California: Santa Rosa, Napa, Vallejo, American Canyon, Fairfield'),('708','IL','Illinois: southern and western suburbs of Chicago (see 630; overlay 464)'),('709','NL','Canada: Newfoundland and Labrador'),('710','--','US Government'),('711','--','Telecommunications Relay Services'),('712','IA','W Iowa: Council Bluffs'),('713','TX','Mid SE Texas: central Houston (split, 281; overlay 832)'),('714','CA','North and Central Orange County (see split 949)'),('715','WI','N Wisconsin: Eau Claire, Wausau, Superior'),('716','NY','NW New York: Buffalo (see split 585)'),('717','PA','E Pennsylvania: Harrisburg (see split 570)'),('718','NY','New York City, New York (Queens, Staten Island, The Bronx, and Brooklyn; see 212, 347)'),('719','CO','SE Colorado: Pueblo, Colorado Springs'),('720','CO','Central Colorado: Denver (overlaid on 303)'),('724','PA','SW Pennsylvania (areas outside metro Pittsburgh; split from 412)'),('727','FL','Florida Tampa Metro: Saint Petersburg, Clearwater (Pinellas and parts of Pasco County; split from 813)'),('731','TN','W Tennessee: outside Memphis metro area (split from 901, perm 2/12/01, mand 9/17/01)'),('732','NJ','Cent. New Jersey: Toms River, New Brunswick, Bound Brook (see overlay 848)'),('734','MI','SE Michigan: west and south of Detroit -- Ann Arbor, Monroe (split from 313)'),('737','TX','S Texas: Austin (overlaid on 512, suspended; see also 361)'),('740','OH','SE Ohio (rural areas outside Columbus; split from 614)'),('747','CA','S California: Los Angeles, Agoura Hills, Calabasas, Hidden Hills, and Westlake Village (see 818; implementation suspended)'),('754','FL','Florida: Broward County area, incl Ft. Lauderdale (overlaid on 954; perm 8/1/01, mand 9/1/01)'),('757','VA','E Virginia: Tidewater / Hampton Roads area -- Norfolk, Virginia Beach, Chesapeake, Portsmouth, Hampton, Newport News, Suffolk (part of what used to be 804)'),('758','--','St. Lucia (split from 809)'),('760','CA','California: San Diego North County to Sierra Nevada (split from 619)'),('762','GA','N Georgia: Columbus, Augusta (overlaid on 706)'),('763','MN','Minnesota: Minneapolis metro area (split from 612; see also 952)'),('764','CA','(overlay on 650; SUSPENDED)'),('765','IN','Indiana: outside Indianapolis (split from 317)'),('767','--','Dominica (split from 809)'),('769','MS','Mississippi: Meridian, Jackson area (overlaid on 601; perm 7/19/04, mand 3/14/05)'),('770','GA','Georgia: Atlanta suburbs: outside of I-285 ring road (part of what used to be 404; see also overlay 678)'),('772','FL','S. Central Florida: St. Lucie, Martin, and Indian River counties (split from 561; eff 2/11/02; mand 11/11/02)'),('773','IL','Illinois: city of Chicago, outside the loop (see 312; overlay 872)'),('774','MA','Cent. Massachusetts: Framingham; Cape Cod (see split 978, overlaid on 508, eff 4/2/2001)'),('775','NV','N. Nevada: Reno (all of NV except Clark County area; see 702)'),('778','BC','Canada: British Columbia: Greater Vancouver (overlaid on 604, per 11/3/01; see also 250)'),('779','IL','NW Illinois: Rockford, Kankakee (overlaid on 815; eff 8/19/2006, mand 2/17/2007)'),('780','AB','Canada: Northern Alberta, north of Lacombe (see 403)'),('781','MA','Massachusetts: Boston surburbs, to the north and west (see splits 617, 508; overlay 339)'),('784','--','St. Vincent & Grenadines (split from 809)'),('785','KS','N & W Kansas: Topeka (split from 913)'),('786','FL','SE Florida, Monroe County (Miami; overlaid on 305)'),('787','PR','Puerto Rico (see overlay 939, perm 8/1/01)'),('800','--','US/Canada toll free (see 888, 877, 866, 855, 844, 833, 822)'),('801','UT','Utah: Salt Lake City Metro (see split 385, eff 3/30/02; see also split 435)'),('802','VT','Vermont'),('803','SC','South Carolina: Columbia, Aiken, Sumter (see 843, 864)'),('804','VA','E Virginia: Richmond (see splits 757, 434)'),('805','CA','S Cent. and Cent. Coastal California: Ventura County, Santa Barbara County: San Luis Obispo, Thousand Oaks, Carpinteria, Santa Barbara, Santa Maria, Lompoc, Santa Ynez Valley / Solvang (see 661 split)'),('806','TX','Panhandle Texas: Amarillo, Lubbock'),('807','ON','Canada: W Ontario: Thunder Bay region to Manitoba border'),('808','HI','Hawaii'),('809','--','Dominican Republic (see splits 264, 268, 284, 340, 441, 473, 664, 758, 767, 784, 868, 876; overlay 829)'),('810','MI','E Michigan: Flint, Pontiac (see 248; split 586)'),('811','--','Reserved for special applications'),('812','IN','S Indiana: Evansville, Cincinnati outskirts in IN, Columbus, Bloomington (mostly GMT-5*)'),('813','FL','SW Florida: Tampa Metro (splits 727 St. Petersburg, Clearwater, and 941 Sarasota)'),('814','PA','Cent. Pennsylvania: Erie'),('815','IL','NW Illinois: Rockford, Kankakee (see overlay 779; eff 8/19/2006, mand 2/17/2007)'),('816','MO','N Missouri: Kansas City (see split 660, overlay 975)'),('817','TX','N Cent. Texas: Fort Worth area (see 254, 940)'),('818','CA','S California: Los Angeles: San Fernando Valley (see 213, 310, 562, 626, 747)'),('819','QC','NW Quebec: Trois Rivieres, Sherbrooke, Outaouais (Gatineau, Hull), and the Laurentians (up to St Jovite / Tremblant) (see 867)'),('822','--','US/Canada toll free (proposed, may not be in use yet)'),('828','NC','W North Carolina: Asheville (split from 704)'),('829','--','Dominican Republic (perm 1/31/2005; mand 8/1/2005; overlaid on 809)'),('830','TX','Texas: region surrounding San Antonio (split from 210)'),('831','CA','California: central coast area from Santa Cruz through Monterey County'),('832','TX','Texas: Houston (overlay 713/281)'),('833','--','US/Canada toll free (proposed, may not be in use yet)'),('835','PA','SE Pennsylvania: Allentown, Bethlehem, Reading, West Chester, Norristown (overlaid on 610, eff 5/1/01; see also 484)'),('843','SC','South Carolina, coastal area: Charleston, Beaufort, Myrtle Beach (split from 803)'),('844','--','US/Canada toll free (proposed, may not be in use yet)'),('845','NY','New York: Poughkeepsie; Nyack, Nanuet, Valley Cottage, New City, Putnam, Dutchess, Rockland, Orange, Ulster and parts of Sullivan counties in New York\'s lower Hudson Valley and Delaware County in the Catskills (see 914; perm 6/5/2000)'),('847','IL','Northern NE Illinois: northwestern suburbs of chicago (Evanston, Waukegan, Northbrook; see overlay 224)'),('848','NJ','Cent. New Jersey: Toms River, New Brunswick, Bound Brook (see overlay 732)'),('850','FL','Florida panhandle, from east of Tallahassee to Pensacola (split from 904); western panhandle (Pensacola, Panama City) are UTC-6'),('855','--','US/Canada toll free (proposed, may not be in use yet)'),('856','NJ','SW New Jersey: greater Camden area, Mt Laurel (split from 609)'),('857','MA','Massachusetts: greater Boston (overlaid on 617, eff 4/2/2001)'),('858','CA','S California: San Diego (see split 760; overlay 619, 935)'),('859','KY','N and Central Kentucky: Lexington; suburban KY counties of Cincinnati OH metro area; Covington, Newport, Ft. Thomas, Ft. Wright, Florence (split from 606)'),('860','CT','Connecticut: areas outside of Fairfield and New Haven Counties (split from 203, overlay 959)'),('862','NJ','N New Jersey: Newark Paterson Morristown (overlaid on 973)'),('863','FL','Florida: Lakeland, Polk County (split from 941)'),('864','SC','South Carolina, upstate area: Greenville, Spartanburg (split from 803)'),('865','TN','E Tennessee: Knoxville, Knox and adjacent counties (split from 423; part of what used to be 615)'),('866','--','US/Canada toll free'),('867','YT','Canada: Yukon, Northwest Territories, Nunavut (split from 403/819)'),('868','--','Trinidad and Tobago (\"new\" -- see 809)'),('869','--','St. Kitts & Nevis'),('870','AR','Arkansas: areas outside of west/central AR: Jonesboro, etc'),('872','IL','Illinois: Chicago (downtown only -- in the loop; see 773; overlaid on 312 and 773)'),('876','--','Jamaica (split from 809)'),('877','--','US/Canada toll free'),('878','PA','Pittsburgh, New Castle (overlaid on 412, perm 8/17/01, mand t.b.a.)'),('880','--','Paid Toll-Free Service'),('881','--','Paid Toll-Free Service'),('882','--','Paid Toll-Free Service'),('888','--','US/Canada toll free'),('898','--','VoIP service'),('900','--','US toll calls -- prices vary with the number called'),('901','TN','W Tennessee: Memphis metro area (see 615, 931, split 731)'),('902','NS','Canada: Nova Scotia, Prince Edward Island'),('903','TX','NE Texas: Tyler (see overlay 430, eff 7/20/02)'),('904','FL','N Florida: Jacksonville (see splits 352, 386, 850)'),('905','ON','Canada: S Cent. Ontario: Greater Toronto Area -- Durham, Halton, Hamilton-Wentworth, Niagara, Peel, York, and southern Simcoe County (excluding Toronto -- see overlay 289 [eff 6/9/01], splits 416, 647)'),('906','MI','Upper Peninsula Michigan: Sault Ste. Marie, Escanaba, Marquette (UTC-5 towards the WI border)'),('907','AK','Alaska'),('908','NJ','Cent. New Jersey: Elizabeth, Basking Ridge, Somerville, Bridgewater'),('909','CA','California: Inland empire: San Bernardino (see split 951), Riverside'),('910','NC','S Cent. North Carolina: Fayetteville, Wilmington (see 336)'),('911','--','Emergency'),('912','GA','SE Georgia: Savannah (see splits 229, 478)'),('913','KS','Kansas: Kansas City area (see 785)'),('914','NY','S New York: Westchester County (see 845)'),('915','TX','W Texas: El Paso (see splits 325 eff 4/5/03; 432, eff 4/5/2003)'),('916','CA','NE California: Sacramento, Walnut Grove, Lincoln, Newcastle and El Dorado Hills (split to 530)'),('917','NY','New York: New York City (cellular, see 646)'),('918','OK','E Oklahoma: Tulsa'),('919','NC','E North Carolina: Raleigh (see split 252, overlay 984)'),('920','WI','NE Wisconsin: Appleton, Green Bay, Sheboygan, Fond du Lac (from Beaver Dam NE to Oshkosh, Appleton, and Door County; part of what used to be 414)'),('925','CA','California: Contra Costa area: Antioch, Concord, Pleasanton, Walnut Creek (split from 510)'),('927','FL','Florida: Cellular coverage in Orlando area'),('928','AZ','Central and Northern Arizona: Prescott, Flagstaff, Yuma (split from 520)'),('931','TN','Middle Tennessee: semi-circular ring around Nashville (split from 615)'),('935','CA','S California: San Diego (see split 760; overlay 858, 619; assigned but not in use)'),('936','TX','SE Texas: Conroe, Lufkin, Nacogdoches, Crockett (split from 409, see also 979)'),('937','OH','SW Ohio: Dayton (part of what used to be 513)'),('939','PR','Puerto Rico (overlaid on 787, perm 8/1/01)'),('940','TX','N Cent. Texas: Denton, Wichita Falls (split from 254, 817)'),('941','FL','SW Florida: Sarasota and Manatee counties (part of what used to be 813; see split 863)'),('947','MI','Michigan: Oakland County (overlays 248, perm 5/5/01)'),('949','CA','California: S Coastal Orange County (split from 714)'),('951','CA','California: W Riverside County (split from 909; eff 7/17/04)'),('952','MN','Minnesota: Minneapolis metro area, Bloomington (split from 612; see also 763)'),('954','FL','Florida: Broward County area, incl Ft. Lauderdale (part of what used to be 305, see overlay 754)'),('956','TX','Texas: Valley of Texas area; Harlingen, Laredo (split from 210)'),('957','NM','New Mexico (pending; region unknown)'),('959','CT','Connecticut: Hartford, New London (postponed; was overlaid on 860 perm 1/6/01; mand 3/1/01???)'),('969','MD','Maryland: Severn area (eff ???)'),('970','CO','N and W Colorado (part of what used to be 303)'),('971','OR','Oregon: Metropolitan Portland, Salem/Keizer area, incl Cricket Wireless (see 503; perm 10/1/00)'),('972','TX','Texas: Dallas Metro (overlays 214/469)'),('973','NJ','N New Jersey: Newark, Paterson, Morristown (see overlay 862; split from 201)'),('975','MO','N Missouri: Kansas City (overlaid on 816)'),('976','--','Pay services'),('978','MA','Massachusetts: north of Boston to NH (see split 978 -- this is the northern half of old 508; see overlay 351)'),('979','TX','SE Texas: Bryan, College Station, Bay City (split from 409, see also 936)'),('980','NC','North Carolina: (overlay on 704; perm 5/1/00, mand 3-15-01)'),('984','NC','E North Carolina: Raleigh (overlaid on 919, perm 8/1/01, mand 2/5/02 POSTPONED)'),('985','LA','E Louisiana: SE/N shore of Lake Pontchartrain: Hammond, Slidell, Covington, Amite, Kentwood, area SW of New Orleans, Houma, Thibodaux, Morgan City (split from 504; perm 02/12/2001; mand 10/22/01)'),('989','MI','Upper central Michigan: Mt Pleasant, Saginaw (split from 517; perm 4/7/01)');
UNLOCK TABLES;
/*!40000 ALTER TABLE `areacode` ENABLE KEYS */;

--
-- Table structure for table `chillispot`
--

DROP TABLE IF EXISTS `chillispot`;
CREATE TABLE `chillispot` (
  `conf_file` varchar(255) NOT NULL default '/etc/chilli.conf',
  `bin_file` varchar(255) default NULL,
  `ipup_script` varchar(255) default NULL,
  `ipdown_script` varchar(255) default NULL,
  `conup_script` varchar(255) default NULL,
  `condown_script` varchar(255) default NULL,
  `network` varchar(255) default NULL,
  `dynip` varchar(255) default NULL,
  `statip` varchar(255) default NULL,
  `dns1` varchar(255) default NULL,
  `dns2` varchar(255) default NULL,
  `domain` varchar(255) default NULL,
  `coaport` varchar(255) default NULL,
  `coanoipcheck` tinyint(1) default NULL,
  `dhcpif` varchar(255) default NULL,
  `radiuslisten` varchar(255) default NULL,
  `radiusserver1` varchar(255) default NULL,
  `radiusserver2` varchar(255) default NULL,
  `radiusauthport` varchar(255) default NULL,
  `radiusacctport` varchar(255) default NULL,
  `radiussecret` varchar(255) default NULL,
  `radiusnasid` varchar(255) default NULL,
  `radiuscalled` varchar(255) default NULL,
  `uamserver` varchar(255) default NULL,
  `uamhomepage` varchar(255) default NULL,
  `uamsecret` varchar(255) default NULL,
  `uamanydns` tinyint(1) default NULL,
  `location_id` int(11) NOT NULL default '1',
  `uamallowed` varchar(255) default NULL,
  `macauth` tinyint(4) default '0',
  `macallowed` varchar(255) default NULL,
  `macpasswd` varchar(80) default NULL,
  `macsuffix` varchar(30) default NULL,
  `debug` tinyint(4) default '0',
  PRIMARY KEY  (`conf_file`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chillispot`
--


/*!40000 ALTER TABLE `chillispot` DISABLE KEYS */;
LOCK TABLES `chillispot` WRITE;
INSERT INTO `chillispot` VALUES ('/etc/chilli.conf','/usr/sbin/chilli','','','','','19.168.182.0/24','19.168.182.0/24','','','','','',1,'eth1','','localhost','localhost','1812','','testing123','','','','','',1,-1,NULL,NULL,NULL,NULL,NULL,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `chillispot` ENABLE KEYS */;

--
-- Table structure for table `countrycode`
--

DROP TABLE IF EXISTS `countrycode`;
CREATE TABLE `countrycode` (
  `country_code` int(11) default NULL,
  `country_name` varchar(255) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countrycode`
--


/*!40000 ALTER TABLE `countrycode` DISABLE KEYS */;
LOCK TABLES `countrycode` WRITE;
INSERT INTO `countrycode` VALUES (1,'American Samoa'),(1,'Anguilla'),(1,'Antigua and Barbuda'),(1,'Bahamas (Commonwealth of the)'),(1,'Barbados'),(1,'Bermuda'),(1,'British Virgin Islands'),(1,'Canada'),(1,'Cayman Islands'),(1,'Dominica (Commonwealth of)'),(1,'Dominican Republic'),(1,'Grenada'),(1,'Guam'),(1,'Jamaica'),(1,'Montserrat'),(1,'Northern Mariana Islands (Commonwealth of the)'),(1,'Puerto Rico'),(1,'Saint Kitts and Nevis'),(1,'Saint Lucia'),(1,'Saint Vincent and the Grenadines'),(1,'Trinidad and Tobago'),(1,'Turks and Caicos Islands'),(1,'United States of America'),(1,'United States Virgin Islands'),(20,'Egypt (Arab Republic of)'),(212,'Morocco (Kingdom of)'),(213,'Algeria (People\'s Democratic Republic of)'),(216,'Tunisia'),(218,'Libya (Socialist People\'s Libyan Arab Jamahiriya)'),(220,'Gambia (Republic of the)'),(221,'Senegal (Republic of)'),(222,'Mauritania (Islamic Republic of)'),(223,'Mali (Republic of)'),(224,'Guinea (Republic of)'),(225,'CÃ´te d\'Ivoire (Republic of)'),(226,'Burkina Faso'),(227,'Niger (Republic of the)'),(228,'Togolese Republic'),(229,'Benin (Republic of)'),(230,'Mauritius (Republic of)'),(231,'Liberia (Republic of)'),(232,'Sierra Leone'),(233,'Ghana'),(234,'Nigeria (Federal Republic of)'),(235,'Chad (Republic of)'),(236,'Central African Republic'),(237,'Cameroon (Republic of)'),(238,'Cape Verde (Republic of)'),(239,'Sao Tome and Principe (Democratic Republic of)'),(240,'Equatorial Guinea (Republic of)'),(241,'Gabonese Republic'),(242,'Congo (Republic of the)'),(243,'Democratic Republic of the Congo'),(244,'Angola (Republic of)'),(245,'Guinea-Bissau (Republic of)'),(246,'Diego Garcia'),(247,'Ascension'),(248,'Seychelles (Republic of)'),(249,'Sudan (Republic of the)'),(250,'Rwanda (Republic of)'),(251,'Ethiopia (Federal Democratic Republic of)'),(252,'Somali Democratic Republic'),(253,'Djibouti (Republic of)'),(254,'Kenya (Republic of)'),(255,'Tanzania (United Republic of)'),(256,'Uganda (Republic of)'),(257,'Burundi (Republic of)'),(258,'Mozambique (Republic of)'),(260,'Zambia (Republic of)'),(261,'Madagascar (Republic of)'),(262,'Reunion and other French territories in the Indian Ocean'),(263,'Zimbabwe (Republic of)'),(264,'Namibia (Republic of)'),(265,'Malawi'),(266,'Lesotho (Kingdom of)'),(267,'Botswana (Republic of)'),(268,'Swaziland (Kingdom of)'),(269,'Comoros (Union of the)'),(269,'Mayotte'),(27,'South Africa (Republic of)'),(290,'Saint Helena'),(291,'Eritrea'),(297,'Aruba'),(298,'Faroe Islands'),(299,'Greenland (Denmark)'),(30,'Greece'),(31,'Netherlands (Kingdom of the)'),(32,'Belgium'),(33,'France'),(34,'Spain'),(350,'Gibraltar'),(351,'Portugal'),(352,'Luxembourg'),(353,'Ireland'),(354,'Iceland'),(355,'Albania (Republic of)'),(356,'Malta'),(357,'Cyprus (Republic of)'),(358,'Finland'),(359,'Bulgaria (Republic of)'),(36,'Hungary (Republic of)'),(370,'Lithuania (Republic of)'),(371,'Latvia (Republic of)'),(372,'Estonia (Republic of)'),(373,'Moldova (Republic of)'),(374,'Armenia (Republic of)'),(375,'Belarus (Republic of)'),(376,'Andorra (Principality of)'),(377,'Monaco (Principality of)'),(378,'San Marino (Republic of)'),(379,'Vatican City State'),(380,'Ukraine'),(381,'Serbia and Montenegro'),(385,'Croatia (Republic of)'),(386,'Slovenia (Republic of)'),(387,'Bosnia and Herzegovina'),(388,'Group of countries, shared code'),(389,'The Former Yugoslav Republic of Macedonia'),(39,'Italy'),(39,'Vatican City State'),(40,'Romania'),(41,'Switzerland (Confederation of)'),(420,'Czech Republic'),(421,'Slovak Republic'),(423,'Liechtenstein (Principality of)'),(43,'Austria'),(44,'United Kingdom of Great Britain and Northern Ireland'),(45,'Denmark'),(46,'Sweden'),(47,'Norway'),(48,'Poland (Republic of)'),(49,'Germany (Federal Republic of)'),(500,'Falkland Islands (Malvinas)'),(501,'Belize'),(502,'Guatemala (Republic of)'),(503,'El Salvador (Republic of)'),(504,'Honduras (Republic of)'),(505,'Nicaragua'),(506,'Costa Rica'),(507,'Panama (Republic of)'),(508,'Saint Pierre and Miquelon (CollectivitÃ© territoriale de la RÃ©publique franÃ§aise)'),(509,'Haiti (Republic of)'),(51,'Peru'),(52,'Mexico'),(53,'Cuba'),(54,'Argentine Republic'),(55,'Brazil (Federative Republic of)'),(56,'Chile'),(57,'Colombia (Republic of)'),(58,'Venezuela (Bolivarian Republic of)'),(590,'Guadeloupe (French Department of)'),(591,'Bolivia (Republic of)'),(592,'Guyana'),(593,'Ecuador'),(594,'French Guiana (French Department of)'),(595,'Paraguay (Republic of)'),(596,'Martinique (French Department of)'),(597,'Suriname (Republic of)'),(598,'Uruguay (Eastern Republic of)'),(599,'Netherlands Antilles'),(60,'Malaysia'),(61,'Australia'),(62,'Indonesia (Republic of)'),(63,'Philippines (Republic of the)'),(64,'New Zealand'),(65,'Singapore (Republic of)'),(66,'Thailand'),(670,'Democratic Republic of Timor-Leste'),(672,'Australian External Territories'),(673,'Brunei Darussalam'),(674,'Nauru (Republic of)'),(675,'Papua New Guinea'),(676,'Tonga (Kingdom of)'),(677,'Solomon Islands'),(678,'Vanuatu (Republic of)'),(679,'Fiji (Republic of)'),(680,'Palau (Republic of)'),(681,'Wallis and Futuna (Territoire franÃ§ais d\'outre-mer)'),(682,'Cook Islands'),(683,'Niue'),(685,'Samoa (Independent State of)'),(686,'Kiribati (Republic of)'),(687,'New Caledonia (Territoire franÃ§ais d\'outre-mer)'),(688,'Tuvalu'),(689,'French Polynesia (Territoire franÃ§ais d\'outre-mer)'),(690,'Tokelau'),(691,'Micronesia (Federated States of)'),(692,'Marshall Islands (Republic of the)'),(7,'Kazakhstan (Republic of)'),(7,'Russian Federation'),(800,'International Freephone Service'),(808,'International Shared Cost Service (ISCS)'),(81,'Japan'),(82,'Korea (Republic of)'),(84,'Viet Nam (Socialist Republic of)'),(850,'Democratic People\'s Republic of Korea'),(852,'Hong Kong, China'),(853,'Macao, China'),(855,'Cambodia (Kingdom of)'),(856,'Lao People\'s Democratic Republic'),(86,'China (People\'s Republic of)'),(870,'Inmarsat SNAC'),(871,'Inmarsat (Atlantic Ocean-East)'),(872,'Inmarsat (Pacific Ocean)'),(873,'Inmarsat (Indian Ocean)'),(874,'Inmarsat (Atlantic Ocean-West)'),(875,'Reserved Ã¢â?¬â?? Maritime Mobile Service Applications'),(876,'Reserved Ã¢â?¬â?? Maritime Mobile Service Applications'),(877,'Reserved Ã¢â?¬â?? Maritime Mobile Service Applications'),(878,'Universal Personal Telecommunication Service (UPT)'),(879,'Reserved for national non-commercial purposes'),(880,'Bangladesh (People\'s Republic of)'),(881,'Global Mobile Satellite System (GMSS), shared code'),(882,'International Networks, shared code');
UNLOCK TABLES;
/*!40000 ALTER TABLE `countrycode` ENABLE KEYS */;

--
-- Table structure for table `radiusprofile`
--

DROP TABLE IF EXISTS `radiusprofile`;
CREATE TABLE `radiusprofile` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `RadiusProfileName` varchar(64) default NULL,
  `Attribute` varchar(32) default NULL,
  `op` char(2) default '=',
  `Value` varchar(253) default NULL,
  `prio` int(10) unsigned default '0',
  `location_id` int(11) default NULL,
  `db` varchar(200) default 'radcheck',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `radiusprofile_template`
--

DROP TABLE IF EXISTS `radiusprofile_template`;
CREATE TABLE `radiusprofile_template` (
  `rp_name` varchar(255) default NULL,
  `location_id` int(11) default NULL,
  `rp_description` text,
  `ID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radiusprofile_template`
--

--
-- Table structure for table `bpradiusprofile`
--

DROP TABLE IF EXISTS `bpradiusprofile`;
CREATE TABLE `bpradiusprofile` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `BpName` varchar(64) default NULL,
  `RadiusProfileName` varchar(64) default NULL,
  `location_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;


--
-- Table structure for table `general_opt`
--

DROP TABLE IF EXISTS `general_opt`;
CREATE TABLE `general_opt` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `phpmyprepaid_path` varchar(200) default NULL,
  `cron_path` varchar(200) default NULL,
  `cron_bin` int(11) default '0',
  `rrdtool_bin` varchar(200) default NULL,
  `session_expire` int(11) default '0',
  `refresh` int(11) default '60',
  `apache_site_path` varchar(200) default NULL,
  `apache_bin` varchar(200) default NULL,
  `apache_ssl_dir` varchar(200) default NULL,
  `system_log_path` varchar(200) default NULL,
  `sudo_bin` varchar(200) default NULL,
  `mysqlclient` varchar(200) default NULL,
  `snmpwalk` varchar(200) default NULL,
  `location_id` int(11) default NULL,
  `snmpget` varchar(200) default NULL,
  PRIMARY KEY  (`id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `group_template`
--

DROP TABLE IF EXISTS `group_template`;
CREATE TABLE `group_template` (
  `gp_name` varchar(255) default NULL,
  `location_id` int(11) default NULL,
  `gp_description` text,
  `ID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_template`
--

LOCK TABLES `group_template` WRITE;
/*!40000 ALTER TABLE `group_template` DISABLE KEYS */;
INSERT INTO `group_template` VALUES ('EAP Account',1,'Useful for eap wifi account',2),('Disable for late payement',1,'Account we want to disable',3);
/*!40000 ALTER TABLE `group_template` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `isocode`
--

DROP TABLE IF EXISTS `isocode`;
CREATE TABLE `isocode` (
  `iso_code` varchar(3) NOT NULL,
  `iso_name` varchar(255) default NULL,
  PRIMARY KEY  (`iso_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isocode`
--


/*!40000 ALTER TABLE `isocode` DISABLE KEYS */;
LOCK TABLES `isocode` WRITE;
INSERT INTO `isocode` VALUES ('AD','ANDORRA'),('AE','UNITED ARAB EMIRATES'),('AF','AFGHANISTAN'),('AG','ANTIGUA AND BARBUDA'),('AI','ANGUILLA'),('AL','ALBANIA'),('AM','ARMENIA'),('AN','NETHERLANDS ANTILLES'),('AO','ANGOLA'),('AQ','ANTARCTICA'),('AR','ARGENTINA'),('AS','AMERICAN SAMOA'),('AT','AUSTRIA'),('AU','AUSTRALIA'),('AW','ARUBA'),('AX','ALAND ISLANDS'),('AZ','AZERBAIJAN'),('BA','BOSNIA AND HERZEGOVINA'),('BB','BARBADOS'),('BD','BANGLADESH'),('BE','BELGIUM'),('BF','BURKINA FASO'),('BG','BULGARIA'),('BH','BAHRAIN'),('BI','BURUNDI'),('BJ','BENIN'),('BM','BERMUDA'),('BN','BRUNEI DARUSSALAM'),('BO','BOLIVIA'),('BR','BRAZIL'),('BS','BAHAMAS'),('BT','BHUTAN'),('BV','BOUVET ISLAND'),('BW','BOTSWANA'),('BY','BELARUS'),('BZ','BELIZE'),('CA','CANADA'),('CC','COCOS (KEELING) ISLANDS'),('CD','CONGO THE DEMOCRATIC REPUBLIC OF THE'),('CF','CENTRAL AFRICAN REPUBLIC'),('CG','CONGO'),('CH','SWITZERLAND'),('CI','COTE D\'IVOIRE'),('CK','COOK ISLANDS'),('CL','CHILE'),('CM','CAMEROON'),('CN','CHINA'),('CO','COLOMBIA'),('CR','COSTA RICA'),('CU','CUBA'),('CV','CAPE VERDE'),('CX','CHRISTMAS ISLAND'),('CY','CYPRUS'),('CZ','CZECH REPUBLIC'),('DE','GERMANY'),('DJ','DJIBOUTI'),('DK','DENMARK'),('DM','DOMINICA'),('DO','DOMINICAN REPUBLIC'),('DZ','ALGERIA'),('EC','ECUADOR'),('EE','ESTONIA'),('EG','EGYPT'),('EH','WESTERN SAHARA'),('ER','ERITREA'),('ES','SPAIN'),('ET','ETHIOPIA'),('FI','FINLAND'),('FJ','FIJI'),('FK','FALKLAND ISLANDS (MALVINAS)'),('FM','MICRONESIA'),('FO','FAROE ISLANDS'),('FR','FRANCE'),('GA','GABON'),('GB','UNITED KINGDOM'),('GD','GRENADA'),('GE','GEORGIA'),('GF','FRENCH GUIANA'),('GG','GUERNSEY'),('GH','GHANA'),('GI','GIBRALTAR'),('GL','GREENLAND'),('GM','GAMBIA'),('GN','GUINEA'),('GP','GUADELOUPE'),('GQ','EQUATORIAL GUINEA'),('GR','GREECE'),('GS','SOUTH GEORGIA & SANDWICH ISLANDS'),('GT','GUATEMALA'),('GU','GUAM'),('GW','GUINEA-BISSAU'),('GY','GUYANA'),('HK','HONG KONG'),('HM','HEARD ISLAND AND MCDONALD ISLANDS'),('HN','HONDURAS'),('HR','CROATIA'),('HT','HAITI'),('HU','HUNGARY'),('ID','INDONESIA'),('IE','IRELAND'),('IL','ISRAEL'),('IM','ISLE OF MAN'),('IN','INDIA'),('IO','BRITISH INDIAN OCEAN TERRITORY'),('IQ','IRAQ'),('IR',' ISLAMIC REPUBLIC OF IRAN'),('IS','ICELAND'),('IT','ITALY'),('JE','JERSEY'),('JM','JAMAICA'),('JO','JORDAN'),('JP','JAPAN'),('KE','KENYA'),('KG','KYRGYZSTAN'),('KH','CAMBODIA'),('KI','KIRIBATI'),('KM','COMOROS'),('KN','SAINT KITTS AND NEVIS'),('KP','KOREA DEMOCRATIC PEOPLE\'S REPUBLIC OF'),('KR','REPUBLIC OF KOREA'),('KW','KUWAIT'),('KY','CAYMAN ISLANDS'),('KZ','KAZAKHSTAN'),('LA','LAO PEOPLE\'S DEMOCRATIC REPUBLIC'),('LB','LEBANON'),('LC','SAINT LUCIA'),('LI','LIECHTENSTEIN'),('LK','SRI LANKA'),('LR','LIBERIA'),('LS','LESOTHO'),('LT','LITHUANIA'),('LU','LUXEMBOURG'),('LV','LATVIA'),('LY','LIBYAN ARAB JAMAHIRIYA'),('MA','MOROCCO'),('MC','MONACO'),('MD','MOLDOVA'),('ME','MONTENEGRO'),('MG','MADAGASCAR'),('MH','MARSHALL ISLANDS'),('MK','MACEDONIA'),('ML','MALI'),('MM','MYANMAR'),('MN','MONGOLIA'),('MO','MACAO'),('MP','NORTHERN MARIANA ISLANDS'),('MQ','MARTINIQUE'),('MR','MAURITANIA'),('MS','MONTSERRAT'),('MT','MALTA'),('MU','MAURITIUS'),('MV','MALDIVES'),('MW','MALAWI'),('MX','MEXICO'),('MY','MALAYSIA'),('MZ','MOZAMBIQUE'),('NA','NAMIBIA'),('NC','NEW CALEDONIA'),('NE','NIGER'),('NF','NORFOLK ISLAND'),('NG','NIGERIA'),('NI','NICARAGUA'),('NL','NETHERLANDS'),('NO','NORWAY'),('NP','NEPAL'),('NR','NAURU'),('NU','NIUE'),('NZ','NEW ZEALAND'),('OM','OMAN'),('PA','PANAMA'),('PE','PERU'),('PF','FRENCH POLYNESIA'),('PG','PAPUA NEW GUINEA'),('PH','PHILIPPINES'),('PK','PAKISTAN'),('PL','POLAND'),('PM','SAINT PIERRE AND MIQUELON'),('PN','PITCAIRN'),('PR','PUERTO RICO'),('PS','PALESTINIAN TERRITORY'),('PT','PORTUGAL'),('PW','PALAU'),('PY','PARAGUAY'),('QA','QATAR'),('RE','REUNION'),('RO','ROMANIA'),('RS','SERBIA'),('RU','RUSSIAN FEDERATION'),('RW','RWANDA'),('SA','SAUDI ARABIA'),('SB','SOLOMON ISLANDS'),('SC','SEYCHELLES'),('SD','SUDAN'),('SE','SWEDEN'),('SG','SINGAPORE'),('SH','SAINT HELENA'),('SI','SLOVENIA'),('SJ','SVALBARD AND JAN MAYEN'),('SK','SLOVAKIA'),('SL','SIERRA LEONE'),('SM','SAN MARINO'),('SN','SENEGAL'),('SO','SOMALIA'),('SR','SURINAME'),('ST','SAO TOME AND PRINCIPE'),('SV','EL SALVADOR'),('SY','SYRIAN ARAB REPUBLIC'),('SZ','SWAZILAND'),('TC','TURKS AND CAICOS ISLANDS'),('TD','CHAD'),('TF','FRENCH SOUTHERN TERRITORIES'),('TG','TOGO'),('TH','THAILAND'),('TJ','TAJIKISTAN'),('TK','TOKELAU'),('TL','TIMOR-LESTE'),('TM','TURKMENISTAN'),('TN','TUNISIA'),('TO','TONGA'),('TR','TURKEY'),('TT','TRINIDAD AND TOBAGO'),('TV','TUVALU'),('TW','TAIWAN'),('TZ','TANZANIA'),('UA','UKRAINE'),('UG','UGANDA'),('UM','UNITED STATES MINOR OUTLYING ISLANDS'),('US','UNITED STATES'),('UY','URUGUAY'),('UZ','UZBEKISTAN'),('VA','HOLY SEE (VATICAN CITY STATE)'),('VC','SAINT VINCENT AND THE GRENADINES'),('VE','VENEZUELA'),('VG','VIRGIN ISLANDS'),('VI','VIRGIN ISLANDS'),('VN','VIET NAM'),('VU','VANUATU'),('WF','WALLIS AND FUTUNA'),('WS','SAMOA'),('YE','YEMEN'),('YT','MAYOTTE'),('ZA','SOUTH AFRICA'),('ZM','ZAMBIA'),('ZW','ZIMBABWE');
UNLOCK TABLES;
/*!40000 ALTER TABLE `isocode` ENABLE KEYS */;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `ID` int(11) NOT NULL auto_increment,
  `LocationName` varchar(40) NOT NULL default '',
  `LocationDomain` varchar(60) NOT NULL default '',
  `LocationState` char(3) NOT NULL default '',
  `LocationCity` varchar(40) NOT NULL default '',
  `LocationCountry` char(2) NOT NULL default '',
  `locationE164Country` int(11) NOT NULL,
  `LocationOrganisation` varchar(60) default NULL,
  `LocationServerName` varchar(60) default NULL,
  `LocationStreet` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--



DROP TABLE IF EXISTS `mtotacct`;
CREATE TABLE `mtotacct` (
  `MTotAcctId` bigint(21) NOT NULL auto_increment,
  `UserName` varchar(64) NOT NULL default '',
  `AcctDate` date NOT NULL default '0000-00-00',
  `ConnNum` bigint(12) default NULL,
  `ConnTotDuration` bigint(12) default NULL,
  `ConnMaxDuration` bigint(12) default NULL,
  `ConnMinDuration` bigint(12) default NULL,
  `InputOctets` bigint(12) default NULL,
  `OutputOctets` bigint(12) default NULL,
  `NASIPAddress` varchar(15) default NULL,
  PRIMARY KEY  (`MTotAcctId`),
  KEY `UserName` (`UserName`),
  KEY `AcctDate` (`AcctDate`),
  KEY `UserOnDate` (`UserName`,`AcctDate`),
  KEY `NASIPAddress` (`NASIPAddress`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mtotacct`
--


/*!40000 ALTER TABLE `mtotacct` DISABLE KEYS */;
LOCK TABLES `mtotacct` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `mtotacct` ENABLE KEYS */;

--
-- Table structure for table `nas`
--

DROP TABLE IF EXISTS `nas`;
CREATE TABLE `nas` (
  `id` int(10) NOT NULL auto_increment,
  `nasname` varchar(128) NOT NULL,
  `shortname` varchar(32) default NULL,
  `type` varchar(30) default 'other',
  `ports` int(5) default NULL,
  `secret` varchar(60) NOT NULL default 'secret',
  `community` varchar(50) default NULL,
  `description` varchar(200) default 'RADIUS Client',
  PRIMARY KEY  (`id`),
  KEY `nasname` (`nasname`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nas`
--


--
-- Table structure for table `paypal`
--

DROP TABLE IF EXISTS `paypal`;
CREATE TABLE `paypal` (
  `ID` int(11) NOT NULL auto_increment,
  `account` varchar(200) default NULL,
  `currency_code` varchar(3) default NULL,
  `location` varchar(2) default NULL,
  `email` varchar(200) default NULL,
  `subject` varchar(255) default NULL,
  `headers` varchar(255) default NULL,
  `pptoken` varchar(300) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paypal`
--


-- Table structure for table `pdf_print`
--

DROP TABLE IF EXISTS `pdf_print`;
CREATE TABLE `pdf_print` (
  `avery_name` varchar(250) NOT NULL default '',
  `margin_left` double(11,2) default NULL,
  `margin_top` double(11,2) default NULL,
  `x_space` double(11,2) default NULL,
  `y_space` double(11,2) default '0.00',
  `x_number` int(11) default '3',
  `y_number` int(11) default '0',
  `width` double(11,2) default NULL,
  `height` double(11,2) default NULL,
  `char_size` int(11) default '12',
  `font_name` varchar(255) default NULL,
  `font_color` varchar(200) default 'black',
  `line_height` int(11) default '10',
  `metric` varchar(255) default NULL,
  `paper_size` varchar(255) default 'A4',
  `background_image` varchar(255) default NULL,
  `logo_image` varchar(255) default NULL,
  `print_template` tinyint(1) default NULL,
  `print_cross` tinyint(4) default NULL,
  `print_point` tinyint(4) default NULL,
  `location_id` int(11) default NULL,
  `card_type_text` varchar(255) default NULL,
  `login_text` varchar(200) default NULL,
  `passwd_text` varchar(255) default NULL,
  `validity_text` varchar(255) default NULL,
  `template_name` varchar(255) default NULL,
  `template_image` varchar(200) default NULL,
  `format_text` varchar(255) default NULL,
  `font_style` varchar(10) default NULL,
  `location_text` varchar(255) default NULL,
  `header_text` varchar(255) default NULL,
  `footer_text` varchar(255) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pdf_print`
--


/*!40000 ALTER TABLE `pdf_print` DISABLE KEYS */;
LOCK TABLES `pdf_print` WRITE;
INSERT INTO `pdf_print` VALUES ('CARD',0.00,0.00,0.00,0.00,0,0,0.00,0.00,8,'Helvetica','#b2b4d6',0,'','','images/logo2.jpg','',NULL,1,1,-1,'Prepaid internet cards','Login : ','Password :','Validity :','default',NULL,'\\n\\n\\n\\n\\n%s    \\n\\n%s    \\n%s   \\n%s  \\n%s','Bold','Location :','','');
UNLOCK TABLES;
/*!40000 ALTER TABLE `pdf_print` ENABLE KEYS */;

--
-- Table structure for table `phpmyprepaid`
--

DROP TABLE IF EXISTS `phpmyprepaid`;
CREATE TABLE `phpmyprepaid` (
  `client_name` varchar(300) NOT NULL default 'Hotspot Prepaid',
  `banner_path` varchar(200) default NULL,
  `logo_path` varchar(200) default NULL,
  `crypt` varchar(200) default NULL,
  `main_text` varchar(200) default NULL,
  `default_timetofinish` tinyint(1) default NULL,
  `default_simultanous_use` int(11) default NULL,
  `use_domain_name` tinyint(1) default NULL,
  `use_disconnect_feature` tinyint(1) default NULL,
  `display_date_format` varchar(9) default NULL,
  `gateway_type` varchar(200) default NULL,
  `default_idle_timeout` int(11) default NULL,
  `default_accounting_interval` int(11) default NULL,
  `max_month_old` int(11) default NULL,
  `maximun_cards` int(11) default NULL,
  `minimun_time_sold` int(11) default NULL,
  `minimun_moctet_sold` int(11) default NULL,
  `maximun_time_sold` int(11) default NULL,
  `maximun_moctet_sold` int(11) default NULL,
  `default_name_length` int(11) NOT NULL,
  `redirection_url` varchar(250) default NULL,
  `logoff_url` varchar(250) default NULL,
  `reply_message` varchar(250) default NULL,
  `uam_allowed` varchar(400) default NULL,
  `mac_allowed` varchar(400) default NULL,
  `location_id` int(11) NOT NULL default '1',
  `uname_prefix` varchar(255) default NULL,
  `location_nas_identifier` varchar(255) default NULL,
  `use_caps` varchar(255) default NULL,
  `default_passwd_length` int(11) NOT NULL,
  `octet_type` varchar(50) default NULL,
  `use_pid` tinyint(4) default '0',
  `use_numeric` tinyint(4) default NULL,
  `default_currency` varchar(10) default NULL,
  `use_pid_passwd` varchar(100) default NULL,
  `uname_suffix` varchar(255) default NULL,
  PRIMARY KEY  (`location_id`,`client_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phpmyprepaid`
--

LOCK TABLES `phpmyprepaid` WRITE;
/*!40000 ALTER TABLE `phpmyprepaid` DISABLE KEYS */;
INSERT INTO `phpmyprepaid` VALUES ('Hotspot Prepaid','images/banner.png','images/logo.png','clear','Welcome to PhpMyPrepaid',0,0,0,1,'d-m-Y H:i','chillispot',0,0,6,100,1,1,1000000000,99999999,6,'','','','','',-1,'','4','0',0,'Upload',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `phpmyprepaid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radacct`
--

DROP TABLE IF EXISTS `radacct`;
CREATE TABLE `radacct` (
  `RadAcctId` bigint(21) NOT NULL auto_increment,
  `AcctSessionId` varchar(64) NOT NULL default '',
  `AcctUniqueId` varchar(32) NOT NULL default '',
  `UserName` varchar(64) NOT NULL default '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `Realm` varchar(64) default '',
  `NASIPAddress` varchar(15) NOT NULL default '',
  `NASPortId` int(12) default NULL,
  `NASPortType` varchar(32) default NULL,
  `AcctStartTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `AcctStopTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `AcctSessionTime` int(12) default NULL,
  `AcctAuthentic` varchar(32) default NULL,
  `ConnectInfo_start` varchar(32) default NULL,
  `ConnectInfo_stop` varchar(32) default NULL,
  `AcctInputOctets` bigint(20) default NULL,
  `AcctInputGigawords` TINYINT UNSIGNED DEFAULT 0,
  `AcctOutputGigawords` TINYINT UNSIGNED DEFAULT 0,
  `AcctOutputOctets` bigint(20) default NULL,
  `CalledStationId` varchar(50) NOT NULL default '',
  `CallingStationId` varchar(50) NOT NULL default '',
  `AcctTerminateCause` varchar(32) NOT NULL default '',
  `ServiceType` varchar(32) default NULL,
  `FramedProtocol` varchar(32) default NULL,
  `FramedIPAddress` varchar(15) NOT NULL default '',
  `AcctStartDelay` int(12) default NULL,
  `AcctStopDelay` int(12) default NULL,
  `xascendsessionsvrkey` varchar(10) DEFAULT NULL,
  PRIMARY KEY  (`RadAcctId`),
  KEY `UserName` (`UserName`),
  KEY `FramedIPAddress` (`FramedIPAddress`),
  KEY `AcctSessionId` (`AcctSessionId`),
  KEY `AcctUniqueId` (`AcctUniqueId`),
  KEY `AcctStartTime` (`AcctStartTime`),
  KEY `AcctStopTime` (`AcctStopTime`),
  KEY `NASIPAddress` (`NASIPAddress`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radacct`
--


/*!40000 ALTER TABLE `radacct` DISABLE KEYS */;
LOCK TABLES `radacct` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `radacct` ENABLE KEYS */;

--
-- Table structure for table `radcheck`
--

DROP TABLE IF EXISTS `radcheck`;
CREATE TABLE `radcheck` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `UserName` varchar(32) NOT NULL default '',
  `Attribute` varchar(32) NOT NULL default '',
  `op` char(2) NOT NULL default '==',
  `Value` varchar(253) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `UserName` (`UserName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radcheck`
--

--
-- Table structure for table `radgroupcheck`
--

DROP TABLE IF EXISTS `radgroupcheck`;
CREATE TABLE `radgroupcheck` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `GroupName` varchar(64) NOT NULL default '',
  `Attribute` varchar(64) NOT NULL default '',
  `op` char(2) NOT NULL default '==',
  `Value` varchar(253) NOT NULL default '',
  `location_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `GroupName` (`GroupName`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radgroupcheck`
--

LOCK TABLES `radgroupcheck` WRITE;
/*!40000 ALTER TABLE `radgroupcheck` DISABLE KEYS */;
INSERT INTO `radgroupcheck` VALUES (1,'EAP Account','Auth-Type',':=','EAP',1),(2,'Disable for late payement','Auth-Type',':=','Reject',1);
/*!40000 ALTER TABLE `radgroupcheck` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `radgroupreply`
--

DROP TABLE IF EXISTS `radgroupreply`;
CREATE TABLE `radgroupreply` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `GroupName` varchar(64) NOT NULL default '',
  `Attribute` varchar(32) NOT NULL default '',
  `op` char(2) NOT NULL default '=',
  `Value` varchar(253) NOT NULL default '',
  `prio` int(10) unsigned NOT NULL default '0',
  `location_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `GroupName` (`GroupName`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radgroupreply`
--

--
-- Table structure for table `radius_attribute`
--

DROP TABLE IF EXISTS `radius_attribute`;
CREATE TABLE `radius_attribute` (
  `attribute` varchar(200) NOT NULL,
  `default_value` varchar(200) default NULL,
  `description` varchar(255) default NULL,
  `enum_value` varchar(255) default NULL,
  `gp_database` varchar(40) default NULL,
  `category` varchar(200) default NULL,
  PRIMARY KEY  (`attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radius_attribute`
--


LOCK TABLES `radius_attribute` WRITE;
/*!40000 ALTER TABLE `radius_attribute` DISABLE KEYS */;
INSERT INTO `radius_attribute` VALUES ('Auth-Type','Login','Authorization different value','Local;Pam;Accept;Reject;System;EAP','radcheck','Divers'),('Callback-ID',NULL,NULL,NULL,'radreply','Callback'),('Callback-Number',NULL,NULL,NULL,'radreply','Callback'),('Callback-Station-ID',NULL,NULL,NULL,'radcheck','Callback'),('Calling-Station-ID',NULL,'MAC address of client',NULL,'radcheck','Divers'),('Filter-ID',NULL,NULL,NULL,'radreply','Divers'),('Framed-Compression','Van-Jacobsen-Header-Compression',NULL,'None;Van-Jacobson-TCP-IP;Van-Jacobsen-Header-Compression;IPX-Header-Compression;Stac-LZS-Compression','radreply','Framed'),('Framed-IP-Address',NULL,NULL,NULL,'radreply','Framed'),('Framed-IP-Netmask',NULL,NULL,NULL,'radreply','Framed'),('Framed-IPX-Network',NULL,NULL,NULL,'radreply','Framed'),('Framed-MTU',NULL,NULL,NULL,'radreply','Framed'),('Framed-Route',NULL,NULL,NULL,'radreply','Framed'),('Framed-Routing',NULL,NULL,'Broadcast routing tables and notifications;Listen for routing notification broadcasts;Broadcast and listen for notifications','radreply','Framed'),('Framed-Protocol','PPP',NULL,'PPP;SLIP;ARAP;Gandalf SLP/MLP;Xylogics IPX/SIP;X.75 Synchronous','radreply','Framed'),('Login-LAT-Group',NULL,NULL,NULL,'radreply','Login'),('Login-LAT-Node',NULL,NULL,NULL,'radreply','Login'),('Login-LAT-Port',NULL,NULL,NULL,'radreply','Login'),('Login-IP-Host',NULL,NULL,NULL,'radreply','Login'),('Login-Service',NULL,NULL,'Telnet;Rlogin;Tcp Clear;PortMaster;LAT;X25-PAD;X25-T3POS;Tcp Clear Quiet','radreply','Login'),('Login-TCP-Port',NULL,NULL,NULL,'radreply','Login'),('Port-Limit',NULL,NULL,NULL,'radreply','Divers'),('Service-Type','Login','Network service','Login;Framed;Callback Login;Callback Framed;Outbound;Administrative;NAS Prompt;Authenticate Only;Callback NAS Prompt;Call Check;Callback Administrative','radreply','Divers'),('Fall-Through','1',NULL,NULL,'radreply','Divers'),('Tunnel-Type',NULL,NULL,'Point-to-Point Tunneling Protocol;Layer Two Forwarding;Layer Two Tunneling Protocol;Ascend Tunnel Manaement Protocol;Virtual Tunneling Protocol;IP Authentification Header in the Tunnel-mode;IP-in-IP Encapsulation;Minimal IP-in-IP Encapsulation;IP Encapsul','radreply','Tunnel'),('Tunnel-Medium-Type','IPv4',NULL,'IPv4;IPv6;NSAP;HDLC;BBN 1822;802;E.163;E.164;F.69;X.121;IPX;Appletalk;Decnet IV;Banyan Vines; E164 with NSAP format subaddress','radreply','Tunnel'),('Tunnel-Password',NULL,NULL,NULL,'radreply','Tunnel'),('EAP-Message',NULL,NULL,NULL,'radreply','EAP'),('Reply-Message',NULL,'String returned to the user',NULL,'radreply','Divers'),('ChilliSpot-MAC-Allowed',NULL,'For allow mac adress auth',NULL,'radcheck;radreply','Chillispot'),('ChilliSpot-UAM-Allowed',NULL,'When received from the radius server in an RFC 2882 style configuration management message this attribute will override the uamallowed command line option.',NULL,'radreply','Chillispot'),('ChilliSpot-Max-Total-Octets',NULL,'Maximum number of octets the user is allowed to transfer (sum of octets transmitted and received). After this limit has been reached the user will be disconnected.',NULL,'radreply;radcheck','Chillispot'),('ChilliSpot-Max-Output-Octets',NULL,'Maximum number of octets the user is allowed to receive. After this limit has been reached the user will be disconnected.',NULL,'radreply;radcheck','Chillispot'),('ChilliSpot-Max-Input-Octets',NULL,'Maximum number of octets the user is allowed to transmit. After this limit has been reached the user will be disconnected.',NULL,'radcheck;radreply','Chillispot'),('WISPr-Session-Terminate-Time',NULL,'The time when the user should be disconnected in ISO 8601 format (YYYY-MM-DDThh:mm:ssTZD). If TZD is not specified local time is assumed. For example a disconnect on 18 December 2001 at 7:00 PM UTC would be specified as 2001-12-18T19:00:00+00:00.',NULL,'radreply','Wispr'),('WISPr-Bandwidth-Max-Down',NULL,'Maximum receive rate (b/s). Limits the bandwidth of the connection. Note that this attribute is specified in bits per second.',NULL,'radreply','Wispr'),('WISPr-Bandwidth-Max-Up',NULL,'Maximum transmit rate (b/s). Limits the bandwidth of the connection. Note that this attribute is specified in bits per second.',NULL,'radreply','Wispr'),('WISPr-Redirection-URL',NULL,'If present the client will be redirected to this URL once authenticated. This URL should include a link to WISPr-Logoff-URL in order to enable the client to log off.',NULL,'radreply','Wispr'),('WISPr-Logoff-URL',NULL,'Chilli includes this attribute in Access-Request messages in order to notify the operator of the log off URL to use for logging off clients. Defaults to \"http://192.168.182.1:3990/logoff\"',NULL,'radreply','Wispr'),('WISPr-Location-Name',NULL,'Location Name is set to the radiuslocationname option if present. Should be in the format: <HOTSPOT_OPERATOR_NAME>,<LOCATION>',NULL,'radcheck','Wispr'),('WISPr-Location-ID',NULL,'Location ID is set to the radiuslocationid option if present. Should be in the format: isocc=<ISO_Country_Code>, cc=<E.164_Country_Code>,ac=<E.164_Area_Code>,network=<ssid/ZONE>',NULL,'radcheck','Wispr'),('Acct-Interim-Interval',NULL,'If present in Access-Accept chilli will generate interim accounting records with the specified interval (seconds).',NULL,NULL,'Accounting'),('NAS-Port-Type',NULL,NULL,'Wireless-IEEE-802.11','radcheck','Nas'),('NAS-ID',NULL,'Set to radiusnasid option if present.',NULL,'radcheck','Nas'),('MS-MPPE-Send-Key',NULL,'User for wpa',NULL,'radreply','Mppe'),('MS-MPPE-Recv-Key',NULL,NULL,NULL,'radreply','Mppe'),('Called-Station-ID',NULL,'	Set to the radiuscalled command line option or the MAC address of ChilliSpot if not present.',NULL,'radcheck','Divers'),('Session-Timeout',NULL,'Logout once session timeout is reached (seconds)',NULL,'radreply;radcheck','Divers'),('Idle-Timeout',NULL,'Logout once idle timeout is reached (seconds)',NULL,'radreply','Divers'),('CHAP-Password',NULL,'Used for UAM',NULL,'radcheck','Divers'),('CHAP-Challenge',NULL,'Used for UAM',NULL,'radcheck','Divers'),('NAS-IP-Address',NULL,'IP address of Chilli (set by the radiusnasip or radiuslisten option).IP address of Chilli (set by the radiusnasip or radiuslisten option). If neither radiuslisten nor nasipaddress are set NAS-IP-Address is set to \"0.0.0.0\". ',NULL,'radcheck','Nas');
/*!40000 ALTER TABLE `radius_attribute` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `radius_config`
--

DROP TABLE IF EXISTS `radius_config`;
CREATE TABLE `radius_config` (
  `radius_server` varchar(100) NOT NULL default 'localhost',
  `radius_server_sec` varchar(100) NOT NULL default 'localhost',
  `radius_server_port` varchar(100) default '1812',
  `radius_server_secret` varchar(200) default 'secret',
  `radius_log` varchar(200) default '/var/log/radius.log',
  `radius_bin` varchar(200) default '/usr/sbin/freeradius',
  `radius_conf` varchar(200) default '/etc/freeradius',
  `radius_version` varchar(3) default '2.X',
  `radclient` varchar(200) default '/usr/sbin/radclient',
  `radius_dictionnary` varchar(200) default '/usr/share/freeradius/',
  `radius_startscript` varchar(200) default '/etc/init.d/freeradius',
  `location_id` int(11) NOT NULL default '1',
  PRIMARY KEY  (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radius_config`
--

/*!40000 ALTER TABLE `radius_config` DISABLE KEYS */;
LOCK TABLES `radius_config` WRITE;
INSERT INTO `radius_config` VALUES ('localhost','localhost','1812','testing123','/var/log/radius.log','/usr/sbin/freeradius','/etc/freeradius','2.X','/usr/sbin/radclient','/usr/share/freeradius/','/etc/init.d/freeradius','-1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `radius_config` ENABLE KEYS */;

--
-- Table structure for table `radius_template`
--

DROP TABLE IF EXISTS `radius_template`;
CREATE TABLE `radius_template` (
  `ID` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `attribute` varchar(255) default NULL,
  `operator` varchar(20) default NULL,
  `value` varchar(255) default NULL,
  `location_id` int(11) default NULL,
  `description` text,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radius_template`
--


--
-- Table structure for table `radpostauth`
--

DROP TABLE IF EXISTS `radpostauth`;
CREATE TABLE `radpostauth` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(64) NOT NULL default '',
  `pass` varchar(64) NOT NULL default '',
  `reply` varchar(32) NOT NULL default '',
  `authdate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radpostauth`
--


/*!40000 ALTER TABLE `radpostauth` DISABLE KEYS */;
LOCK TABLES `radpostauth` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `radpostauth` ENABLE KEYS */;

--
-- Table structure for table `radreply`
--

DROP TABLE IF EXISTS `radreply`;
CREATE TABLE `radreply` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `UserName` varchar(64) NOT NULL default '',
  `Attribute` varchar(32) NOT NULL default '',
  `op` char(2) NOT NULL default '=',
  `Value` varchar(253) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `UserName` (`UserName`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radreply`
--

--
-- Table structure for table `radusergroup`
--

DROP TABLE IF EXISTS `radusergroup`;
CREATE TABLE `radusergroup` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '1',
  KEY `username` (`username`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radusergroup`
--


/*!40000 ALTER TABLE `radusergroup` DISABLE KEYS */;
LOCK TABLES `radusergroup` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `radusergroup` ENABLE KEYS */;

--
-- Table structure for table `redirect_pages`
--

DROP TABLE IF EXISTS `redirect_pages`;
CREATE TABLE `redirect_pages` (
  `id` int(11) NOT NULL auto_increment,
  `id_pages` int(11) default NULL,
  `pages` varchar(255) default NULL,
  `appright` int(11) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `redirect_pages`
--


/*!40000 ALTER TABLE `redirect_pages` DISABLE KEYS */;
LOCK TABLES `redirect_pages` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `redirect_pages` ENABLE KEYS */;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
CREATE TABLE `resources` (
  `resource_id` int(11) NOT NULL default '0',
  `resource_line` varchar(255) default NULL,
  `resource_comment` varchar(255) default NULL,
  PRIMARY KEY  (`resource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resources`
--


/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
LOCK TABLES `resources` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;

--
-- Table structure for table `securelogin_table`
--

DROP TABLE IF EXISTS `securelogin_table`;
CREATE TABLE `securelogin_table` (
  `securelogin_id` int(11) NOT NULL auto_increment,
  `securelogin_login` varchar(100) NOT NULL default '',
  `securelogin_pass` varchar(100) NOT NULL default '',
  `securelogin_string` varchar(250) NOT NULL default '',
  `securelogin_signupdate` varchar(200) NOT NULL default '',
  `securelogin_pass_readable` varchar(100) NOT NULL default '',
  `securelogin_isadmin` varchar(5) NOT NULL default 'no',
  PRIMARY KEY  (`securelogin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `securelogin_table`
--


/*!40000 ALTER TABLE `securelogin_table` DISABLE KEYS */;
LOCK TABLES `securelogin_table` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `securelogin_table` ENABLE KEYS */;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `session_id` varchar(50) default '0',
  `user_id` int(11) default '0',
  `current_page` int(11) default '0',
  `last_reload` int(11) default '0',
  `type` char(2) default '0',
  `host` int(11) default '0',
  `host_group` int(11) default '0',
  `host_group_escalation` int(11) default '0',
  `host_escalation` int(11) default '0',
  `host_dependency` int(11) default '0',
  `host_template_model` int(11) default '0',
  `host_extended_infos` int(11) default '0',
  `service` int(11) default '0',
  `service_escalation` int(11) default '0',
  `service_dependency` int(11) default '0',
  `service_group` int(11) default '0',
  `service_template_model` int(11) default '0',
  `service_extended_infos` int(11) default '0',
  `contact` int(11) default '0',
  `contact_group` int(11) default '0',
  `timeperiod` int(11) default '0',
  `command` int(11) default '0',
  `trafficMap` int(11) default '0',
  `graph_model_ds` int(11) default '0',
  `graph_model_conf` int(11) default '0',
  `graph` int(11) default '0',
  `general` int(11) default '0',
  `nagioscfg` int(11) default '0',
  `ressourcecfg` int(11) default '0',
  `profile_user` int(11) default '0',
  `lca` int(11) default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session`
--



--
-- Table structure for table `sitepages`
--

DROP TABLE IF EXISTS `sitepages`;
CREATE TABLE `sitepages` (
  `pageid` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `page` text NOT NULL,
  `date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`pageid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sitepages`
--


/*!40000 ALTER TABLE `sitepages` DISABLE KEYS */;
LOCK TABLES `sitepages` WRITE;
INSERT INTO `sitepages` VALUES (1,'Main Page','Welcome to our Wireless HotSpot.  Here you can purchase time to browse the internet, check your email, securly connect to your office by VPN.  <BR>\r\n<BR>\r\nChoose your time below, and happy surfing!','2006-06-06');
UNLOCK TABLES;
/*!40000 ALTER TABLE `sitepages` ENABLE KEYS */;

--
-- Table structure for table `ssh_config`
--

DROP TABLE IF EXISTS `ssh_config`;
CREATE TABLE `ssh_config` (
  `server_name` varchar(200) NOT NULL,
  `server_port` int(11) default NULL,
  `server_username` varchar(200) default NULL,
  `server_passwd` varchar(200) default NULL,
  `location_id` int(11) default NULL,
  PRIMARY KEY  (`server_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ssh_config`
--


/*!40000 ALTER TABLE `ssh_config` DISABLE KEYS */;
LOCK TABLES `ssh_config` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `ssh_config` ENABLE KEYS */;

--
-- Table structure for table `totacct`
--

DROP TABLE IF EXISTS `totacct`;
CREATE TABLE `totacct` (
  `TotAcctId` bigint(21) NOT NULL auto_increment,
  `UserName` varchar(64) NOT NULL default '',
  `AcctDate` date NOT NULL default '0000-00-00',
  `ConnNum` bigint(12) default NULL,
  `ConnTotDuration` bigint(12) default NULL,
  `ConnMaxDuration` bigint(12) default NULL,
  `ConnMinDuration` bigint(12) default NULL,
  `InputOctets` bigint(12) default NULL,
  `OutputOctets` bigint(12) default NULL,
  `NASIPAddress` varchar(15) default NULL,
  PRIMARY KEY  (`TotAcctId`),
  KEY `UserName` (`UserName`),
  KEY `AcctDate` (`AcctDate`),
  KEY `UserOnDate` (`UserName`,`AcctDate`),
  KEY `NASIPAddress` (`NASIPAddress`),
  KEY `NASIPAddressOnDate` (`AcctDate`,`NASIPAddress`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `totacct`
--


/*!40000 ALTER TABLE `totacct` DISABLE KEYS */;
LOCK TABLES `totacct` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `totacct` ENABLE KEYS */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_firstname` varchar(200) default NULL,
  `user_lastname` varchar(200) default NULL,
  `user_alias` varchar(200) default NULL,
  `user_passwd` varchar(200) default NULL,
  `user_mail` varchar(200) default NULL,
  `user_status` tinyint(4) default NULL,
  `user_lang` char(2) default 'en',
  `user_version` tinyint(4) default '0',
  `user_rapport_du_jour` int(11) default '0',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--


--
-- Table structure for table `user_location`
--

DROP TABLE IF EXISTS `user_location`;
CREATE TABLE `user_location` (
  `userid` int(11) NOT NULL,
  `locationid` int(11) NOT NULL,
  `statusid` int(11) NOT NULL default '3',
  PRIMARY KEY  (`userid`,`locationid`,`statusid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_location`
--


--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
CREATE TABLE `usergroup` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `UserName` varchar(64) NOT NULL default '',
  `GroupName` varchar(64) NOT NULL default '',
  `location_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `UserName` (`UserName`(32))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usergroup`
--



--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `ID` mediumint(9) NOT NULL auto_increment,
  `CustID` varchar(10) NOT NULL default '',
  `Firstname` varchar(40) NOT NULL default '',
  `Lastname` varchar(40) NOT NULL default '',
  `Department` varchar(200) default NULL,
  `WorkPhone` varchar(200) default NULL,
  `HomePhone` varchar(200) default NULL,
  `Mobile` varchar(200) default NULL,
  `City` varchar(200) default NULL,
  `Country` varchar(200) default NULL,
  `ZipCode` varchar(200) default NULL,
  `Address` varchar(200) default NULL,
  `Username` varchar(60) NOT NULL default '',
  `LocationID` mediumint(9) NOT NULL default '0',
  `Mail` varchar(100) NOT NULL default '',
  `UploadLimit` varchar(100) NOT NULL default '',
  `DownloadLimit` varchar(100) NOT NULL default '',
  `CrDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  `creator` varchar(20) default 'NULL',
  `activated` smallint(4) NOT NULL default '0',
  `activeDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  `status` smallint(4) NOT NULL default '0',
  `rate` smallint(4) NOT NULL default '1',
  `RadiusProfile` smallint(11) NOT NULL default '-1',
  `Note` longtext,
  `Type` varchar(70) NOT NULL default 'Hourly',
  `BillingPlan` smallint(4) NOT NULL default '0',
  `TimeToFinish` smallint(1) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;


--
-- Table structure for table `wlogin`
--

DROP TABLE IF EXISTS `wlogin`;
CREATE TABLE `wlogin` (
  `uam_ip` varchar(50) default NULL,
  `uam_port` varchar(50) default NULL,
  `uam_url` varchar(100) default NULL,
  `base_url` varchar(100) default NULL,
  `cookies` tinyint(1) default '0',
  `debug` tinyint(4) NOT NULL default '0',
  `popup_time` int(2) default '3',
  `uam_secret` varchar(200) default NULL,
  `other_account` tinyint(4) default '0',
  `language` varchar(2) NOT NULL default 'fr',
  `location_id` int(11) default NULL,
  `config_file` varchar(255) default NULL,
  `logout_popup` tinyint(4) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wlogin`
--


/*!40000 ALTER TABLE `wlogin` DISABLE KEYS */;
LOCK TABLES `wlogin` WRITE;
INSERT INTO `wlogin` VALUES ('192.168.18.1','3990','http://192.168.18.1:3990','https://192.168.18.1/',1,1,1,'secret',0,'fr',-1,'/var/www/phpmyprepaid0.4/wlogin/site-lib/config.inc',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `wlogin` ENABLE KEYS */;

--
-- Table structure for table `wlogin_freeurl`
--

DROP TABLE IF EXISTS `wlogin_freeurl`;
CREATE TABLE `wlogin_freeurl` (
  `url` varchar(255) NOT NULL,
  `location_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`url`,`location_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `wlogin_popup_list`
--

DROP TABLE IF EXISTS `wlogin_popup_list`;
CREATE TABLE `wlogin_popup_list` (
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `location_id` varchar(255) NOT NULL,
  PRIMARY KEY  (`name`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wlogin_popup_list`
--


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- MySQL dump 10.11
--
-- Host: localhost    Database: phpmyprepaid
-- ------------------------------------------------------
-- Server version	5.0.38-Ubuntu_0ubuntu1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cron_config`
--

DROP TABLE IF EXISTS `cron_config`;
CREATE TABLE `cron_config` (
  `id` int(11) NOT NULL auto_increment,
  `conf_path` varchar(255) default '/etc/cron.d/',
  `cron_bin` varchar(255) default 'crontab',
  `bin_path` varchar(255) default '/usr/bin/',
  `startup_script` varchar(255) default '/etc/init.d/cron',
  `location_id` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cron_config`
--

LOCK TABLES `cron_config` WRITE;
/*!40000 ALTER TABLE `cron_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dns_config`
--

DROP TABLE IF EXISTS `dns_config`;
CREATE TABLE `dns_config` (
  `id` int(11) NOT NULL auto_increment,
  `conf_path` varchar(255) default NULL,
  `zone_path` varchar(255) default NULL,
  `dns_bin` varchar(255) default NULL,
  `bin_path` varchar(255) default NULL,
  `startup_script` varchar(255) default '/etc/init.d/radiusd',
  `location_id` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dns_config`
--

LOCK TABLES `dns_config` WRITE;
/*!40000 ALTER TABLE `dns_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `dns_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firewall_config`
--

DROP TABLE IF EXISTS `firewall_config`;
CREATE TABLE `firewall_config` (
  `id` int(11) NOT NULL auto_increment,
  `conf_path` varchar(255) default '/etc/',
  `firewall_bin` varchar(255) default 'iptables',
  `bin_path` varchar(255) default '/sbin/',
  `startup_script` varchar(255) default '/etc/init.d/iptables',
  `location_id` int(11) NOT NULL default '1',
  `smtp_mail_server` varchar(255) default NULL,
  `pri_dns_server` varchar(255) default NULL,
  `sec_dns_server` varchar(255) default NULL,
  `smtp_forward` tinyint(4) default NULL,
  `dns_forward` tinyint(4) default NULL,
  `gateway_int` varchar(20) default NULL,
  `internet_int` varchar(20) default NULL,
  `proxy_forward` tinyint(4) default NULL,
  `proxy_port` varchar(20) default NULL,
  `icmp_ignore` tinyint(4) default NULL,
  `log_martian` tinyint(4) default NULL,
  `enable_ssh` tinyint(4) default NULL,
  `enable_log` tinyint(4) default NULL,
  `disable_spoofing` tinyint(4) default '1',
  `phpmyprepaid_port` varchar(11) default NULL,
  `network_addr` varchar(100) default NULL,
  `squid_int` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `firewall_config`
--

LOCK TABLES `firewall_config` WRITE;
/*!40000 ALTER TABLE `firewall_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `firewall_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BillingPlan`
--

DROP TABLE IF EXISTS `BillingPlan`;
CREATE TABLE `BillingPlan` (
  `ID` mediumint(9) NOT NULL auto_increment,
  `NameBp` varchar(40) NOT NULL default '',
  `TimeBp` varchar(40) NOT NULL default '',
  `PriceBp` varchar(40) NOT NULL default '',
  `TypeBp` varchar(10) NOT NULL default '',
  `LocationID` int(11) default NULL,
  `TimetofinishBp` tinyint(4) default NULL,
  `SimultanousBp` int(11) default NULL,
  `RedirectionurlBp` varchar(250) default NULL,
  `MaximumtimeBp` int(11) default NULL,
  `MaximumoctetBp` int(11) default NULL,
  `ExpirationdateBp` varchar(25) default NULL,
  `BandwidthuploadBp` int(11) default NULL,
  `BandwidthdownloadBp` int(11) default NULL,
  `PublishBp` tinyint(4) default NULL,
  `CatBp` char(25) default NULL,
  `CurrencyBp` varchar(5) default NULL,
  `GroupBp` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `BillingPlan`
--

LOCK TABLES `BillingPlan` WRITE;
/*!40000 ALTER TABLE `BillingPlan` DISABLE KEYS */;
INSERT INTO `BillingPlan` VALUES (1,'15 minutes','900','5','Time',1,1,1,'',0,0,NULL,NULL,NULL,NULL,'Daily','$',NULL),(2,'30 minutes','1800','8','Time',1,1,0,'',0,0,'',0,0,1,'None','$',NULL),(3,'1 hours','3600','15','Time',1,1,0,NULL,0,0,NULL,0,0,0,'Daily','$',NULL),(4,'2 hours','7200','28','Time',1,1,0,'',0,0,'',0,0,0,'None','$',NULL),(5,'3 hours','10800','40','Time',1,0,0,'',0,0,'',0,0,0,'None','$',NULL),(6,'10 hours','36000','60','Time',1,0,0,NULL,0,0,NULL,0,0,1,'Daily','$',NULL),(7,'50 hours','180000','240','Time',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$',NULL),(8,'Day pass','86400','200','Time',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$',NULL),(9,'Week pass','604800','234','Time',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$',NULL),(10,'Season pass ','7776000','400','Time',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$',NULL),(11,'Year pass','31536000','800','Time',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$',NULL);
/*!40000 ALTER TABLE `BillingPlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apache_config`
--

DROP TABLE IF EXISTS `apache_config`;
CREATE TABLE `apache_config` (
  `id` int(11) NOT NULL auto_increment,
  `phpmyprepaid_apache_conf` varchar(255) default NULL,
  `user` varchar(255) default NULL,
  `apache_bin` varchar(255) default 'httpd',
  `bin_path` varchar(255) default '/usr/bin/',
  `startup_script` varchar(255) default '/etc/init.d/httpd',
  `location_id` int(11) default NULL,
  `ssl_dir_path` varchar(255) default '/etc/apache2/ssl/',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apache_config`
--

LOCK TABLES `apache_config` WRITE;
/*!40000 ALTER TABLE `apache_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `apache_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dump completed on 2007-08-18 10:24:34
#
# Table structure for table 'badusers'
#
CREATE TABLE badusers (
  `id` int(11) NOT NULL auto_increment,
  UserName varchar(30),
  IncidentDate	datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
  Reason varchar(200),
  Admin varchar(30) DEFAULT '-',
  PRIMARY KEY (id),
  KEY UserName (UserName),
  KEY IncidentDate (IncidentDate)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
