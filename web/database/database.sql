-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2024 at 07:19 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `llvdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `answered_questions`
--

CREATE TABLE `answered_questions` (
  `id` int(15) NOT NULL,
  `userID` int(15) DEFAULT NULL,
  `quizID` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answered_questions`
--

INSERT INTO `answered_questions` (`id`, `userID`, `quizID`) VALUES
(102, 1, 31),
(104, 1, 30),
(105, 1, 34),
(106, 1, NULL),
(107, 1, 37),
(108, 1, 33),
(109, 1, 25),
(110, 1, 22),
(111, 128, NULL),
(112, 1, NULL),
(113, 1, 20),
(114, 1, 30),
(115, 1, 34),
(116, 1, NULL),
(117, 1, 37),
(118, 1, 33),
(119, 1, 25),
(120, 1, 22),
(121, 128, NULL),
(122, 1, NULL),
(123, 1, 20),
(124, 135, 31),
(125, 135, NULL),
(126, 135, 31),
(127, 135, NULL),
(128, 1, 27),
(129, 1, 26),
(130, 1, 36),
(131, 1, NULL),
(132, 1, 32),
(133, 1, NULL),
(134, 1, 24),
(135, 1, 29),
(136, 1, 35),
(137, 1, NULL),
(138, 1, NULL),
(139, 1, NULL),
(140, 1, 21),
(141, 1, 28),
(142, 1, NULL),
(143, 1, 19),
(144, 1, 23),
(145, 2, 25),
(146, 2, 22),
(147, 2, 34),
(148, 2, 24),
(149, 2, 23),
(150, 2, 32),
(151, 2, 20),
(152, 2, NULL),
(153, 2, 26),
(154, 2, 35),
(155, 2, NULL),
(156, 3, 22),
(157, 3, 43),
(158, 162, 26),
(159, NULL, 19),
(160, NULL, 35),
(161, 167, 25),
(162, 167, 42),
(163, 170, 19),
(164, 170, 46);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(15) NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`) VALUES
(16, 'upė'),
(17, 'ežeras'),
(18, 'upė'),
(19, 'ežeras'),
(20, 'pilis'),
(21, 'piliakalnis'),
(22, 'muziejus'),
(23, 'parkas'),
(24, 'paminklas'),
(25, 'zoologijos sodas'),
(26, 'tiltas'),
(27, 'bažnyčia'),
(28, 'giria'),
(29, 'poilsio zona'),
(30, 'draustinis'),
(31, 'dvaras'),
(32, 'gamta'),
(33, 'paroda'),
(34, 'slėnis'),
(35, 'vienuolynas'),
(36, 'sodyba'),
(37, 'takas'),
(38, 'fortas'),
(39, 'amatų centras'),
(40, 'rezervatas'),
(41, 'uola'),
(42, 'atodanga'),
(43, 'vila'),
(44, 'skulptūra'),
(45, 'pilis'),
(46, 'piliakalnis'),
(47, 'muziejus'),
(48, 'parkas'),
(49, 'paminklas'),
(50, 'zoologijos sodas'),
(51, 'tiltas'),
(52, 'bažnyčia'),
(53, 'giria'),
(54, 'poilsio zona'),
(55, 'draustinis'),
(56, 'dvaras'),
(57, 'gamta'),
(58, 'paroda'),
(59, 'slėnis'),
(60, 'vienuolynas'),
(61, 'sodyba'),
(62, 'takas'),
(63, 'fortas'),
(64, 'amatų centras'),
(65, 'rezervatas'),
(66, 'uola'),
(67, 'atodanga'),
(68, 'vila'),
(69, 'skulptūra'),
(70, 'pilis1');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(15) NOT NULL,
  `userID` int(15) NOT NULL,
  `locationID` int(15) NOT NULL,
  `comment` varchar(300) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `userID`, `locationID`, `comment`, `date`) VALUES
(4777, 1, 97, ' Be galo graži gamta, ežerai ir upės. Smagus, aktyvus poilsis plaukiant baidarėmis Būkos upe, Baluošo, Baluokšykščio, Sravinaitčio ežerais pro Ginučių vandens malūną. Ežerai susijungia upėmis.    ', '2022-11-09 20:50:31'),
(4778, 1, 86, '\r\n     Didelis eksponatų skaičius, didelė teritorija ir statiniai. Viskas gražiai sutvarkyta, puikios gidės paslaugos.         ', '2022-11-09 20:50:46'),
(4781, 1, 105, 'Graži gamta.\r\n              ', '2022-11-09 20:53:41'),
(4782, 1, 93, ' Dzūkijos Nacionalinis Parkas-tai milžiniška teritorija pietų Lietuvoje,kur pilna miškų ir girių,pelkių ir plynų laukų. Be visos gamtos,tai yra nuostabių žmonių kraštas,su didžiausiu Lietuvoje Marcinkonių kaimu. Nuo Marcinkonių prasideda didžiausias nuotykis Lietuvoje!!???', '2022-11-09 20:54:10'),
(4783, 1, 87, 'Įdomi senovę menanti vieta\r\n              ', '2022-11-09 20:54:28'),
(4785, 1, 100, 'Labai gražus dvaras, sutvarkyta aplinka. Centriniuose rūmuose ir dalyje buvusių dvaro ūkinių pastatų įrengtas muziejus ir restauravimo centras. Dvare veikia ekspozicijos, edukacijos. Verta aplankyti.\r\n              ', '2022-11-09 20:55:12'),
(4786, 1, 82, 'Graži vieta. Sutvarkyta pakrantė iki upių santakos. Geras laiko praleidimas, aktyvus laisvalaikis.\r\n              ', '2022-11-09 20:55:41'),
(4787, 1, 88, '\r\n              Nuostabus, informatyvus, interaktyvus ir įdomus muziejus. Buvom 4 suaugę ir 4 metų vaikas. Visiem labai patiko. Nesam klaipėdiečiai, bet Klaipėdos istorija pateikta įdomiai ne tik klaipėdiečiams.', '2022-11-09 20:56:42'),
(4788, 1, 94, 'Nereali unikali gamta. Tikrai yra kuo pasigrožėti. Mūsų Lietuvos gražuma bei įžymi vieta, kurią verta apsilankyti. ?❤ nuostabu, dažnai važiuoju į Nidą atostogauti, tai niekada nepraeina atostogos be kopų aplankymo.   ??❤?\r\n              ', '2022-11-09 20:57:21'),
(4789, 1, 92, 'Gal toks metas nuobodus, kai dar niekas nežaliuoja. Sekmadienis, muziejus nedirba, tad įvertinti to nesiimu, bet aplinka negyvai negyva, išskyrus pora vietinių moterėlių besišildančių saulutėje ant suoliuko. Kas aktualu šiuo metu tai čia yra slėptuvė. Taip, patys rūmai sutvarkyti, pui', '2022-11-09 20:58:07'),
(4791, 1, 89, 'Į vidų įeiti negalima, bet pati pilis ypač gražiai atrodo iš toliau. Kažkokia paslaptinga vieta. Šalia yra medinė bažnyčia.\r\n              ', '2022-11-09 21:01:17'),
(4792, 1, 90, 'Didžiąją dalimi pilnai rekonstruota, muziejaus dalyje labai gražiai atkurtos salių grindys, sienos, lubos, trūksta tik autentiškų to laikmečio baldų. Yra viešbutis ir restoranas - nebuvau. Pilies išorė ir aplinka atrodo gražiai ir tvarkingai.\r\n              ', '2022-11-09 21:01:38'),
(4793, 1, 98, 'Labai graži vieta, turinti savo istoriją! Yra kur pasivaikščioti po parką. Rūmai - įspūdingi, su įdomiomis ekspozicijomis. Tikrai verta pereiti ir pamatyti.\r\n              ', '2022-11-09 21:01:53'),
(4794, 1, 106, '\r\n              Vidzgiris gražus visais metų laikais - turbūt gražiausias miškas Lietuvoje.', '2022-11-09 21:02:34'),
(4795, 1, 91, '\r\n              Labai jaukus dvaras. Dirba nuo trečiadienio iki sekmadienio. Įėjimas 1 eur,su gide 9 eur, žmogui.Nuostabus restoranas. Maistas skanus ir gražia paserviruotas. Galima  švęsti šventes.', '2022-11-09 21:02:47'),
(4796, 129, 100, '\r\n              Karantinai, žiema, ruduo, bet...pagaliau pataikėm, kada dirba :) Nustebau, nes ir taip įtariau, kad šaunus dvaras, bet ištikro nustebinau dar labiau ;) Šaunios ekspozicijos (sakė dar ruošiama), darbuotojai. Labai viskas tvarkinga.', '2022-11-09 21:06:14'),
(4797, 129, 91, '\r\n              Jauki,išpuoselėta teritorija,vidus,malonus kolektyvas.O restoranas nuostabus,koks vidus,dekoracijos-karališka? o oranžerija kokia graži,gyva papūga ara,kurią gali pažiūrėti jš arti.Tikrai verta užsukti?', '2022-11-09 21:06:35'),
(4798, 129, 81, 'Labai graži atstatyta istorinė Trakų pilis. Nuostabus gamtos landšaftas. Puiki vieta fotosesijai. Nuostabus istorinis muziejus, gera ekspozicija.', '2022-11-09 21:07:33'),
(4853, 148, 85, 'Graži sutvarkyta aplinka. Pilyje veikia net kelios parodos, yra kur akis paganyti. O įveikus  bokšto laiptus, atsiveria fantastiška Nemuno lankų panorama   ? Foto darytos šį pavasarį :)', '2022-11-10 19:30:17'),
(4857, 2, 98, 'Komentaras', '2022-11-23 20:30:14'),
(4875, 163, 94, 'komentaras', '2022-12-08 10:15:30'),
(4876, 163, 95, 'komentaras', '2022-12-08 10:19:44'),
(4877, 166, 98, 'komentaras', '2022-12-08 10:58:46'),
(4878, 167, 89, 'komentaras', '2022-12-08 11:03:35'),
(4879, 169, 88, 'fgfg', '2022-12-08 11:28:38'),
(4887, 148, 81, 'hgjg', '2022-12-16 12:19:09'),
(4888, 148, 81, 'hjjh', '2022-12-16 12:20:09'),
(4896, 148, 81, 'hh', '2022-12-16 12:45:09'),
(4897, 148, 81, 'naujas', '2022-12-16 12:45:35'),
(4898, 148, 81, '4', '2022-12-16 12:45:41'),
(4899, 148, 81, '5', '2022-12-16 12:45:43'),
(4900, 148, 81, '6', '2022-12-16 12:45:45'),
(4901, 148, 81, '1', '2022-12-16 13:01:48'),
(4902, 148, 81, '2', '2022-12-16 13:01:50');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(15) NOT NULL,
  `locationID` int(15) NOT NULL,
  `image` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `locationID`, `image`) VALUES
(23, 97, 'img/aa.jpg'),
(24, 97, 'img/25_b78ee380f76659b29be01b1e37252bcd.jpg'),
(25, 86, 'img/Biržų pilis.jpg'),
(26, 86, 'img/Lithuania_Birże_Radziwiłł_Castle.jpg'),
(27, 99, 'img/birzuvenu dvaras.jpg'),
(28, 99, 'img/Biržų pilis.jpg'),
(29, 104, 'img/index.jpg'),
(30, 104, 'img/288px-Zizmai_village.jpg'),
(31, 105, 'img/288px-Dubysa3.jpg'),
(32, 105, 'img/index.jpg'),
(33, 93, 'img/Dzukijos_nac_parkas.jpg'),
(34, 93, 'img/dzukijos-nacionalinis-parkas-3.jpg'),
(35, 87, 'img/52051_3.jpg'),
(36, 87, 'img/52051_3.jpg'),
(37, 87, 'img/53_big.jpg'),
(41, 100, 'img/DSC_0023.jpg'),
(42, 82, 'img/DSC_0204-1920x1282.jpg'),
(43, 82, 'img/images.jpg'),
(44, 88, 'img/klaipedos-pilies-boksto-vizualizacija-5f58ce0ba9897.jpg'),
(45, 88, 'img/bokst1.jpg'),
(46, 94, 'img/nerija2.jpg'),
(47, 94, 'img/saule-nagliuose.jpg'),
(48, 92, 'img/index.jpg'),
(49, 92, 'img/Leipalingio_dvaro_rumai_2015_(1).JPG'),
(50, 84, 'img/Medininku_pilis_2012.jpg'),
(51, 84, 'img/9Medininku_pilis_10.jpg'),
(52, 89, 'img/index.jpg'),
(53, 89, 'img/Norviliskes_Castle.jpg'),
(54, 90, 'img/maxresdefault.jpg'),
(55, 90, 'img/panemunes_pilis_09_1580119140-eb18f4dc679fdad0fd2a3dcdc5ee5f13.jpg'),
(56, 98, 'img/index.jpg'),
(57, 98, 'img/dji_0001_optimized_1590655830-2b228300e0fddeffcec3f8b5e3af4e4a.jpg'),
(58, 106, 'img/crop.jpg'),
(59, 106, 'img/Alytus,_Lithuania_-_panoramio_(18).jpg'),
(60, 91, 'img/index.jpg'),
(61, 91, 'img/aa_2020_05_18_067.jpg'),
(62, 85, 'img/1200px-Raudones_pilis_pavasari.jpg'),
(63, 85, 'img/raudones_pilis_lankytinos_vietos_atostogoskaime.lt.jpg'),
(64, 95, 'img/TRAKAI.jpg'),
(65, 95, 'img/96510_1.jpg'),
(66, 81, 'img/385_e038cc1163ed433c2b0b5efd226c2d6f.jpg'),
(67, 81, 'img/Traku_pilis_by_Augustas_Didzgalvis.jpg'),
(68, 96, 'img/5b96a2f05d0ad799456893.jpg'),
(69, 96, 'img/zemaitijos-nacionalinis-parkas-ir-grazieji-plateliai-9045.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(15) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `description` varchar(5000) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `coordinates` varchar(100) NOT NULL,
  `categoryID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `description`, `coordinates`, `categoryID`) VALUES
(81, 'Trakų salos pilis', 'Trakų salos pilis – gotikinė pilis Trakų mieste, Galvės ežero Pilies saloje, į kurią nutiestas pėsčiųjų tiltas. Pastatyta kunigaikščių Kęstučio ir Vytauto iniciatyva XIV a. II pusėje – XV a. 1-ajame dešimtmetyje. XV a. ši pilis (kaip ir Trakų pusiasalio pilis) buvo viena iš LDK valdovų rezidencijų. Dabar pilis atstatyta ir yra vienas populiariausių Lietuvoje turistų lankomų objektų; pilyje vyksta įvairios šventės, veikia archeologinė ir istorinė ekspozicijos, medžioklės muziejus. Prie pilies saloje įkurtas parkas. \r\n\r\nNors dabar pilis stovi vienoje iš Galvės ežero salų, tyrimai rodo, kad prieš pradedant statybą čia buvo trys nedidelės salelės ir užpelkėjęs plotas tarp jų. Sudėtingos geologinės sąlygos lėmė pilies struktūrą.\r\n\r\nPirmajame statymo etape (XIV a. II pusėje) statyta tik didžiausioje (šiaurinėje) iš minėtų salelių. Pilį tada sudarė du papiliai ir pusiau uždaro plano rezidenciniai rūmai. Rūmų išorinės sienos buvo pastatytos maždaug iki antrojo aukšto palangių. Nei donžono, nei kontraforsų dar nebuvo, tačiau buvo pradėta mūryti papilio sieną ir formuoti perkasą. Statoma pilis sudegė.\r\n\r\nAntrasis – gotikinės statybos laikotarpis – prasidėjo greičiausiai XIV a. pabaigoje. Tuo metu pastatyti rezidenciniai rūmai su vidaus kiemu ir donžonu, juos supančios gynybinės sienos, supilta terasa, kurios pietiniame kampe iškastas šulinys.\r\n\r\nTrečiame statybos etape (XV a. pradžioje) suformuotas papilys. Jis apsuptas gynybine siena su bokštais. Kiek vėliau sumūryti vakariniai, o dar vėliau – rytiniai kazematai. Tuo pilies, kaip gynybinio ir rezidencinio objekto, statyba buvo baigta. Kitas svarbus Trakų pilies istorijos faktas – joje 1430 m. spalio 27 d. mirė Lietuvos didysis kunigaikštis Vytautas.\r\n\r\nVėliau pilis buvo naudojama kaip kalėjimas. Renesanso laikotarpiu pilyje buvo atliekamos nedidelės rekonstrukcijos ir remonto darbai. Maskvos karo metu (1655–1660 m.) pilis buvo apgriauta ir ilgai stovėjo be priežiūros, jos griuvėsiai iro.\r\n\r\nPilies griuvėsiai buvo tyrinėjami XIX a., taip pat 1905 ir 1929–1939 m.; pastarųjų tyrinėjimų metu rasta daug importinės ir vietinės gamybos keramikos šukių, šachmatų figūrėlių, nemažai XV–XVII a. koklių, monetų. Visi šie radiniai buvo sunaikinti hitlerinės okupacijos laikotarpiu.\r\n\r\nPlataus masto pilies liekanų tyrimo ir konservavimo darbai buvo pradėti 1951 metais (1951–1967 m. radiniai saugomi pilyje įrengtame muziejuje). 1962 m. restauruotose pilies rūmuose buvo įkurtas Trakų istorijos muziejus.\r\n\r\n1962 m. pilies rūmai buvo iš dalies restauruoti ir visiškai atstatyti pagal B. Krūminio ir kt. architektų projektą. Priešpilio restauravimo darbus atliko Paminklų restauravimo institutas ir Respublikinis kultūros paminklų restauravimo trestas. ', '54.65253902210654,24.93334166653915', 20),
(82, 'Kauno pilis', 'Kauno pilis – viena seniausių Lietuvos mūrinių pilių, stovinti Kaune, antrajame pagal dydį šalies mieste. Pirmą kartą rašytiniuose šaltiniuose paminėta 1361 m\r\nVietoje, kurioje stovi pilis, jau IV–V amžiais būta medžio ir molio gynybiniais įrenginiais apjuostos gyvenvietės. Vokiečių ordino agresiją Viduramžių Lietuva pasitiko su medinėmis pilimis. [1] Turbūt tokios būta ir Kauno piliavietėje.\r\nMūrinės pilys Lietuvoje pasirodė XIV a. Jas statė vokiečių meistrai. XIV amžiuje pastatyta pirmoji mūrinė Kauno pilis – viena seniausių Lietuvos mūrinių pilių. Kauno pilis buvo statoma strategiškai svarbioje vietoje turėjo iš vakarų pusės saugoti valstybės branduolį nuo bene pavojingiausio priešo – Vokiečių ordino. XIV a. šeštojo ir septintojo dešimtmečių sandūroje pastatyta mūrinė pilis tapo strategiškai svarbiu Nemuno-Jūros upių gynybinės sistemos elementu. Taip pat iškilo mūrinė Kauno miesto gynybinė siena su mūriniais gynybiniais bokštais (iki šių dienų išlikęs Malūnininko bokštas).\r\n\r\nRemiantis atliktų tyrinėjimų duomenimis, 1361 metais pilis buvusi dar visiškai nauja, tikėtina dar nebaigta statyti. Ji stovėjo kairiajame Neries krante apie 600 m į šiaurės rytus nuo santakos ir apie 450 m į šiaurę nuo Nemuno vagos. Tai buvo Lietuvai būdingo aptvarinio tipo pilis. Apie 5200 m² ploto kiemą supo iki 2,5 m storio iš lauko riedulių mūrytos sienos, kurių aukštis galėjo būti nuo 9 iki 12 m. Sienų angokraščiams ir viršui išlyginti naudotos plytos. Pilies sienos buvo be bokštų, (bent jų dar nerasta). Bendras sienų ilgis galėjo siekti apie 330 m. Prie rytinės ir pietinės pilies sienų iškastuose 50-40 m pločio gynybiniuose grioviuose nuolat galėjo būti 1-1,5m vandens. Jie jungėsi su Neries vaga ir pilį gynė nuo sausumos pusės. Ant vidinių griovių šlaitų buvo supiltas pylimas. Ant jo apie 20-25 m atstumu nuo pilies sienų buvo išmūryta 1,5-2 m storio 4-5 m aukščio priešpilio siena. Iš rašytinių šaltinių žinoma, kad priešpilyje stovėjo du bokštai. Vieno iš jų pamatai aptikti pietrytiniame kampe, kitas turėjo būti šiaurės vakaruose. Manoma, kad pietvakarinio kampo bokštas dar nebuvo baigtas statyti.\r\nKauno pilis iki rekonstrukcijos, 2006 m.\r\n\r\nPirmoji mūrinė Kauno pilis pirmą kartą paminėta kryžiuočių ordino magistro Vinricho fon Kniprodės 1361 m. laiške, kuriame įsakoma atsiųsti informaciją apie pilies sienų storį, ryšium su planuojamu puolimu. Viduramžių kronikininkas Vygandas Marburgietis „Naujojoje Prūsijos kronikoje&quot; mini kryžiuočių Įsrūties pilies viršininką, kuris buvo ordino maršalo pasiųstas į Kauną, bet su savo kariais nepajėgė persikelti per Nemuną. Visgi kryžiuočiai buvo ryžtingai nusprendę pulti ir dar tais pačiais metais vėl pasiųsti šnipai grįžo su reikiama informacija. 1362 m. pavasarį, kai pagrindinės Lietuvos karinės pajėgos buvo koncentruojamos prie Mėlynųjų Vandenų kovoti su Aukso Orda, Kauno pilį apgulė didelė ir gerai pasirengusi kryžiuočių kariuomenė, kurioje buvo talkininkų iš Anglijos, Italijos, įvairių Vokietijos žemių. Priešai atsigabeno sudėtingų apgulos mašinų, išsikasė griovį nuo Nemuno iki Neries, supylė pylimą ir surentė aštriakuolių tvorą, kur nuolat budėjo sargyba. Taip Kauno pilis buvo visiškai blokuota. Prasidėjo ilgas ir planingas pilies puolimas. Buvo statomi šturmo bokštai, naudojamos apgulos mašinos, sienodaužiai. Kryžiuočiai užpylinėjo pilies gynybinius griovius, veržėsi kuo arčiau pilies sienų. Kęstučio sūnaus Vaidoto vadovaujama lietuvių įgula atkakliai gynėsi. Net kryžiuočių kronikininkas Vygandas Marburgietis nepagailėjo pagarbių žodžių nekenčiamiems „stabmeldžiams“ – lietuviams: „Nuo tol stabmeldžiai, puolami dieną ir naktį, negalėjo nė atsikvėpti, bet jie, krikščionių nelaimei, karžygiškai gynėsi“.\r\n\r\n1362 m. kovo mėnesį, po trijų savaičių apsiausties, kryžiuočiai pilį sugriovė. Pergalę pažymėjo velykinėmis šventomis mišiomis ant griuvėsių. Kryžiuočiams pasitraukus, buvusios pilies vietoje lietuviai įrengė laikinus įtvirtinimus iš žemės ir molio.\r\nKauno pilies panorama, 2011 m\r\n\r\n2008 m. gegužės 23 d. atidengta memorialinė lenta, skirta 1362 m. Kauno pilies gynėjams bei įgulos vado kunigaikščio Vaidoto biustas (skulpt. Algimantas Šlapikas). Tą pačią dieną į apyvartą išleista 50 Lt vertės sidabrinė moneta (iš serijos „Lietuvos istorijos ir architektūros paminklai“, dail. Giedrius Paulauskis). Monetos averse pavaizduotas stilizuotas viduramžių Vytis, reverse – Kauno pilis.[2]\r\nAntroji mūrinė Kauno pilis\r\nNe kartą Kauno pilis dėka geografinės padėties labai svarbi ginant kraštą ir valstybės centrą nuo priešų antpuolių buvo atstatoma. Be to, savo kelionių po šalį metu čia reziduodavo Lietuvos Didysis kunigaikštis Jogaila. „Lietuvos valdovas po Krėvos unijos senojoje valstybės teritorijoje - Lietuvos Didžiojoje kunigaikštystėje - savo valdžią palaikė daugiarezidencine sistema ir apsistodavo vos keliose pilyse: Vilniuje, Trakuose, Kaune ir Gardine.“', '54.89872618185633, 23.885535146028126', 20),
(84, 'Medininkų pilis', 'Medininkų pilis – Lietuvos Didžiosios Kunigaikštijos mūrinė gardinė pilis istorinėje Aukštaitijoje, pietrytinėje Lietuvoje, 31 km nuo Vilniaus centro, netoli Medininkų, pastatyta XIV amžiuje.\r\n\r\n27 metrų aukščio pilies bokšte yra įkurtas muziejus, kuriame įrengtos keturios ekspozicijų salės.[1]\r\nPilies aprašymas\r\n\r\nMedininkų pilis – plotu didžiausia gardinė Lietuvos Didžiosios Kunigaikštijos pilis, struktūra gimininga Lydos ir Krėvos pilims, beveik dvigubai didesnė už Krėvos pilį. Pilis mažiausiai perstatinėta. Kiautinės konstrukcijos siena ir bokštai sumūryti iš lauko akmenų ir plytų baltiškuoju plytų rišimo būdu. Turėjo 4 bokštus ir 4 vartus. Tyrimais nustatyti du pilies gyvavimo etapai.\r\n\r\nMedininkų pilis užima apie 2 ha plotą (su apsauginiais grioviais ir pylimais – 6,5 ha). Pilies forma – netaisyklingas keturkampis. Šiaurinė siena 128,7 m ilgio, rytinė – 161,2 m, pietinė – 127,7, o vakarinė 147,9 m.\r\n\r\nPilis pastatyta lygumos pakraštyje. Šiaurėje ir vakaruose ją saugo pelkė. Aplink pilį buvo dvigubas griovys, o tarp griovių – buvo medinė siena. Pakilesnėje rytinėje pusėje yra 20 m pločio ir 3–8 m gylio dvigubų gynybinių griovių sistema, vakarų pusėje (prie pelkės) – pylimo su stačiais šlaitais liekanų. Sienų perimetras 568 m. Pilis turėjo aukštas sienas, kurių aukštis buvo 14-15 m, išliko apie 70% aukščio. Sienos storis prie pamatų siekė 1,8-1,9 m, o viršuje 1,6 m. Viršuje, 11 m aukštyje buvo įrengtos šaudymo angos, išilgai jų iš kiemo pusės ėjo medinė galerija šauliams. Pilies viduje stovėjo keli mediniai pastatai (neišliko).\r\n\r\nIš sienų kyšo trys apgriuvę bokštai. Svarbiausias Medininkų pilies įrenginys – bokštas, stovėjęs gynybinės sienos šiaurės rytų kampe. Bokšto būta penkių aukštų, jo aukštis 23 m, ilgis 15 m, plotis 14 m. Kitas, mažesnis vieno aukšto, su durų anga iš kiemo, bokštas stovėjo ties pietinės sienos viduriu. Rytinėje sienoje būta vartų su dar vienu bokštu, iš vidaus prišlietu prie sienos rytinės dalies, su buvusių vartų arka (restauruota). Jo yra tik nedidelės liekanos. Antrieji vartai buvo ties vakarinės sienos viduriu.\r\n\r\nPagal savo paskirtį ir konstrukciją Medininkų pilis laikytina seniausiu pilies tipu Pabaltyje. Manoma, kad pilis pastatyta XIII a.: šiaurinės ir rytinės sienų plytų mūrams – seniausias Lietuvoje virš žemės išlikęs mūras – tapatus XIII a. Rygos pastatų mūrui ir archeologiniuose sluoksniuose surastiems Vilniaus Žemutinės pilies ir senosios Trakų piliavietės mūrams. Buvo pritaikyta frontalinei gynybai.\r\nLegenda apie pilies statybą\r\n\r\nPasakojama, kad Medininkų ir Krėvos pilis sieja glaudus ryšys, mat jas abi pastatė vienu metu dievai ir milžinai. Jie buvo tokie stiprūs, kad mūrydami sienas skolindavo vienas kitam įrankius ir svaidydavo juos iš Medininkų į Krėvą ir atgal.\r\nIstorija\r\n\r\nMedininkų pilis minima nuo 1311–1313 m., joje apylinkės gyventojai slėpėsi nuo totorių ir Vokiečių ordino; pastarasis puolė 1320 m., 1385 m., 1392 m., 1402 m. 1387 m. minima kryžiuočių užrašuose, tačiau dėl tikslios Medininkų pilies pastatymo datos nėra aišku. Remiantis rašytiniais šaltiniais ji turėjo būti pastatyta tarp 1385 ir 1388 m., tačiau 1402 m. sudeginta, taigi pirma, matyt, pastatyta medinė ir tik vėliau mūrinė pilis. Nuo XV a. pabaigos gynybai nebenaudota. Apleista po XVI a. pradžios gaisro. Į kiemą perkelti Medininkų dvaro mediniai pastatai išliko ten iki XX a. pradžios. [2]\r\n\r\nĮdomu, kad Medininkų pilis neturėjo savo kunigaikščio, ji atliko grynai gynybinę funkciją išorės priešui atremti. Didžiausią reikšmę pilis turėjo XIV a. pab. – XV a. pr.\r\n\r\nPilis pastatyta prie kelio, jungusio Lietuvą su Rusia, lygioje pelkėtoje vietoje, aplink nėra nei upės, nei ežero – ji nebuvo patogi kurtis didelei gyvenvietei, todėl Medininkai neišaugo į didelį miestą priešingai nei Lydos ir Krėvos pilys. Tai, jog Medininkai netapo stambia gyvenviete lėmė, jog Medininkų pilis iš visos Lietuvos pilių nukentėjo mažiausiai. Ji nebuvo perstatinėjama. Tik per pirmąjį pasaulinį karą vokiečių okupantai įsakė vežti pilies akmenis ant kelio, tačiau akmenų išvežta ne tiek jau daug.\r\n\r\nMedininkų pilis neteko didesnės reikšmės, kai ėmė augti Vilniaus miestas. Per Medininkus keliavusio Sigizmundo Herberšteino liudijimu, 1517 m. Medininkų pilis, kaip ir į rytus nuo jos buvusi Krėvos pilis, jau buvo apleista. 1514 m. Medininkai minimi kaip Vilniaus apskrities dvaras, mediniai dvaro pastatai buvo pastatyti pilies kieme. 1812 m. Medininkų pilies kieme kurį laiką šildėsi besitraukianti prancūzų kariuomenė, griovė ir degino medinius jos pastatus.[3] ', '54.53971586618841, 25.650207376713542', 20),
(85, 'Raudonės pilis', 'Raudonės pilis – rezidencinė pilis Raudonėje, dešiniajame Nemuno krante Jurbarko rajone.\r\n\r\nPilies rūmuose iki 2018 m. veikė Raudonės pagrindinė mokykla. Į pilies bokštą (33,5 m aukščio) leidžiama patekti ir turistams.\r\nIstorija\r\n\r\nPirmosios pilys Nemuno pakrantėj statytos dar apie 1300 metus kaip kovų su kryžiuočiais gynybiniai postai. Po Žalgirio mūšio jų svarba sunyko. Tačiau pilys atgimė XVI–XVII a., kai Nemunas tapo prekybos keliu. Raudonės pilis yra priskiriama tokioms antrosios kartos reprezentacinėms panemunės pilims.\r\n\r\nXVI a. pabaigoje miško pirklys Krišpinas Kiršenšteinas (iš Prūsijos kilęs miško eksportuotojas) Raudonėje pagal olandų architekto Petro Nonharto (vok. Peter Nonhardt) projektą pasistatė renesanso stiliaus įtvirtintus dvaro rūmus – pilį.\r\n\r\nXVII a. antrojoje pusėje didelius perstatymus atliko Lietuvos didysis iždininkas ir Lietuvos didysis sekretorius Jeronimas Krišpinas-Kiršenšteinas (pilį pastačiusio pirklio anūkas), įrengęs čia savo rezidenciją. Tai buvo pilies klestėjimo metai. Vėliau, išmirus Kiršenšteinams, įsikūrė jų giminaičiai Olendskiai XVIII–XIX a. keliskart perstatė pilį (daugiausia pagal klasicizmo tradicijas; autorius galėjo būti architektas Laurynas Stuoka-Gucevičius).\r\n\r\nPilį apgadino gaisras. 1811 m. ją iš Olendskių nusipirko Jekaterinos II favoritas grafas Platonas Zubovas, kuris keitė daugiau jos vidų, tačiau taip pat rekonstravo pilį, iškasė tvenkinius, pastatė neogotikinio stiliaus malūną.\r\n\r\nDmitrijaus Zubovo duktė Sofija von Pirch-Kaisarova 1854–1877 m. vėl pagal L. C. Anikinio projektą perstatė pilį, kuri įgavo neogotikos bruožų ir dabartinę išvaizdą.\r\n\r\n1877 m. pilį jau valdė Kaisarovos dukra Sofija Waxell, o veliau ir anūkė, taip pat Sofija, ištekėjusi už portugalo José Carloso de Faria e Castro.\r\n\r\n1903 m. atliktas kapitalinis pilies remontas, tačiau per I pasaulinį karą smarkiai nuniokota ir išgrobta. Po karo de Faria e Castro giminė nuskurdo ir pilis 1934 m. buvo parduota iš varžytinių – ją įsigijo LR švietimo ministerija, vėliau perduota Lietuvos bankui.\r\n\r\n1944 m. rugpjūčio 6 d. vokiečiai susprogdino pietinį didįjį bokštą (34,5 m aukščio), kuris virsdamas sugriovė dalį pietinio korpuso. ', '55.097230937248014, 23.131551898910402', 20),
(86, 'Biržų pilis', 'Pradžia\r\nStatyba\r\n\r\nKarų metai\r\n\r\nArchitektūra\r\n\r\n        Pirmosios pilies fortifikacijos\r\n        Pilis po rekonstrukcijos\r\n        Pilis po atstatymo\r\n        Interjeras\r\n        Tiltas\r\n    Restauracija\r\n    Tyrimai\r\n    Literatūra\r\n    Šaltiniai\r\n    Nuorodos\r\n\r\nBiržų pilis\r\n\r\n    Straipsnis\r\n    Aptarimas\r\n\r\n    Keisti\r\n    Keisti vikitekstą\r\n    Istorija\r\n\r\nKoordinatės: 56°12′18″ š. pl. 24°45′14″ r. ilg. (ž.)\r\nBiržų pilis\r\nLithuania Birże Radziwiłł Castle.jpg\r\nVieta 	Biržai\r\nĮkurtas 	XVI a.\r\nRūmų stilius 	Renesansas\r\nBajorų giminės 	Radvilos\r\nTiškevičiai (1811-1939)\r\nPastatų būklė 	Rūmai restauruoti, įrengta ekspozicija, atstatomi kiti pastatai\r\nSavininkas 	Biržų krašto muziejus\r\n\r\nBiržų pilis (arba Biržų tvirtovė) – pilis Biržuose, Širvėnos ežero pietinėje pakrantėje. Pilies rūmuose įrengtas Biržų krašto muziejus „Sėla“ ir Biržų biblioteka. Pilis yra bastioninio tipo tvirtovė, geriausiai išsilaikiusi šiaurės rytų Europoje ir vienintelė Lietuvoje. Renesansinė bastioninė pilis, istorijos ir architektūros paminklas.\r\nStatyba\r\n\r\nPilis pradėta statyti apie 1586 m. Kristupo Mikalojaus Radvilos Perkūno iniciatyva pagal italų bastioninių pilių planą. Pilis apjuosta gynybiniais grioviais su vandeniu, kuriuo jie užsipildė iš užtvenkus Apaščios ir Agluonos upes suformuoto 400 ha tvenkinio (dab. Širvėnos ežeras). Aukštutinis ir žemutinis pylimai su bastionais kampuose. Bastionų ir kiemo išoriniai šlaitai buvo statūs, sutvirtinti mūro kiautu iš gotiškai rištų plytų ir akmenų.\r\n\r\nĮ pilies vidų buvo patenkama lenktu tiltu per dviaukštį mūrinį vartų pastatą prie rytinio pylimo. Iki 1589 m. kieme buvo pastatyta mūriniai triaukščiai pilies rūmai, arsenalas, arklidės, maisto sandėliai, kiti pastatai.\r\nKarų metai\r\n1704 m. apšaudoma Biržų pilis.\r\n\r\nPer 1600–1629 m. Abiejų Tautų Respublikos karą su Švedija ir per 1655–1660 m. Švedų tvaną Biržų pilis buvo svarbi Lietuvos tvirtovė.\r\n\r\n    Pagrindinis straipsnis – ATR-Švedijos karas (1600–1629).\r\n\r\n1625 m. rugpjūčio 7 d. pilis buvo apgulta apie 8000 žmonių Švedijos kariuomenės, kuriai vadovavo pats Švedijos karalius Gustavas II Adolfas. Po antrojo šturmo rugsėjo 7 d. pilies įgula pasidavė, pilis buvo sugriauta. Švedai išsivežė 60 patrankų. Pagal 1627 m. sausio 19 d. sutartį pilis grąžinta Radviloms.\r\n\r\n1637–1682 m. pilis buvo atstatinėta. 1637–1652 m. pagal nyderlandiškų bastioninių pilių planą architektas G. Pirkas pradėjo perdaryti pylimus. Atsisakyta mūrinio sutvirtinimo. Pagal magistro Jono Ulricho (projektavo ir Radvilų rūmus Vilniuje) projektą pastatyti nauji rūmai, o senieji rūmai buvo nugriauti.\r\n\r\n    Pagrindinis straipsnis – Švedų tvanas.\r\n\r\nPagal 1655 m. rugpjūčio 10 d. Radvilų ir švedų Rygos sutartį nebaigta rekonstruoti Biržų pilis vėl atiteko švedams.\r\n\r\n1657 m. sausio 24 d. 190 žmonių švedų įgula pasidavė LDK lauko etmono Vincento Gosievskio vadovaujamai kariuomenei, kuri apgriovė pilį, sudegino miestą. 1659 m. rugpjūčio 20 d. pilį atsiėmė Boguslavo Radvilos dragūnai. 1659–1669 m. pagal architektas T. Krel-Spinovskio projektą pataisyti pylimai, užtvanka, pastatyti rūmai, kareivinės, arsenalas, vartų bokštas (inžinierius S. Arciševskis).\r\n\r\n    Pagrindinis straipsnis – Šiaurės karas.\r\n\r\nPer 1700–1721 m. Šiaurės karą, 1701 m. vasario 26 d. pilyje Abiejų Tautų Respublikos valdovas Saksonijos kurfiurstas Augustas II ir Rusijos caras Petras I pasirašė antišvedišką Biržų sutartį. 1704 m. rugsėjo 14 d. pilį vėl užėmė švedai, susprogdino rūmus ir kitus pastatus. ', '56.204996129499825, 24.75404739151145', 20),
(87, 'Eišiškių pilis', 'Eišiškių pilis, Eišiškių piliavietė – piliakalnis Šalčininkų rajono savivaldybės teritorijoje, į rytus nuo Eišiškių. Kartais vadinama Gornostajiškių piliaviete. Piliavietė pasiekiama pavažiavus iš Eišiškių link Šalčininkų plentu  126  Šalčininkai–Butrimonys–Eišiškės  1,4 km, yra kairėje šiaurėje, apaugusi.\r\nPiliavietė\r\n\r\nPiliavietė 84 × 112 m dydžio aikštė, apjuosta apie 4 m aukščio ir 18–20 m pločio pylimu, už kurio yra apie 26 m pločio ir 5 m gylio griovys. Ties pylimo pietinės dalies viduriu yra 8 m pločio, rytinėje ir vakarinėje dalyse kiek siauresni, greičiausiai perkasti vėliau, įvažiavimai. Pylimo šiaurės vakarų kampe yra apie 8 m skersmens daugiakampio ar apvalaus mūrinio gynybinio bokšto pamatų liekanų, manoma, kad tai pilies senieji vartai.\r\nTyrimai\r\n\r\n1955 m. piliavietę žvalgė Istorijos institutas, 1968 m. – Mokslinė metodinė taryba. Radinius saugo Lietuvos nacionalinis muziejus. [1] Lietuvos Respublikos Vyriausybės nutarimas dėl paskelbimo kultūros paminklu – 1998-05-19; Nr.612. Paminklo teritorijos plotas 3,03 ha. Fizinio apsaugos zonos pozonio plotas 13000 m².\r\nIstorija\r\n\r\nPilis buvo išplanuota ir įtvirtinta kaip tvirtovė ir greičiausiai yra XIII a. antrosios pusės - XIV a. Lietuvos metraščių legendinėje dalyje minima, kad XIII a. pirmoje pusėje pilį pastatydinęs Eišys. Manoma, kad XIV a. antroje pusėje ji priklausė didžiojo kunigaikščio Vytauto žmonos Onos tėvui Sudimantui. XVI a. metraštininkai mini Eišiškių pilį kaip vieną seniausių lietuvių pilių.\r\n\r\nPiliavietėje XIX a. pirmoje pusėje buvo optinio telegrafo Peterburgas–Varšuva stotis, pastatyta 1830 m., yra jos pastato 15 × 10 m liekanų.[2]\r\n\r\nKai kurių tyrinėtojų manymu, Eišiškių žemės įtvirtinimai – piliavietė priklauso gardinėms (aptvarinėms) pilims – tvirtovėms, statytoms XII a. – XIV a. Šioms piliavietėms būdingas dviejų kontrastinių erdvinių – tūrinių sistemų: horizontalaus smarkiai ištęsto aptvaro ir sunkaus, gerokai aukštyn kylančio pagrindinio bokšto donžono derinys. Pastarasis savo formomis asocijuojasi su bokštinio tipo gynybiniais statiniais, plačiai žinomais XIII a. Voluinėje ir Nemuno aukštupyje. Eišiškių piliavietė yra tarsi Medininkų pilies prototipas.[3] ', '54.17666699938207, 25.020799083022894', 20),
(88, 'Klaipėdos pilis', 'Klaipėdos pilis arba Mėmelburgas (vok. Memelburg) – pilis Klaipėdoje, pirmą kartą minima 1252 m. liepos 29 d. dokumente, kuriame Livonijos ordino didysis magistras Eberhardas fon Zeinė ir Kuršo vyskupas Heinrichas sutaria dėl pilies statybos tarp Nemuno ir Dangės. Tais pačiais metais prie Dangės žiočių pastatyta medinė pilis. Vėliau daug kartų perstatyta, kol XIX a., praradusi savo strateginę reikšmę, buvo nugriauta.\r\n\r\nŠiuo metu išlikusiuose pilies bastionuose veikia muziejus.\r\nIstorija\r\n\r\nKlaipėdos pilis pastatyta 1253 m. strategiškai svarbioje kuršių žemės vietoje – Dangės žiočių kairiajame krante, netoli Klaipėdos sąsiaurio, jungiančio Kuršių marias su Baltijos jūra. Pilis tapo viena vokiečių riterių agresijos į baltų žemes bazių, buvo Klaipėdos komtūrijos centras.\r\n\r\nIš pradžių pilis buvo medinė, du priešpiliai apjuosti grioviais ir gynybine siena. Pilį saugojo natūrali vandens užtvara, pylimai ir medinis gynybos bokštas. 1253–1254 m. medinę pilį pakeitė pastatyta mūrinė pilis. Pilį saugojo vandens pripildyti grioviai (fosa), ties vartais buvo įrengti tiltas ir pylimai. Pilies kieme pastatyta mūrinių ir medinių pastatų.\r\nKlaipėdos pilies planas 1598 m., paskelbtas A. Zemrau\r\n\r\nPilį puldinėjo žemaičiai, retsykiais – skalviai su sembais: 1307 m., 1323 m. (Klaipėdos mūšis), 1360 m., 1379 m. (abu kartus pilis sudeginta). Po 1360 m. pilis perstatyta, turėjo 4 bokštus, viename jų 1438 m. įrengtas kalėjimas. 1393 m. buvo pastatytas gynybinis bokštas, tačiau tais pačiais metais sugriautas per lietuvių antpuolį. Pilis pulta ir 1402 m. bei 1409 m. Kartais žemaičiams talkino Lietuvos Didžiosios Kunigaikštijos kariuomenė. Po Ordino pralaimėjimo Žalgirio mūšyje 1410 m., pilis išlaikė savo strateginę reikšmę, nes Lietuva negalėjo sutarti dėl to, kur turi eiti siena tarp Lietuvos ir Ordino ir Klaipėdą abi šalys laikė savo nuosavybe.\r\n\r\nDidesni pilies įtvirtinimo darbai vyko po 1422 m. Melno taikos, baigti 1441 m. Pilis buvo maždaug kvadratinio plano su kiemu viduje. Išliko dalis XV a. pradžios gynybinės sienos. Šiaurinė siena su bokštais siekė apie 102 m ilgio, jos plotis – 2,2 m, aukštis – iki 11 m, vakarinės sienos ilgis tarp bokštų – mažiausiai 70 m. Kampuose stovėjo du 12 m skersmens cilindriniai bokštai (Didysis parako ir Kunigaikščio), pietryčių kampe – stačiakampis. Patobulinta pilies gynybinė sistema buvo pritaikyta to meto artilerijos pabūklų (bombardų) ugniai atremti. Už gynybinių sienų ėjo apie 6 m pločio kelias, už jo – 8–9 m pločio griovys ir daugiau, kaip 20 m pločio pylimas (apie 2 m virš pilies kiemo), toliau – dar vienas 6 m pločio ir iki 1,5 m gylio sausas griovys. Pilies pastatų sienos – raudonų plytų, eksterjeras ir interjeras – gotikinis. Stogai dengti plokščiomis čerpėmis, dalis – malksnomis.\r\n\r\n1454 m., per Trylikos metų karą (1454–1466 m.), Klaipėdos pilį buvo užėmusi Lenkijos karalystės kariuomenė, 1455 m. – žemaičiai. Pilis XVI a. pradžioje sustiprinta, 1516–1519 m. pastatyti žemių pylimai su bastėjomis. 1520 m. pilį puolė Dancigo karo laivai, žemaičiai. 1524 m. pilis sustiprinta patrankomis.\r\nKlaipėdos pilies piešinys, paskelbtas Ch. Hartknochto 1684 m.\r\n\r\n1525 m. susikūrus Prūsijos kunigaikštystei pilis iki XVI a. vidurio iš pagrindų perstatyta. Buvo uždaro netaisyklingo kvadrato plano su išpjova vartams pietvakarių dalyje. Vartus saugojo du apvalūs bokštai korpusų kampuose, kiti trys stovėjo šiaurės vakarų, šiaurės rytų ir pietryčių kampuose. Korpusų, kurie pastatyti panaudojus XV a. gynybines sienas, plotis po 12,5 m. Pagal J. Putkamerio ir H. P. Fuchso projektą pilis XVII a. pradžioje buvo apjuosta senovės olandų sistemos bastionais (Princo Karlo, Princo Frydricho, Princo Liudvigo ir Frydricho Vilhelmo). Tvirtovės pylimus sutvirtino akmenų ir plytų atraminės sienos su kontraforsais. Po bastionais įrengtos senovės poternos jau XVI a. buvo rekonstruotos ir išplėstos.\r\n\r\n1629 m. pilį apiplėšė ir apgriovė švedai, 1660 m., 1669 m. suniokojo gaisras. 1670 m. ant Princo Karlo bastiono pastatytas dviejų fligelių Komendanto namas.\r\n\r\nXVIII a. pirmoje pusėje pilis dar tvirtinta. 1757 m. per 1756–1763 m. Septynerių metų karą Klaipėdą užėmus Rusijos imperijos kariuomenei, pilis 1763 m. buvo apleista ir pamažu nyko.\r\n\r\n1812 m. per prancūzmetį pilyje buvo įrengtos kareivinės, arsenalas, sandėliai, ligoninė. 1821 m. iš 5 bokštų dar stovėjo du. 1840 m. pradėjo griūti pilies įėjimo skliautai, 1843 m. pašalintos Didžiojo parako bokšto liekanos, apie 1865 m. nuvirto Kunigaikščio bokštas. Dėl to 1865 m. pradėta nerijos forto statyba Kopgalyje. Po 1888 m. buvo parduoti nugriauti svarbiausi pilies mūro pastatai.\r\n\r\nPo 1945 m. buvusioje teritorijoje įsikūrė Klaipėdos bandomoji laivų remonto įmonė, XX a. pabaigoje – Klaipėdos laivų remonto įmonė, 2009 m. iškelta. [1] ', '55.7056887179063, 21.128195639173967', 20),
(89, 'Norviliškių pilis', 'Norviliškių pilis yra rezidencinė pilis Norviliškėse, Šalčininkų rajone, Dieveniškių istoriniame regioniniame parke. Tai XVI a. menantis statinys. Visai neseniai restauruotą Norviliškių pilies kompleksą sudaro trijų aukštų pilies rūmai, restauruoti pilies svečių namai bei pirtis. Planuojama atstatyti ir buvusių kareivinių pastatus.\r\n\r\nPati Norviliškių pilis, vartų bokštas ir gynybinis bokštas kažkada sudarė tipišką uždarą gynybinės pilies sistemą su kompaktišku kiemu centre. Tai retas renesanso laikotarpio tokio pobūdžio komplekso pavyzdys ne tik Lietuvoje, bet ir Europoje.\r\n\r\nŠiandien Norviliškių pilis yra įmonių švenčių, seminarų, vestuvių ar kitų privačių pobūvių rengimo vieta.\r\nIstorija ir legendos\r\n\r\nTeigiama, kad pilį seno dvaro vietoje XVII a. pradžioje pastatė turtingas Rytprūsių pirklys Vaitiekus Šorcas, įsimylėjęs ir vedęs vietos grafaitę Daratą Zienovičiūtę. Būtent dėl jos, kaip teigiama pasakojimuose, pirklys bei karys iš Marienburgo ir likęs Didžiojoje Lietuvos Kunigaikštystėje.\r\n\r\nŠorcai – istorinės asmenybės, aprašytos metraščiuose. Yra net išlikęs Daratos Zienovičiūtės Vaitiekienės Šorcienės portretas. Žinoma, kad Šorcai seną dvarą pirko bendromis lėšomis ir pastatė ten pilį. Po vyro mirties Darata Zienovičiūtė Vaitiekienė Šorcienė, norėdama, kad plistų tikėjimas, pasikvietė iš Vilniaus „mažuosius brolius“ pranciškonus ir 1617 metais fundaciniu aktu jiems užrašė Norviliškių palivarką. Kad pranciškonai turėtų iš ko gyventi, palivarkas buvo užrašytas su dvaro gyvenamaisiais ir ūkio pastatais, javais, galvijais, sodybomis ir daržais, miškais, pievomis ir kitais naudmenimis. Pasikviesti vienuoliai turėjo kaip galima greičiau pasistatyti Šv. Pranciškaus vardo bažnyčią ir prie jos vienuolyną, o tame vienuolyne nuolat gyventi ir kas savaitę laikyti mišias už fundatorius. Vienuolynu tapo Šorcų dvaro rūmai.\r\n\r\n1698 m. kovo 7-8 d. naktį, kai vienuolyno gvardijonas Bonaventūras Vaišvila buvo išvykęs su reikalais ir savo vietoje palikęs Pranciškų Glovackį, gvardijono celėje kilo gaisras. Užsidegė skrynia su dokumentais. Buvo kalbama, kad tuo metu „mažieji broliai“ buvo visiškai girti ir, jei ne vienuolyno tarnai, būtų sudegę kartu su dokumentais. Pavyko išgelbėti ir patį vienuolyną. Vėlesniuose aprašymuose minimas didesnis gaisras. Jis, matyt, buvo XVIII a. pradžioje, kai pro šalį žygiavo kariuomenės. Galimas dalykas, kad tada sudegė bažnyčia ir dėl to vienuolyno lėšomis buvo statoma nauja.\r\nVartų bokštas 2017 metais\r\n\r\n1832 m. vienuolynas buvo uždarytas, vienuoliai perkelti į Naugarduko pranciškonų vienuolyną. Uždaryta ir bažnyčia. Carinė valdžia perėmė mūrinį vienuolyną, bažnyčią ir kitus pastatus. Po kurio laiko medinė bažnyčia buvo išardyta, rąstai nuvežti į Alšėnus, ten iš jų pastatyta cerkvė. Iš pranciškonų paruoštų plytų naujos bažnyčios statybai 1834 m. buvo pastatytos kareivinės. Kareiviai įsikūrė ir senajame vienuolyno pastate, ten išbuvo iki XX a. pradžios. 1904 m. vienuolynas ir rusų kariuomenės pastatytos 2 aukštų kareivinės perėjo iš Karo ministerijos žinios Žemės ūkio ministerijai ir buvo atiduotas mergaičių žemės ūkio mokyklai. Prasidėjus Pirmajam pasauliniam karui mokykla užsidarė.\r\n\r\n1919 m. vienuolyną ir kareivinių pastatą užėmė Surviliškių parapijos gyventojai, pageidaujantys atkurti Norviliškių bažnyčią. Po trejų metų ji buvo pradėta statyti (baigta 1928 m.).\r\n\r\n1933 m. bažnyčios inventoriuje, sudarytame keičiantis klebonui, nurodoma, kad uždarant vienuolyną broliai užkasę į žemę 18 000 auksinų (sidabru ir auksu) katile netoli bažnyčios ir vienuolyno. Daugiau žinių apie lobį nėra. Iki šiol nerastas ir legendinis tunelis iš Norviliškių į Alšėnus, tačiau aplinkinių gyventojų įsitikinimu jis tikrai egzistuoja. Kol kas pavyko rasti tik tunelį, vedantį iš pilies į varpinę. ', '54.23659041501993, 25.78114314657292', 20),
(90, 'Panemunės pilis', 'Panemunės pilis – renesanso stiliaus rezidencinė pilis Jurbarko rajone, Pilies I (arba Vytėnų) gyvenvietėje, pastatyta ant aukšto Nemuno kranto. Architektūros paminklas. Pilis priklauso Vilniaus dailės akademijai.\r\n\r\nGreta pilies yra senas, jau sulaukėjęs parkas (15,62 ha) su 5 kaskadiniais tvenkiniais. Jis labai nuniokotas, pokario laikais iškirtus šimtametes liepas ir kitus medžius. Parke išlikusi 1937 m. statyta Vytėnų laidojimo koplyčia, saugomas Gelgaudų ąžuolas.\r\n\r\nIš pradžių pilis vadinosi Panemunės vardu pagal dvarą, kurio žemėse pastatyta. Vėliau ją perėmus Gelgaudams, ji vadinta Gelgaudų pilimi. Po 1831 m. sukilimo pasikeitus savininkams prigijo Zamkaus vardas. XX a. pradžioje netoliese įsikūrus Vytėnų kaimui, pradėta vadinti Vytėnų pilimi. Šiuo metu vėl vadinama pirminiu savo vardu.\r\nIstorija\r\n\r\n1597 m. Žemaičių pakamario Stanislovo Stankevičiaus-Bielevičiaus Panemunės dvarą įsigijo vengrų kilmės dvarininkas, miško pirklys Jonušas Eperješas. Jis 1604 m. pradėjo statydinti renesansinę rezidencinę pilį. Manoma, kad statinio architektas – Vilniaus Žemutinės pilies rekonstrukcijos autorius Petras Nonhartas (vok. Peter Nonhardt). Pilis baigta statyti 1610 m., tačiau vėliau ne kartą buvo pertvarkyta.\r\n\r\nVytėnų pilis 1753 m. buvo parduota Leonui Igelstromui, kuris 1759 m. ją perleido Akmenės seniūnui, LDK vėliavininkui Antanui Gelgaudui. Naujasis savininkas apleistą pilį rekonstravo, puoselėjo parką ir įkūrė prabangią reprezentacinę savo šeimos rezidenciją. Rekonstruota pilis įgavo klasicizmo bruožų, šiuo stiliumi atnaujinti tvenkiniai, sutvarkytas parkas, jame įrengta oranžerija, aptvarai danieliams. Pietinėje statinio dalyje pro iškirstus langus atsivėrė gražus vaizdas į dvaro parką ir Nemuną. Taip pat buvo pastatytos baltų koklių cilindrinės krosnys, reprezentaciniai kambariai papuošti antikinių figūrų frizais. Pilis tapo prabangia A. Gelgaudo rezidencija.\r\n\r\nGenerolas Antanas Gelgaudas tapo vyriausiuoju 1831 m. sukilimo vadu Lietuvoje. Atvykęs iš Užnemunės jis su 16 tūkst. karių persikėlė per Nemuną ties Gelgaudiškiu ir apsistojo netoli savo tėvonijos. Iš čia prasidėjo sukilėlių kovos Lietuvoje. Pralaimėjus 1831 m. sukilimą ir žuvus A. Gelgaudui, pilis buvo apleista, išgabenta vertinga biblioteka, pilis nusavinta (pats A. Gedgaudas buvo paskelbtas „pirmojo laipsnio valstybiniu nusikaltėliu“). Šeimininkų netekusi pilis buvo menkai prižiūrimai ir ilgainiui vis labiau griuvo. ', '55.09947143377336, 22.986109577258333', 20),
(91, 'Raudondvario dvaras', 'Raudondvario dvaras (arba Raudondvario pilis) – dvaras, stovintis Raudondvaryje, dešiniajame Nevėžio krante. Architektūros ansamblis, kurį sudaro XVII a. 1-osios pusės renesanso pilies rūmai, šiaurinė ir pietinė oficinos, oranžerija, liokajaus namas, arklidės, ūkvedžio namelis, šiaurinis ir pietinis svirnai, ledainė ir parkas (užveistas XIX a.). Pilyje veikia kompozitoriaus J. Naujalio memorialinis muziejus (nuo 2002 m.). Parke organizuojami koncertai, festivaliai, parodos ir kiti renginiai.\r\n\r\nDvaro mūrų spalva suteikė pavadinimą ir visai gyvenvietei. Nors rūmai vadinami pilimi ir turi pilies bruožų (bokštas, šaudymo angos), tačiau gynybinės reikšmės neturėjo, sienas būtų nesunkiai įveikusios to meto patrankos. Tai buvo reprezentaciniai rūmai.\r\nIstorija\r\n\r\n1615 m. rugsėjo 2 dieną Kauno vėliavininkas Jonas Dziavialtauskas laiške LDK dvarionui Mykolui Kiškai užsimena apie pilį. 1652 m. dvarą iš Jono Eustachijaus Kosakovskio įsigijo J. Radvila. Pasakojama, kad pilies pamatus padėti įsakiusi pati Barbora Radvilaitė. 1662 m. iš Radvilų jį įsigijo Vorlovskiai, XVIII a. 2-ojoje pusėje Zabielos, o 1819 m. dvarą įsigijo Tiškevičiai, kurie suremontavo dvaro rūmus, pastatydino papildomų pastatų (oranžeriją, svirnus, arklides ir kt.), įrengė parką.\r\n\r\n1831 m. sukilimo metu rūmai apdegė, todėl 1832–1840 m. Tiškevičiai juos atstatė ir šiek tiek rekonstravo, buvo pertvarkyti ir papildomai pastatyti kiti mūriniai dvaro pastatai: oranžerija (1837–1839 m.), pietinės oficinos antrasis aukštas (1839 m.), šiaurinė oficina (1840 m.), XIX a. viduryje – arklidės ir ratinė. Po 1855 m. rekonstrukcijos jie tapo dar puošnesni ir įgijo neogotikos bruožų. Darbams vadovavo Cezaris Anikinis. Valdant Tiškevičiams (iki 1915 m.) dvaras garsėjo kaip kultūros ir meno centras. Rūmuose buvo dailės galerija, biblioteka (apie 10–20 tūkst. knygų ir rankraščių, siekiančių XVI–XVII amžių).\r\n\r\nI pasaulinio karo metais dvaro rūmuose buvo įsikūrusi vokiečių Oberosto štabas, jame tarnavo garsus rašytojas Arnoldas Cveigas. Apie tuos laikus jis parašė ir 1937 m. išleido istorinį romaną (vok. „Einsetzung eines Königs“; lietuvių kalba: „Mindaugas II“ /vertė K. Urbonavičius/ – Vilnius: Valst. grož. lit. l–kla, 1955).[1]\r\n\r\n1927–1942 m. rūmuose Lietuvos moterų globos komitetas įsteigė vaikų namus. 1944 m. besitraukdami vokiečiai sunaikino rūmus ir oranžeriją, juos sudegino.\r\n\r\n1958 m. dvare įsikūrė Lietuvos žemės ūkio mechanizacijos ir elektrifikacijos institutas, sovietmečiu arklidėse buvo įkurtos mechanizacijos dirbtuvės. 1959–1973 m. pagal architektų S. Čerškutės ir V. Jurkšto projektą pilies dvaro ansamblis buvo atstatytas, paryškinti renesanso bruožai. Dabar rūmai priklauso Žemės ūkio institutui (nuo 1996 m. institutas priklauso LŽŪU). 1994 m. dvaro rūmuose įrengta Raudondvario ir grafų Tiškevičių istorijos ekspozicija, taip pat ekspozicija kompozitoriaus J. Naujalio atminimui, o 2002 m. sausio 1 d. jo garbei čia atidarytas memorialinis muziejus. Atkurta grafų dvaro vėliava. 2008 m. dvaro ansambliui suteiktas kultūros paminklo statusas.\r\n\r\n2018 m. į kompleksą persikėlė Kauno rajono savivaldybės administracijos Civilinės metrikacijos skyrius[2].\r\nParkas\r\nBuvusioje dvaro oranžerijoje įrengtas restoranas\r\n\r\nŠalia dvaro 1834 m. buvo įkurtas pilies parkas, rekonstruotas XX amžiuje. Šiaurinis parko pakraštys pereina į mišką. Čia auga raudonasis klevas, veimutinė pušis, kryminė liepa, pavasarį pražystantys edelveisai. Parko takeliai veda link Nevėžio kraštovaizdžio draustinio. Senasis („vestuvinis“) takas veda link Raudondvario medelyno, kur gausu dekoratyvinių medžių ir krūmų. Draustinis apima Nevėžio slėnį (kylant aukštyn nuo tilto ties Raudondvariu), įkurtas siekiant išsaugoti Nevėžio erozinį senslėnį ir jo kraštovaizdį bei retųjų augalų bendrijas. ', '54.94332720020993, 23.784705576713538', 31),
(92, 'Leipalingio dvaras', 'Leipalingio dvaras – dvaras Druskininkų rajone, Leipalingio miestelyje. Išlikusi oficina.\r\nIstorija\r\n\r\nDvaras paminėtas 1503 m. balandžio 7 d., kai jį Aleksandras dovanojo Jonui Teodorui Pliuškovui, pabėgusiam iš Maskvos kunigaikščio Ivano III užimtos Smolensko žemės. Vėliau, dvarui likus be šeimininko, 1508 m. birželio 28 d. Žygimantas Senasis jį padovanojo Jonui Sapiegai. Sapiegos 1520 m. čia pastatė cerkvę. Valdant Jono sūnui Povilui Sapiegai, dvare kilo didelis gaisras, sudegė cerkvė ir daugelis dvaro pastatų. Vėliau, giminei priėmus katalikybę, Mikalojus Sapiega fundavo bažnyčios statybą bei atstatė dvarą. Per ATR-Maskvos karą (1654-1667) dvaras sudegintas. Sapiegos dvarą valdė iki 1742 m.\r\n\r\nVėliau dvaras priklausė Masalskiams, nuo XVIII a. pabaigos - Pliateriams, o XVIII a. pab. - XIX a. pr. Leipalingis priklausė Kruševskių giminei. Jie pastatė išlikusius dvaro rūmus, prie dvaro veikė geležies liejykla. XIX a. pab. - XX a. pr. dvarą nusipirko Peterburgo pirklys, inžinierius Petras Balinskis. Jis labai puoselėjo tiek dvarą, tiek patį miestelį. Kasė kanalus, puoselėjo parką, buvo iškastas Simoniškės ežerėlis, padaryti prabangūs tilteliai, altanos. Paskutinis dvaro savininkas Košica dvarą pralošė Monte Karlo kazino, kur ir nusišovė.\r\n\r\nPo 1923 m. dvaras išparceliuotas. 1923 m. dvare įkurta Leipalingio progimnazija, su pertraukomis veikusi iki 2004 m.\r\n\r\n2021 m. pabaigoje kapitališkai suremontuotos Leipalingio dvaro antros dalies patalpos. Pastate įrengta Leipalingio laisvalaikio salė, darbo kabinetai, grimerinė, 20 vietų konferencijų salė, antrame aukšte – 150 vietų koncertų salė.[1] ', '54.09812513808783, 23.86087303014062', 31),
(93, 'Dzūkijos nacionalinis parkas', 'Dzūkijos nacionalinis parkas – Lietuvos valstybinis parkas, įkurtas 1991 m. gamtiniu ir kultūriniu požiūriu turtingiausioms Dzūkijos krašto teritorijoms saugoti, tvarkyti bei naudoti.\r\n\r\nPagrindiniai uždaviniai – išsaugoti Dainavos krašto gamtinius ir kultūrinius kompleksus, užtikrinti Nemuno ir Merkio santakos upyno ekologinę pusiausvyrą, puoselėti Dzūkijos kultūrines tradicijas, propaguoti tradicinius ūkininkavimo metodus ir sudaryti sąlygas pažintiniam turizmui.\r\n\r\nParkas yra pačiuose Lietuvos pietuose, direkcija – Merkinėje. Tai didžiausia saugoma teritorija Lietuvoje,[1] kurios plotas – 55 920 ha. Didžioji parko dalis yra Varėnos rajone (apie 95 %), o mažesnioji – Alytaus ir Lazdijų rajonuose bei Druskininkų savivaldybėje. Parko teritorija prateka Ūla, Merkys, Nemunas. Parko teritorija padalinta į 10 girininkijų.\r\n\r\nNacionaliniame parke galima susipažinti su Dzūkijos gamtos vertybėmis, šilinių, panemunių ir gruntinių dzūkų buitimi, tradicijomis ir papročiais.\r\nIstorija\r\n\r\nDzūkijos nacionalinis parkas įsteigtas 1991 m. balandžio 23 d., per Jurgines. Lig tol šioje vietoje jau buvo įsteigta keletas saugomų teritorijų – Ūlos landšaftinis ir Subartonių istorinis landšaftinis draustiniai (nuo 1960 m.), Skroblaus landšaftinis, Merkio ichtiologinis, Bakanauskų, Merkinės, Žeimių–Gudelių botaniniai draustiniai (nuo 1974 m.).[2]\r\n\r\nĮstojus į Europos Sąjungą, parkas prisijungė prie Paukščių ir Buveinių apsaugos direktyvų, Natura 2000 teritorijų tinklo. Nuo 2011 Dzūkijos nacionalinis parkas kartu su Čepkelių rezervatu yra europinio vertingiausių laukinės gamtos teritorijų tinklo (PAN parkai) dalis (vienintelis Lietuvoje).[1]\r\nGamta\r\nPaviršius\r\nMerkio ir Nemuno santaka ties Merkine\r\nKlonių kopa Marcinkonyse\r\n\r\nDzūkijos nacionalinis parkas yra smėlėtoje Dainavos lygumoje. Parko paviršius yra vidutiniškai ~100 m aukštyje virš jūros lygio. Čia yra savitų žemyninių kopų Marcinkonių, Musteikos, Lynežerio ir Grybaulios apylinkėse. Dzūkijos žemyninių kopų juosta tęsiasi 61 km, apsupdamos Čepkelių raistą, užima ~905 km² plotą.[2] Kopos daugiausia pasagos pavidalo, nukreiptos į rytus. Plačiausias kopų ruožas (6,8 km) yra ties Marcinkonimis. Už 4 km į šiaurės rytus nuo Marcinkonių stūkso aukščiausia parko kopa – Dalgiakalnis (168,1 m).[2] Dzūkijos kopos susidarė Nemuno apledėjimo pabaigoje, ledyno tirpsmo vandenims išplovus uolienas. Lygumos vietoje susidarė prieledyninės marios. Dabar daugelis kopų apaugusios pušynais (kerpšiliais), tačiau dėl kirtimų ar kitos ūkinės veiklos pažeidus dangą gali atsiverti pustomos smėlio kopos. Tokia kopa yra Marcinkonyse – Gaidzių kopa.\r\n\r\nŠiaurės vakaruose (į šiaurę nuo Merkinės) parkas siekia Dzūkų aukštumos pakraštį. Ten būdingas banguotas paviršius, giliuose dubakloniuose telkšo ežerai. Didžiųjų upių (Nemuno, Merkio) slėniai su keliomis terasomis. Nemunas parko teritorijoje, ties Panaros ir Netiesų kaimais, daro kilpą ir graužiasi per moreninį gūbrį, palikdamas keletą rėvų (Bajorė ties Ulčičiais, Sakalas ties Dubakloniu, Žirklės ties Merkine, Siuvėjas ties Maksimonimis). Prie Nemuno ties Krikštonimis yra žemiausia parko vieta (66 m).[2]\r\nKlimatas\r\n\r\nDzūkijoje dėl didelių, lengvai įšylančių, bet greitai ir atvėstančių smėlynų plotų klimatas kontrastingas. Čia būdingi vieni didžiausių temperatūrų svyravimų Lietuvoje tiek per parą, tiek per metus. Vasarą dažnos lokalinės audros. Mažas garuojamumas, nes vanduo greitai susigeria į smėlį, o paskui ištrykšta šaltiniais.[2]\r\nMiškai\r\n\r\nBeveik visas parkas įkurtas dalyje Dainavos girios miškų masyvo, tad jame miškai užima 85 % teritorijos. 92 % parko medynų sudaro pušynai – daugiausia kerpšiliai (ant kopų gūbrių) ir brukniašiliai (lygumėlėse, kopų pašlaitėse). Šiluose gausus kadagių pomiškis. Reljefo pažemėjimuose, paraistėse, durpingose ežerų pakrantėse auga mėlyniniai beržynai. Papelkiais, upelių slėniuose, paežerėse, kur derlingesnė žemė, auga taip pat juodalksnynai, eglynai. Jų daugiau Nemuno slėnyje, Musteikos apylinkėse. Į šiaurę nuo Merkinės, Subartonių apylinkėse auga nedidelis ąžuolynas (5 ha) su lazdynų ir aukštų žolių pomiškiu.[2] Didesni pelkynai susitelkę pietinėje dalyje, ten peri kurtiniai, tetervinai, gervės.\r\nKerpšilis Skroblaus rezervate\r\n\r\nDidžiųjų upių pakrantėse veši karklynai, Dzūkų aukštumos kalvose bei sausuose upių šlaituose galima aptikti termofilinių krūmynų (gudobelių, ožekšnių, šunobelių) plotelių.\r\n\r\n2001–2002 m. Dzūkijos nacionaliniame parke išskirtos 133 kertinės ar potencialiai kertinės miško buveinės, pasižyminčios didesne rūšių gausa. Labai savitos pušynų kertinės buveinės, kuriose yra 130–180 m. senumo pušų, išliko Ūlos slėnio šlaituose, Stėgaliuose, Musteikos pelkių salose. Ūlos, Merkio, Nemuno slėnių salpose ir šlaituose, Musteikos žemapelkėse saugomos juodalksnynų kertinės buveinės. Svarbios ąžuolynų buveinės yra Subartonių apylinkėse, Merkio, Griovos šlaituose. Prie Trakiškių ir Žiūrų yra unikalios ganomų gluosnynų kertinės buveinės.[2]\r\nVandens telkiniai\r\nSkardingi Ūlos krantai tarp Zervynų ir Mančiagirės\r\n', '54.15699460709358, 24.183949658448526', 23),
(94, 'Kuršių nerijos nacionalinis parkas', 'Kuršių nerijos nacionalinis parkas – nacionalinis parkas Lietuvos vakaruose, Kuršių nerijoje, užima 264,74 km² plotą. Sausuma užima 37 proc. teritorijos (iš jos 70-74 proc. – miškai), iš rytų parką skalauja Kuršių marios (16 proc. parko ploto), iš vakarų – Baltijos jūra (47 proc. parko ploto). Ribojasi su Rusijos Kuršių nerijos nacionaliniu parku.\r\n\r\nParko direkcija yra Nidoje. Kuršių nerijos nacionalinis parkas įsteigtas 1991 m. siekiant išsaugoti vertingiausią gamtiniu ir kultūriniu požiūriu Lietuvos pajūrio kraštovaizdžio kompleksą su unikaliu Europoje kopagūbriu ir etnokultūrinio paveldo vertybes. 2000 m. Kuršių nerija įtraukta į UNESCO pasaulinio kultūros paveldo sąrašą. Kuršių nerija taip pat priklauso saugomų teritorijų tinklui Natura 2000.\r\nGamta\r\n\r\nParke saugoma: Kuršių nerijos didysis kopagūbris, senosios parabolinės kopos ties Juodkrante, mirusios arba pilkosios kopos ties buvusiomis, dabar užpustytomis Agilos ir Naglių gyvenvietėmis, pustomos Parnidžio ir Sklandytojų kopos, užpustyti palaidoti dirvožemiai, taip pat pajūrio ir pamario palvės, apsauginis pajūrio kopagūbris, savita augalija ir gyvūnija, taip pat miškai su sengirės fragmentais. Vertingi apsauginis pajūrio kopagūbris, savitos Kuršių nerijos augalų ir gyvūnų bendrijos, miškai su sengirės fragmentais, marių ir jūros ekosistemos.\r\n\r\nPer neriją nusidriekia paukščių migracijos kelias, kuriuo pavasarį ir rudenį praskrenda milijonai įvairių rūšių paukščių. 30 km nuo Klaipėdos yra paukščių žiedavimo stotis. Puikūs vaizdai atsiveria nuo apžvalgos aikštelių ant Garnių kalno, Naglių gamtos rezervate, ant Parnidžio ir Vecekrugo kopų ir Karvaičių kopų papėdėje, Pervalkos įlankoje, ant Meškos galvos kopos.\r\n\r\nParkas išsiskiria savo unikalumu, kadangi tarp Kuršių marių ir Baltijos jūros esantis siauras Kuršių nerijos pusiasalis sudarytas iš vandens srovių atnešto smėlio. Vėjų supustytos kopos, drėgni pažemėjimai (palvė), paplūdimiai – visas šis gana jaunas kraštovaizdis nuolatos kinta. Siekiant sulaikyti pustomą smėlį, dideli kopų plotai buvo užsodinti mišku. Senajame nerijos miške, ypač arčiau jūros, dėl nuolat pučiančių vėjų, medžiai auga pasvirę. Kuršių marių pakrantės čia smėlėtos, su keletu nendrėmis apaugusių įlankų. Į marias daug kur leidžiasi smėlėti dar gyvų kopų krantai. Sausi ir nederlingi nerijos dirvožemiai, staigios ir dažnos orų permainos, stiprūs vėjai neleido plėstis gyvenvietėms ir buvo palankūs savitai augmenijai formuotis. ', '55.29516490297648, 20.98912352421843', 23),
(95, 'Trakų istorinis nacionalinis parkas', 'Trakų istorinis nacionalinis parkas – nacionalinis parkas piеtryčių Lietuvoje, į vakarus nuo Vilniaus, greta Trakų (kuriuose yra parko direkcija). Įkurtas 1992 metais, siekiant išsaugoti Lietuvos istorinį valstybingumo centrą Trakuose su jo autentiška gamtine aplinka. Tai vienintelis istorinis nacionalinis parkas ne tik Lietuvoje, bet ir visoje Europoje. Įeina į Trakų rajono (didžioji dalis) ir Elektrėnų savivaldybės sudėtį.\r\n\r\nParko plotas – 8149 ha (miškai 30 proc., ežerai 18 proc.). Istorinio parko centras – Trakų senamiestis, salos pilis, į kurią patekama pėsčiųjų tiltu, ir pusiasalio pilių kompleksas.\r\nGamta\r\n\r\nLygiagrečios ledyno suformuotos kalvų bei gūbrių grandinės kaitaliojasi su siaurais ir giliais arba plačiais ir plokščiais ežeringais tarpgūbriais. Parke yra 32 ežerai. Galvės, Skaisčio, Totoriškių, Lukos ežerai jungiasi protakomis ir sudaro vientisą sistemą. Pats didžiausias iš ežerų – Galvės ežeras su 21 sala (žinomiausia Pilies sala), o švariausias – Akmenos ežeras.\r\n\r\nĮdomi Kudrionių giria ir Plomėnų bei Varnikų pelkynai, kuriuose prieglobstį randa daug žinduolių ir paukščių rūšių. Plomėnų pelkėje didelė vandens paukščių kolonija, gausu saugojamų augalų rūšių. Plomėnų ežere įsikūrusios didelės rudagalvių kirų kolonijos. Su Varnikų draustinio gamta galima susipažinti pažintiniame pėsčiųjų take.\r\n\r\nParkas žymus regyklų skaičiumi ir vaizdų patrauklumu. Galvės ežero šiaurinėje pakrantėje yra kalvos viršūnė, atverianti estetinį vaizdą ir puikias apžvalgos galimybes.\r\nTrakų salos pilis\r\nKultūros vertybės\r\n\r\nNedidelėje parko teritorijoje sutelktas didžiulis Lietuvos kultūros paveldo potencialas. Čia yra Senųjų Trakų piliavietė, kur didysis kunigaikštis Gediminas įkūrė senąją Lietuvos sostinę ir kur apie 1350 metus gimė Vytautas Didysis. Su Trakais susiję žymiausi XIV–XV a. ir vėlesni Lietuvos istorijos įvykiai: Bražuolės sutartis 1382 m., Vytauto krikštas 1384 m., Vytauto mirtis 1430 m., paskutiniojo Kęstutaičio – Žygimanto žūtis 1440 m., įnirtingi mūšiai su Teutonų ordinu. Nuo XVII a. čia rusena Trakų Madonos – visos Lietuvos globėjos, pirmojo Lietuvoje popiežiaus karūnuoto paveikslo, garbinimo kultas.\r\nUžutrakio dvaro rūmai\r\n\r\nKultūros paveldo objektų skalė Trakų istoriniame nacionaliniame parke plati: nuo pavienių itin reikšmingų dailės, istorijos, archeologijos, architektūros objektų iki didžiulių ir nepaprastai vertingų sukultūrintų kraštovaizdžių. Didžiausia Trakų istorinio nacionalinio parko vertybė – buvusios Trakų kunigaikštystės, o vėliau vaivadijos centro – vieno iš Lietuvos valstybingumo lopšių – Trakų miesto kultūros paveldas.\r\n\r\nParkas garsėjo trimis pilimis – Senųjų Trakų, Pusiasalio (išlikę griuvėsiai Trakų miesto centre) ir Salos pilis. Pastarojoje įrengtas muziejus yra vienas populiariausių turistinių objektų. Tarp Galvės ir Akmenos ežerų yra 48 ha Rėkalnio parkas, o prie Galvės ir Skaisčio ežerų – Užutrakio dvaras ir parkas (XIX a. pabaiga).\r\nLaisvalaikis ir pramogos\r\nGalvės ežeras\r\n\r\nTrakai – viena mėgstamiausių trumpalaikio poilsio vietų. Čia puiku maudytis, galima pažvejoti, paplaukioti jachtomis, valtimis, platus įvairių kitų poilsio formų pasirinkimas. Buvusiame Totoriškių dvare yra vienas geriausių Lietuvoje kempingų. Įdomi ir informatyvi Trakų istorijos muziejaus ekspozicija Salos pilyje. Unikali karaimų etnografinė paroda, graži Užutrakio dvaro sodyba. Varnikų miške yra mokomasis takas. Prie ežerų nuomojamos valtys. Trakuose yra vandens sporto centras, čia vyksta irklavimo regatos (Galvės regata), o jachtų klubas įsteigtas dar 1934 m. Buriuotojai už tam tikrą mokestį plukdo poilsiautoj', '54.647564998263114, 24.933295799999996', 23);
INSERT INTO `locations` (`id`, `name`, `description`, `coordinates`, `categoryID`) VALUES
(96, 'Žemaitijos nacionalinis parkas', 'Žemaitijos nacionalinis parkas – nacionalinis parkas šiaurės vakarų Lietuvoje (didžioji dalis Plungės rajone, mažesnioji – Skuodo rajone), įsteigtas 1991 metais, siekiant išsaugoti, tvarkyti ir naudoti vertingiausias gamtiniu ir kultūriniu požiūriu Žemaitijos teritorijas. Parko teritorija užima 21720 ha plotą, direkcija yra Platelių miestelyje. Pagrindiniai šio parko uždaviniai yra išsaugoti Platelių ežeryną ir jo apylinkių gamtos kompleksą, organizuoti gamtinės aplinkos, etnokultūros paveldo ir mokslinius tyrimus, vykdyti nuolatinius stebėjimus ir kaupti informaciją.\r\nGamtos vertybės\r\nŽemaitijos nacionalinio parko direkcija\r\nŽemaičių Kalvarija\r\nTikinčiųjų procesija eina Kalvarijos Kalnus. 2006 m.\r\n\r\nŽemaitijos parko kalvotą reljefą suformavo tirpstantis ledynas maždaug prieš 12 000 metų. Susidariusios kalvos yra palyginti aukštos, apie 150–190 metrų. Ežerai užima daugiau kaip 7 proc. parko teritorijos, čia telkšo didžiausias Žemaitijoje Platelių ežeras, kurio reginys neatsiejamas be Platelių ežero salų. Be jo yra dar 25 mažesni ežerai.\r\n\r\nParke miškai užima apie 45 proc. visos teritorijos. Mokslui ypač vertingi miškingi Plokštinės ir Rukundžių pelkynai, Platelių ežero, Laumalenkos ir Šilinės hidrografiniai kompleksai, Gardų ozas, Babrungo ir Mergupio upių slėniai, Paburgės, Siberijos, Pakastuvos, Užpelkių, Ertenio ir Paparčių pelkės, savitos ir įdomios Paplatelės, Šeirės ir Pailgio miškų bei Juodupio pelkėtų pievų ekosistemos, retieji augalai ir gyvūnai. Platelių ežere veisiasi retos lašišinės žuvys – seliavos ir Platelių sykas.\r\n\r\nAuga 7,2 m apimties, 2,1 m skersmens ir 34 m aukščio Raganos uosis. Greta parko, Puokės kaime slūgso didžiausias Lietuvoje riedulys – Barstyčių akmuo. Gyvena ir veisiasi vilkai, nuolatos gyvena lūšys. Naktimis skraido 9 šikšnosparnių rūšys.\r\nKultūros paveldas\r\n\r\nParke yra saugomas ir lankytojams labai įdomus sudėtingas Šiaurės Žemaitijos archeologinis kompleksas su Mikytų, Šarnelės, Pūčkorių, Gegrėnų, Ž. Kalvarijos ir kitais piliakalniais (iš viso – 11) bei alkakalniais, senoji Platelių dvarvietė ir Pilies salos piliavietė. Tarp Šventorkalnio ir Pilies salos ežero vandenyje dar pastebimos medinio Platelių senovės tilto liekanos. Piliakalniai sutelkti šiaurės vakarinėje parko dalyje ir dažnai sudaro vieną kompleksą su alkakalniais.\r\n\r\nPlačiai žinomas Žemaičių Kalvarijos (Gardų) miestelis su bažnyčia ir Kristaus kryžiaus kelio koplytėlėmis, senomis Didžiųjų Kalvarijos atlaidų tradicijomis. Platelių miestelyje išlikęs Platelių dvaro parkas ir dalis pastatų. Dėmesio vertos XVIII a. medinės Beržoro ir Platelių bažnyčios, poeto V. Mačernio gimtinė Šarnelėje, etnokultūrinės vertės požymius išlaikę Stirbaičių ir Visvainių kaimai. Nemažai muziejų – Platelių dvaro svirne ir arklidėse veikia istorijos, etnografijos, gamtos ir Užgavėnių ekspozicijos, greit pradės veiklą amatų centras. Taip pat yra ir kitų muziejų: medžio meistrų Godeliuose, literatūriniai Bukantės dvarelyje ir Žemaičių Kalvarijoje, meno galerija Babrungėnuose. Parke išlikę nemažai tradicinių žemaitiškų sodybų – jų yra Beržore, Godeliuose, Šarnelėje, Žemaičių Kalvarijoje.\r\n\r\nParke yra unikali militarizmo ekspozicija buvusioje Plokštynės raketinėje bazėje įkurtame Šaltojo karo muziejuje. Turistai, lydimi parko darbuotojų, gali apsilankyti požeminiuose labirintuose, apžiūrėti 27 m gylio raketos šachtą. Daugiau apie Šaltojo karo muziejų skaitykite čia Archyvuota kopija 2012-11-11 iš Wayback Machine projekto..\r\nLaisvalaikis ir pramogos\r\n\r\nŽemaitijos NP yra platus įvairių užsiėmimų pasirinkimas. Čia geros sąlygos žvejybai, pasivaikščioti pažintiniais takais. Buriuoti tinka Platelių ežeras, kuriame Platelių jachtų klubas kasmet organizuoja Platelių regatą ir kitus renginius, čia galima išsinuomoti ir valtis. Dviratininkams parengti 3 maršrutai, išsinuomoti dviračius galima Plateliuose.\r\n\r\nApie Platelių ežerą veda dviračių takas. Į šiaurę, visai šalia Platelių su unikaliomis gamtos vertybėmis supažindina 4,1 km ilgio Šeirės gamtos takas. Gausybę poilsiautojų pritraukia Platelių ežeras. Prie Platelių, Luokos, Skyplaičių, Ilgio ežerų yra 9 stovyklavietės. Prie Platelių ežero įrengta apžvalgos aikštelė, gražios panoramos atsiveria nuo Jazminų ir Medsėdžių kalnų, Mikytų alkakalnio, Žemaičių Kalvarijos kalvų. Prie Pakastuvos ežero įrengtas paukščių stebėjimo bokštelis.\r\n\r\nKasmet tūkstančius žmonių sutraukia Žemaičių Kalvarijos atlaidai. Parke švenčiamos Užgavėnės, Joninės, vyksta plaukimo maratonas per Platelių ežerą, paskutinį liepos savaitgalį vyksta Platelių regata. ', '56.032674528645146, 21.853145314981912', 23),
(97, 'Aukštaitijos nacionalinis parkas', 'Aukštaitijos nacionalinis parkas – seniausias nacionalinis parkas Lietuvoje, įkurtas 1974 metais siekiant išsaugoti unikalią trijų kraštovaizdžio sričių sandūroje esančią Žeimenos aukštupio ekosistemą, jos gamtos ir kultūros vertybes. Parko plotas 40574 ha, vandenys užima 15,5 proc., miškai – 69 proc. teritorijos, tai antras pagal plotą nacionalinis parkas Lietuvoje. Didžioji Ažvinčių-Minčios girios dalis, bei maža Labanoro girios dalis yra nacionalinio parko ribose.\r\nGeografija\r\n\r\nParkas yra rytų Lietuvoje, Ignalinos, Švenčionių ir Utenos savivaldybėse. Direkcija įsikūrusi Palūšėje. Arčiausiai parko yra du miestai – Ignalina (iki parko ribos 1 km) iš rytų ir Švenčionėliai (iki parko apie 4,5 km) iš pietų, bei paties parko pietinėje dalyje Kaltanėnų miestelis. Parką pietvakariuose kerta Švenčionėlių – Utenos geležinkelis. Iš parko plentai į Uteną, Molėtus, Švenčionėlius, per Ignaliną į Švenčionis bei Visaginą.\r\n\r\nParkas yra 3 geografinių sričių sandūroje: senesnę Švenčionių–Naručio moreninę aukštumą ir jaunesnę Aukštaičių aukštumą skiria smėlingoji Žeimenos lyguma. Paviršius labai banguotas, įvairus (būdingas aukštis – 155 m). Būdingi jauriniai, jauriniai pelkiniai, velėniniai karbonatiniai, velėniniai glėjiniai, aliuviniai, pelkiniai dirvožemiai.\r\n\r\nAukštaitijos nacionaliniame parke yra virš 80 ežerų, viršijančių 0,5 ha plotą: Dringis, Lūšiai, Pakasas, Almajas, Ūkojas, Utenas, Baluošas, Asalnai, Tauragnas (giliausias šalyje), Žeimenys, Kretuonas, Vajuonis, Ūsiai, Kiaunas, Linkmenas, Žiežulnys, Asėkas, Alksnas ir kt. Svarbiausia upė – Žeimena, taip pat teka 17 mažesnių upelių (Kiauna, Kretuona, Švogina, Būka, Tauragna, Srovė, Minčia ir kt.). Pelkės užima apie 2000 ha (Pliaušės, Minčios ir kt.).\r\nIstorija\r\n\r\nParkas įkurtas 1974 m. Tai buvo trečiasis nacionalinis parkas TSRS (po Estijos ir Latvijos). Parko schemą parengė Statybos ir architektūros instituto darbuotojų grupė (vadovas – architektas V. Stauskas).\r\nGamta\r\n\r\nNuo aukštų parko kalvų atsiveria puikūs vaizdai į ežerus, dirbamus laukus ir miškus. Toks kraštovaizdis būdingas ežeringoms moreninėms aukštumoms. Įdomūs Puziniškio ir Šiliniškių gūbriai, Ladakalnis. Parke tyvuliuoja 126 ežerai, daugiausia – centrinėje parko dalyje. Didžiausi parko ežerai: Kretuonas (829 ha), Dringis (725 ha), Baluošas (442 ha). Parko teritorijoje yra ir giliausias Lietuvos ežeras – Tauragnas (60,5 m gylio). Ežerai jungiasi protakomis ir upeliais, iš Žeimenio ežero išteka ir 22 km parko teritorija vingiuoja Žeimena.\r\n\r\nParkui priklausančiose Ažvinčių (sengirė) bei Minčios giriose, Linkmenų, Šakarvos–Pakretuonio vyrauja pušynai (81 %); daug mažiau yra beržynų, eglynų, juodalksnynų, drebulynų, ąžuolynų, baltalksnynų. Ties Šuminų kaimu Baluošo pakrantėje yra savitas kadagynas, o tarp Linkmeno ir Asėko ežerų – unikalus Ginučių ąžuolynas. Gamtininkams labai įdomios paežerių ir miškų pelkutės, upelių protakos, gausu saugomų augalų ir gyvūnų rūšių, kai kurios jų Lietuvoje labai retos. Į Žeimeną atplaukia neršti lašišos, į miškus atklysta vilkai, kartais net meškos, nuolatos gyvena lūšys, briedžiai, elniai, stirnos. Aptiktos didelės šikšnosparnių kolonijos, įsikūrusios didelės rudagalvių kirų kolonijos Kretuono ežero Didžiojoje saloje. Su parko augalija galima susipažinti Palūšės botaniniame take, stebėti paukščius įdomiausia Asėko ir Kretuono ežeruose.\r\n\r\nAukštaitijos nacionaliniame parke randama virš 776 augalų, 28 žuvų, 11 varliagyvių, 4 roplių, 127 paukščių rūšys. Iš retųjų rūšių paminėtini: augalai – belapė antbarzdė, blyškioji džioveklė, ežerinė lobelija, plačialapė klumpaitė, kalninė arnika, mažoji gegužraibė; gyvūnai – žvirblinė pelėda, juodakaklis naras, juodasis gandras, didysis dančiasnapis, erelis žuvininkas, pelėsakalis, tripirštis genys, pilkoji meleta, mažasis erelis rėksnys, uldukas, nendrinė rupūžė ir kt.[1]\r\n\r\nParke saugoma nedidelė, bet graži Gervėčių aukštapelkė. Varniškių II kaime yra du medžiai – gamtos paminklai: Varniškių ąžuolas ir liepa. Prie Tauragnų-Kazitiškio kelio stūkso akmuo Mokas, apie kurį pasakojamos legendos. Nuo Ladakalnio atsiveria viena gražiausių Lietuvoje panoramų: medžių juostomis įrėminti ežerai, iškilūs gūbriai, piliakalniai.\r\nSaugomos teritorijos\r\nParke yra daugybė kraštovaizdžio, hidrografinių, telmologinių ir kitų gamtos draustinių. Keli senieji kaimai turi etnokultūrinių draustinių statusą, tai: ', '55.34393420377203, 26.055471178347936', 23),
(98, 'Plungės dvaras', 'Plungės dvaras – buvusio dvaro sodyba, esanti Plungėje. Dvaro laikrodinėje įsikūrusi Plungės biblioteka.\r\nIstorija\r\nRūmų durų fragmentas\r\nPlungė manor 2018 3.jpg\r\nPlungė manor 2018 2.jpg\r\n\r\nPlungės dvaras minimas nuo 1565 metų. Dvaro valdytojai nuolat keitėsi: nuo 1570 m. Žygimantui Augustui Plungės seniūniją užrašius Mykolui Aleknavičiui, dvaro valdytojais buvo Valavičiai, Karpiai, Krispinai-Kiršenšteinai. XVIII a. pabaigoje dvaro ansamblį valdė Vilniaus vyskupas Ignotas Masalskis. Po vyskupo nužudymo 1794 m. visus jo dvarus paveldėjo jo brolio duktė Elena Apolonija Masalskytė-de Linjė ir jos antrasis vyras grafas Vincentas Potockis.[1]. Galiausiai 1806 m. rūmus įsigijo grafas Platonas Zubovas, o 1873 m. jie buvo parduoti Mykolui Oginskiui.[2]\r\n\r\nBūtent Oginskiai 1879 m. pastatydino didingus, neorenesanso stiliaus (architektas Karlas Lorencas) rūmus. Jų vidus buvo įrengtas 1882-1885 m. Rūmus dekoravo Kazimiero Somerio stiuko dirbtuvių meistrai iš Varšuvos. Interjerą puošė lipdyba, tapybos pano, puošnios krosnys, kolekciniai baldai.[3] Tai buvo Oginskių dvaro rezidenciniai rūmai. 1873–1902 m. dvare veikė muzikos mokykla. Joje mokėsi ir Mikalojus Konstantinas Čiurlionis[4] Dvare taip pat buvo įsteigtas žemaitukų žirgynas, 1899 m. surengta žemės ūkio ir amatų paroda.[5].\r\n\r\nPo M. Oginskio mirties 1902 m. rūmų kompleksą toliau prižiūrėjo jo žmona. 1905 m. ji įsteigė mokyklą dvaro tarnautojų vaikams, globojo senelių prieglaudą, ligoninį, išlaikė vaikų darželį. Tačiau po Pirmojo pasaulinio karo rūmuose nebebuvo gyvenama - juose 1922 m. įsikūrė &quot;Saulės&quot; gimnazija, o vėliau - Žemės ūkio mokykla. 1934 m. rūmai atiteko Lietuvos kariuomenės artilerijos pulkui. Po gaisro 1941 m. iki 1953 m. rūmai stovėjo nenaudojami. [1953]] m. buvo nuspręsta iš Rietavo į rūmus perkelti Žemės ūkio technikumą. 1961 m. buvo baigti rūmų atstatymo darbai ir juose įsikūrė Plungės vidurinė mokykla. 1965-1994 m. rūmuose veikė Plungės statybininkų mokykla.[6]\r\n\r\n1994 m. rūmuose įkurtas Žemaičių dailės muziejus, kuriame kaupiamos ir eksponuojamos muziejinės vertybės, atspindinčios Žemaitijos regiono kultūrinę, istorinę įvairovę, saugomos ir puoselėjamos Mykolo Oginskio dvaro tradicijos.[7]\r\n\r\n2012-2015 m. rūmai restauruoti. Šiuo metu dvaro ansamblį sudaro dešimt XIX a. pastatų ir statinių. Juos supa vienas didžiausių (58,3 ha) mišraus stiliaus parkų Lietuvoje.[8]\r\nParkas\r\n1930 m. Vytauto Didžiojo ąžuolo sodinimas Plungėje\r\n\r\nPlungė garsėja kunigaikščių Oginskių parku. Čia auga Perkūno ąžuolas. Parko plotas: 58,3 hektarai. Dvaro sodybos parko dalyje įsikūręs Plungės centrinis stadionas.\r\n\r\nManoma, kad parkas įkurtas XVIII amžiaus viduryje. Panaudojant Babrungo upę bei šaltinius, parke buvo sukurta septynių tvenkinių sistema. Priešais rūmus buvo iškastas apvalios formos baseinas, jo viduryje sumontuota salelė, kurioje stovėjo skulptūra. Parke buvo pasodinta daug egzotinių medžių bei krūmų, liepų, uosių ir skroblų alėjų, poilsiui įrengta grybo ir kitokių formų pavėsinių, nemažai skulptūrų, vazų.[9].\r\n\r\nParko centrinė dalis užima aukštą, lygią terasą, yra geometrinio plano. Kitą dalį užima peizažinis parkas, apimantis Babrungo upės vagą ir dvi lomas - rytinę ir vakarinę. Pastarojoje įrengti keturi tvenkiniai, o rytinėje - trys. Pagrindinė alėja prasideda nuo pietrytiniame pakraštyje esančių vartų ir baigiasi ties rūmais. Šalia rūmų yra erdvi terasa, nuo kurios atsiveria reginiai į parko gilumą ir į pačią upę. Šiuo metu parke vyrauja vietiniai medžiai ir krūmai: uosiai, klevai, mažalapės liepos ir kt.[10].\r\nPerkūno ąžuolas\r\nPasakojama, kad pagonybės laikais šalia medžio šventąją ugnį kūreno vaidilutė Galinda. Vieną dieną jos mylimasis išjojo ginti tėvynės nuo kryžiuočių ir negrįžo. Galinda vis raudodavo, todėl vaidila, matydama sielvarto apimtą vaidilutę, mokė ją nelieti ašarų ir sakė, kad tik šventoji ugnis gali užgesinti žemiškąją meilę. Kartą Galindai raudant po plačiašakiu ąžuolu, į jį trenkė perkūnas. Ąžuolas sudrebėjo, į jo kamieną prikrito žemių, iš kurių netrukus išaugo ypatingai graži gėlė. Nuo to laiko žmonės ąžuolą vadina Perkūno ąžuolu. ', '55.91801505116713, 21.84496353808437', 31),
(99, 'Biržuvėnų dvaras', 'Biržuvėnų dvaro sodyba (valstybės saugomas kultūros paminklas: unikalus kodas 730) – dvaro sodyba Lietuvoje, rytinėje Telšių rajono savivaldybės teritorijos dalyje, Biržuvėnuose (Luokės seniūnija), abipus Virvyčios upės. Dvaro sodyboje vyksta renginiai, paminėjimai, poezijos skaitymai, parodos, santuokos ceremonijos.[1]\r\nGorskių Biržuvėnų dvaro rūmai XX a. pradžioje\r\nIstorija\r\n\r\nNuo XIV a. minimas Biržuvėnų karališkasis dvaras, kuris vėliau tapo privačia valda. Jį valdė Žemaičių karuža Jonas Sebastijonas Kenstartas, Pajūrio seniūnas Aleksandras Vaina (po 1637 m.). 1670 m. iš Vladislovo Vainos dvarą įsigijo Tverų seniūnas Mikalojus Gorskis. Ši dvarininkų giminė XVIII–XX a. pradžioje pastatė dvaro sodybą su rūmais, oficinomis, pagalbiniais gyvenamaisiais (kumetynai) ir ūkiniais gamybiniais (arklidė, vežiminė, kalvė, vandens malūnas ir kt.) pastatais, užtvenkė Virvyčios upę, 1909 m. įkūrė kartono fabriką (veikė iki 1938 m.), pastatė lentpjūvę.\r\n\r\nPagal 1907 m. parengtą A. Zaleckio projektą buvo atnaujintas XVIII a. pabaigoje įkurtas peizažinis parkas.\r\n\r\n1940 m. Tarybų Rusijai okupavus Lietuvą, dvaras nacionalizuotas, o po Antrojo pasaulinio karo jame įkurtas tarybinis ūkis. Sovietmečiu dvare veikė ūkio administracija, gamybiniai ir ūkiniai padaliniai, pradinė mokykla, kultūros namai ir biblioteka.\r\n\r\n1990 m. dvaro rūmų patalpose duris atvėrė etnografinis muziejus, kuriam pradžią davė bibliotekininkės Aldonos Simonavičiūtės sukaupti rinkiniai. 2004 m. viduryje muziejuje buvo apie 1500 eksponatų: etninės buities reikmenys, šventųjų paveikslai, maldaknygės, tautodailininkų darbai, senoji tekstilė, senoji ir šiuolaikinė keramika, fotografijos ir pan.[2]\r\n\r\n2004 m. pabaigoje dvaro rūmai sudegė. Gaisras sunaikino valgomajame buvusias XVIII a. glazūruotas krosnis ir židinį su Gorskių „Nalenč“ ir Vainų „Tromby“ herbais. Po gaisro rūmų tarplubyje aptiktas paslėptas XVI–XIX a. dvaro archyvas, albumai.\r\nDvaro plytinės plyta su Gorskių giminės herbu „Nalenč“\r\nBiržuvėnų dvaro lobis: Porceliano indai, eksponuojami Žemaičių vyskupystės muziejuje\r\nBiržuvėnų dvaro lobis: Pistoletai, eksponuojami Žemaičių vyskupystės muziejuje\r\n\r\n2005 m. vasarą iš Paryžiaus į Biržuvėnus atvyko vienintelė gyva paskutiniųjų dvaro savininkų Onos ir Tomo Gorskių jauniausioji dukra Janina Gorskytė (g. apie 1920 m.). Ji papasakojo apie dvare paslėptą lobį, kurio paieškas pradėjo pagal atsivežtą brolio nubraižytą schemą. Po 6 valandų paieškos lobis buvo rastas. Jį sudarė apie 300 puošnių porceliano indų ir 4 buteliai vyno. Grafaitė lobį padovanojo Žemaičių vyskupystės muziejui.\r\n\r\n1995 m. dvaro sodyba įrašyta į naujai išaiškinamų istorijos ir kultūros paminklų sąrašą, 2000 m. – įregistruota kultūros vertybių registre, 2005 m. – pripažinta valstybės saugoma kultūros vertybe, 2008 m. – paskelbta kultūros paminklu.[3]\r\n\r\nŠiuo metu dvaro sodyba restauruojama: atstatyti sudegę rūmai, altana, atstatoma oficina, arklidė ir vežiminė. Tarp restauravimui paruoštų medžiaga saugomos Gorskių plytinėje XIX a. degtos plytos. Kai kurių plytų vienoje pusėje yra įspaustos raidės „N. G. [Nalęcz Gorski]“, giminės herbas „Nalenč“, o po juo – gamybos data. Manoma, kad jos pagamintos Biržuvėnuose.\r\nArchitektūra\r\n\r\nDvaro sodybą sudaro dvaro rūmai, vadinami Ponų namu,[4] oficina,[5] arklidė,[6] vežiminė,[7] ledainė,[8] inžinieriaus namas,[9] kartono fabrikas,[10] pirtis,[11] obuolinė,[12] kiaulidė,[13] svirnas,[14] tvartas,[15] 2 daržinės,[16] 4 kumetynai,[17] kalvė,[18] koplytstulpis,[19] parkas[20] su tvenkiniais, malūno tvenkinys, Gorskių šeimos senosios kapinės.[21] Dvaro teritorijoje yra įrengtos I pasaulinio karo vokiečių kapinės, o prie Virvyčios stovi Skenduolių kryžius.\r\n\r\nSodyba suskaidyta į reprezentacinę, ūkinę, gamybinę ir gyvenamąją (kumetynų) zonas. Joje dominuoja mediniai, vienaukščiai, stačiakampio plano, Žemaičių krašto tradicinei XVIII–XIX a. architektūrai būdingi pastatai. Prie malūno tvenkinio stūkso mūriniai gamybiniai pastatai – buvęs vandens malūnas-kartono fabrikas su lentpjūve, šalia kurių stovi medinis inžinieriaus namas.\r\n\r\nReprezentacinėje dalyje stovi vėlyvojo baroko bruožų turintys rūmai, prie kurių užpakalinio fasado XIX a. pristatytas fligelis. Tai vienas iš dviejų Lietuvoje išlikusių tokio tipo pastatų.\r\n\r\nRūmus supa dvaro parkas, kurio masyvas išsidėstęs Virvyčios upės kilpoje. Centrinei jo daliai būdingi reguliaraus, o likusiam masyvui – peizažinio planavimo bruožai. Parteryje priešais rūmus stovi antikinio stiliaus skulptūra, o vakariniame pakraštyje – medinė altana. Parke vyrauja vietinės medžių rūšys: paprastasis klevas, paprastasis uosis, mažalapė liepa, paprastasis ąžuolas, karpotasis beržas, paprastoji ieva. Iš introdukuotų želdinių auga europiniai maumedžiai, trakinis klevas, vakarinės tujos. Išsiskiria upės pakrantėje auganti ąžuolų grupė bei centrinėje parko dalyje esanti mažalapių liepų alėja, vedanti iki tvenkinio rūmų kryptimi. ', '55.894120963668676, 22.460377460281233', 31),
(100, 'Hugo Šojaus dvaras', 'Hugo Šojaus dvaras – 1721 m. įkurta sodyba, kaip valstybinis domenų dvaras dabartinėje Šilutėje. Jis yra nesudėtingų formų vėlyvo klasicizmo bei istorizmo laikų pastatas su neryškiais stiliaus bruožais bei santūriu, būdingu Klaipėdos kraštui dekoru. Rūmai yra 2 aukštų, su gyvenama pastoge. Antrą aukštą puošia langų viršų ir palangių plokštumo lipdiniai, pastogę juosia kuklus karnizas. Rūmų planas – simetriškas, stačiakampis, su į gatvės pusę kiek iškišta vidurine dalimi, kurioje buvo vestibiulis su laiptais. Vienoje vestibiulio pusėje patalpos išdėstytos abipus koridoriaus, kitoje – dviem eilėmis, pereinamos. Fasadą skaido mentės, tarp kurių išdėstyti aukšti stačiakampiai langai, pabrėžti palangių traukomis.\r\n\r\nŠiuo metu dvare įsikūręs Šilutės muziejus.\r\nIstorija\r\nDvaro vidinis kiemas\r\n\r\n1819 m. sodybą įsigijo Francas Vilhelmas Radkė. Dvarą vadino kilminguoju (šis titulas liko iki XX a. 2-ojo dešimtmečio). Tais pačiais metais buvo pradėta statyba. Dvaras Radkiams priklausė iki tol, kol jį nupirko Hugo Šojus.\r\nPaminklas Hugo Šojui Šilutėje, prie Šojaus dvaro\r\nBuvusios karvidės\r\n\r\n1892 m. gruodžio 15 d. H. Šojus nupirko Šilutės dvarą su žemėmis. Šojaus dvaras buvo labai gerai tvarkomas ir prižiūrimas. [1] Tik įsigijęs dvarą, naujasis šeimininkas pasiliko 750 ha dvarui priklausiusios žemės. Likusią išskirstė sklypais, kuriuos pardavė ir išnuomojo. Taip gavo pinigų skoloms padengti bei ūkiniams pastatams atnaujinti. Praėjus keleriems metams, kilo gairas, kuris vėl sunaikino beveik visus dvaro ūkinius pastatus, senųjų vietoje buvo pastatyti nauji, o dvaro kiemas, apsisaugant nuo upės potvynių, paaukštintas apie metrą ir išgrįstas akmeniniu grindiniu. Dvarininkas ėmėsi atnaujinti pačius rūmus, prie dvaro įrengė parką, buvo iškasti trys nauji tvenkiniai, o palei miškuotą Šyšos upę ir prie jos prisišliejusiame miškelyje, vadinamajame Varnamiškyje, sukurta promenada. Taip dvaras įgijo naują, patrauklią bei reprezentatyvią išvaizdą. Tad nenuostabu, kad dvare lankydavo garbūs ir žinomi žmonės: buvo atvykęs Vokietijos kronprincas, svečiuodavosi Lietuvos prezidentai, kiti kultūros ir politikos elito atstovai.\r\n\r\nSėkminga dvaro raida prisidėjo prie paties Šilutės miestelio sėkmingos kultūrinės, politinės bei visuomeninės raidos. H. Šojus dvaro žemių dovanojo miesteliui – apskrities ligoninė, turgaus aikštė, gimnazija, pradinė mokykla, paštas, gaisrinė, uostas, bažnyčia ir kt. – yra pastatyta ant buvusių dvaro žemių. Švęsdamas 80 metų jubiliejų, dvarininkas savo paties įkurtą parką padovanojo miestui. Po dvarininko H. Šojaus mirties dvarą paveldėjo jo anūkas. Tačiau, artėjant karo frontui, dvarą paliko ir su šeima pasitraukė į Vokietiją. Per karą dvaras smarkiai nukentėjo.\r\nBuvę tarnų namai\r\n\r\nPo II pasaulinio karo, pagalbinį ūkį perėmė sovietinių ūkių ministerija ir jį pavedė Kretingos žemės ūkio mokyklai, kuri čia atidarė daržininkystės skyrių. Vėliau dvare veikė daržininkystės skyriaus ūkvedžių kursai, dvimetė žemės ūkio mokykla. Šilutės dvare buvo įsikūręs ir žemės ūkio technikumas. Dvaro pastatai buvo pritaikyti mokyklos poreikiams: rūmuose ir priestate įrengtos klasės ir kabinetai, berniukų ir mergaičių bendrabučiai. Arklidės buvo paverstos sporto ir aktų sale, karvidėje įrengti kabinetai, garažas ir nedidelė salė, o tarnų name – biblioteka ir pan.\r\nDvaro parkas\r\nĮėjimas iš kiemo pusės\r\n\r\nDvaro kompleksui priklausantis parkas įrengtas H. Šojaus valdymo laikais. Tai – angliško tipo parkas su 3 tvenkiniais ir šiltnamiais. Jame buvo pasodinta 150 veislių medžių ir krūmų, nutiesti takai, įrengtos beržų alėjos, prie pasivaikščiojimo takų pastatyti suoliukai. Parke įrengta sporto aikštė, šaudykla, pastatyti Šaulių draugijos namai, veikė restoranas. Kadangi parkas buvo suformuotas abiejose upės pusėse, teko pastatyti du tiltus – vienas iš jų buvo vadinamas Augusto, kitas – Elžbietos.\r\n\r\nParkas stipriai nukentėjo per Antrąjį pasaulinį karą. Po karo ilgą laiką jis buvo menkai prižiūrimas, gerokai apnyko, žuvo nemažai egzotinių medžių. Tuo laiku jis buvo padalintas į dvi dalis – upės vingyje esanti parko dalis atskirta ir pavadinta J. Janonio parku. Dabar čia daugiausia auga vietiniai medžiai: eglės, pušys, liepos bei klevai. Iš senųjų retų medžių yra išlikęs sužalotas Burgundijos ąžuolas ir pora raudonųjų ąžuolų.\r\nDvaras dabar\r\nDvaro vartai\r\nDvaro kapinės prie gimnazijos\r\n\r\nDabar tik nedidelė dvaro rūmų dalis restauruota, pagrindinių rūmų perdengtas stogas ir nudažyta rūmų išorė iš gatvės pusės. Visi kiti pastatai visai nerestauruoti (2010 m. balandžio 28 d. duomenys). 1997 m. gruodžio 31 d. dvaras ir sodyba yra įtraukta Lietuvos nekilnojamųjų kultūros vertybių registrą. 2001 m. šilutiškiai prie dvaro pastatė H. Šojui paminklą. Pastaraisiais metais rūmai buvo restauruojami. Atliekant darbus įrengta pamatų horizontali hidroizoliacija, permūrijus juos dalimis ir įklojus hidroizoliaciją visu pastato perimetru. Atlikti mažojo korpuso restauravimo ir pritaikymo darbai: restauruota ir sutvirtinta stogo medinė konstrukcija, stogas ', '55.340605348270024, 21.459459454516676', 31),
(104, 'Dieveniškių istorinis regioninis parkas', 'Dieveniškių istorinis regioninis parkas – regioninis parkas pietryčių Lietuvoje. Plotas 8598 ha,[1][2] direkcija Poškonyse. Parkas įsteigtas kultūros ir gamtos požiūriu vertingiems Dieveniškių apylinkių kraštovaizdžio ir etnokultūriniams kompleksams išsaugoti ir tvarkyti.\r\nGamtos vertybės\r\nParko direkcija Poškonyse\r\n\r\nSavitas priešpaskutinio apledėjimo suformuotas kraštovaizdis su stambiomis plokščiaviršūnėmis kalvomis ir erdviomis lomomis, natūralus Gaujos upės slėnis. Miškuose vyrauja eglynai, o Nemkamedžio miške stūkso galingas Grybiškių ąžuolas. Žižmų kaimo miške stūkso akmuo „Užkeikta svodba“.\r\nKultūros paveldas\r\nNorviliškių bažnyčia\r\n\r\nParke yra Bėčionių piliakalnis, Dieveniškių, Skaivonių, Senųjų Miežionių, Didžiulių, Stakų, Poškonių pilkapiai, mitologiniai Moko, Žižmų, Jankelių akmenys.\r\n\r\nGaujos upės pakrantėse 13 Poškonių etnokultūrinio draustinio gatvinių kaimų išlaikė senąją architektūrą, žemėnaudos struktūrą, nemaža senosios buities elementų. Įdomūs ir gatviniai Gudelių, Pagaujėnų, Girdžiūnų kaimai. Architektūros paminklais paskelbti Žižmai, Rimašiai, Poškonys. Įspūdinga Norviliškių pilis, bažnyčia Dieveniškėse (statyta 1783 m.).\r\nLaisvalaikis ir pramogos\r\nPrie pagrindinių lankytinų objektų pastatytos rodyklės, su žemėlapiais ir aprašymais, tad automobiliu, dviračiu ar pėsčiomis galima keliauti ir savarankiškai. Teikiamos gido paslaugos. Žvejoti su leidimais galima Poškonių tvenkinyje (šalia galima apsistoti) ir Gaujos upėje. Parke švenčiama Rasos šventė, vyksta poezijos pavasarėlis. ', '54.230645958774566, 25.621642425841554', 23),
(105, 'Dubysos regioninis parkas', 'Dubysos regioninis parkas – regioninis parkas vidurio vakarų Lietuvoje. Didžioji dalis yra Raseinių rajone, keli procentai – Kelmės rajone. Parko plotas – 10571 ha, direkcija Raseiniuose. Įsteigtas siekiant išsaugoti Dubysos upės erozinio slėnio kraštovaizdį, jo gamtinę ekosistemą bei kultūros paveldo vertybes.\r\nGamtos vertybės\r\nLyduvėnų tiltas\r\nMaironio tėviškė\r\n\r\nLabai įspūdingas plačiadugnis ir stačiašlaitis Dubysos senslėnis, išraižytas intakų, slėnių ir raguvų. Dubysa – viena gražiausių ir populiariausių Lietuvos upių. Upės kilpos ir senvagės, miškais apaugę šlaitai, salpinės pievos, vandeningi ir sraunūs intakai, tekantys giliais slėniais, sudaro savitą ekosistemą, turtingą augalų ir gyvūnų rūšių. Čia atplaukia neršti lašišos ir šlakiai. Pliauginių draustinyje auga Gražusis ąžuolas, kuris yra valstybės saugomas kraštovaizdžio objektas.\r\n\r\nParkas garsėja elniais.\r\nKultūros paveldas\r\n\r\nParke yra 5 piliakalniai, įspūdingas dubenuotasis akmuo (Žalpių kaime), aukščiausias Lietuvoje – Lyduvėnų geležinkelio tiltas. Betygalos miestelio puošmena – paminklas Vytautui Didžiajam. Ugionyse – vaizdinga liaudies klasicizmo stiliaus bažnyčia, stebuklingas šaltinis su koplyčia. Maironio sodyba ir jos gamtinė aplinka saugoma Pasandravio memorialiniame draustinyje.\r\nLaisvalaikis ir pramogos\r\nPažvejoti galima Dubysos upėje, Ariogalos ir Luknės tvenkiniuose. Maudytis ir poilsiauti tinka Padubysio, Lakštingalų slėnio, Lyduvėnų, Kalniškių rekreacinės zonos, Luknės, Ariogalos tvenkiniai. Ariogaloje galima išsinuomoti baidares. Dviratininkams parengtas ir aprašytas 32 km maršrutas Raseiniai-Lyduvėnai-Raseiniai. Geriausios regyklos – Lyduvėnų, Betygalos, Aukštuonos, Padubysio piliakalniai. Yra 5 stovyklavietės. Slidinėjimo trasa su keltuvu yra kairiajame Dubysos upės šlaite, kelyje Raseiniai – Baisogala (500 m nuo kelio pagal upės tėkmę). Parke vyksta poezijos pavasarėlis. ', '55.462738967492314, 23.135727872667985', 23),
(106, 'Radžiūnų piliakalnis', 'Radžiūnų piliakalnis su gyvenviete – piliakalnis ir gyvenvietė (unikalus objekto MC kodas 22602) Alytaus miesto teritorijoje. Pasiekiamas iš link Simno vedančios Santaikos gatvės ties garažais dešinėje pasukus bevarde gatvele į kairę pietų kryptimi, pavažiavus 900 m iki pažintinio dendrologinio tako, šiuo taku mišku paėjus 500 m – yra tako pabaigoje.\r\nPiliakalnis\r\n\r\nPiliakalnis įrengtas Nemuno kairiajame krante, prie Kirmijos upelio žiočių esančioje kalvoje. Aikštelė trikampė, smaigaliu į pietus, 40x40 m dydžio, aukštesne šiaurine dalimi, su kultūriniu sluoksniu. Šiauriniame jos krašte supiltas 40 m ilgio, 4 m aukščio, 17 m pločio pylimas, kurio 7 m išorinis šlaitas leidžiasi į 12 m pločio, 2,2 m gylio griovį. Pylimas juosia ir aikštelės pietvakarinį šoną, kur jis yra iki 1,5 m aukščio. Šlaitai statūs, 30–35 m aukščio. Piliakalnis apaugęs lapuočių mišku. Jis pradėtas tvarkyti: iškirsta dalis smulkių želdinių, įrengti laiptai.\r\nGyvenvietė\r\n\r\nŠiaurės vakarų papėdėje 1 ha plote yra II a. – V a. papėdės gyvenvietė, tyrinėta 2002 m. Iki 53 cm storio jos kultūriniame sluoksnyje rasta grublėtos keramikos, gyvulių kaulų, geležinis įtveriamasis tribriaunis strėlės antgalis.\r\nTyrimai\r\n\r\n1954 m. piliakalnį žvalgė Istorijos institutas. [1] Piliakalnis datuojamas I tūkstantmečio viduriu – II tūkstantmečio pradžia. Lietuvos Respublikos Vyriausybės nutarimas dėl paskelbimo kultūros paminklu – 1998-05-19; Nr.612. Paminklo teritorijos plotas 161 000 m².\r\n\r\n', '54.374075020474514, 24.004999492601048', 21);

-- --------------------------------------------------------

--
-- Table structure for table `mails`
--

CREATE TABLE `mails` (
  `id` int(15) NOT NULL,
  `userID` int(15) NOT NULL,
  `message` text NOT NULL,
  `subject` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `password_recovery`
--

CREATE TABLE `password_recovery` (
  `id` int(15) NOT NULL,
  `userID` int(15) NOT NULL,
  `token` longtext NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `password_recovery`
--

INSERT INTO `password_recovery` (`id`, `userID`, `token`, `date`) VALUES
(58, 163, '3c615f27a7c9761f2980d0cbbb12b3783e86ea95cda50e3841bf1e996b3f985dd3e006139bf68b7ef2bb75e309f3094b3d31f8865592ca283d10da39314e9c2627ea3b71a598fc92c11b2aa96c1dd0615066572d167770bf902ccdde19407014f17f78e9de890173c5bdc4a1d44ac70235b8d6a1a3bf1effd83b79ff38b20e69b7889cbe49d90bdbb82a7ef7feab0c1ccc533efb42dbc40c7d650b2cb3c63d63fdf6bf5908f184b181cd25c11cb53230914c7e190a914de1416a3f229715b0add6b033b56120be25', '2022-12-08 10:30:30');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(15) NOT NULL,
  `creator` int(15) NOT NULL,
  `question` varchar(500) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `A` varchar(200) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `B` varchar(200) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `C` varchar(200) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `answer` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `creator`, `question`, `A`, `B`, `C`, `answer`) VALUES
(19, 1, 'Kuri moteris vadovavo pėstininkų pulkui per 1830-1831 metų sukilimą ir buvo vadinama lietuvių Žana d‘Ark?', 'Marytė Melnikaitė  \r\n                      ', 'Emilija Pliaterytė ', 'Barbora Radvilaitė', 2),
(20, 1, 'Lietuvos himno – Tautiškos giesmės – tekstą sukūrė Vincas Kudirka. Kas yra Tautiškos giesmės muzikos autorius?', 'Mikalojus Konstantinas Čiurlionis', 'Vincas Kudirka', 'Juozas Naujalis', 2),
(21, 1, 'Kurioje Rytų Prūsijos gyvenvietėje gyveno ir dirbo lietuvių grožinės literatūros pradininkas, „Metų“ autorius Kristijonas Donelaitis?', 'Aukštkalniuose', 'Tolminkiemyje', 'Gumbinėje', 2),
(22, 1, 'Kas buvo pirmasis iš Lietuvos kilęs ir Lietuvoje užaugęs Nobelio premijos laureatas?', 'Valdas Adamkus', 'Jonas Mekas', 'Česlovas Milošas', 3),
(23, 1, 'Kur 1547 metais Martynas Mažvydas išleido pirmąją lietuvišką knygą „Katekizmą“?', 'Karaliaučiuje', 'Torūnėje', 'Vilniuje', 1),
(24, 1, 'Kuriais metais Lietuvos vyrų krepšinio rinktinė pirmą kartą tapo Europos čempione?', '1929', '1937', '1941', 2),
(25, 1, 'Kaip vadinosi XVI amžiuje išleistas teisės dokumentų rinkinys, nustatęs Lietuvos Didžiosios Kunigaikštystės teisinės sistemos pagrindą?', 'Lietuvos Bulė', 'Lietuvos Statutas', 'Lietuvos Konstitucija', 2),
(26, 1, 'Kiek žmonių Lietuvoje gyveno 1989 metų gyventojų surašymo duomenimis?', '2,7 mln.', '3,1 mln.', '3,7 mln.', 3),
(27, 1, 'Su kuo žemaičių pulkai kovojo 1236 metais Saulės mūšyje?', 'Kryžiuočių ordinu', 'Kalavijuočių ordinu', 'Švedijos Karalyste', 2),
(28, 1, 'Kuriam Lietuvos didžiajam kunigaikščiui priklauso šie žodžiai: „Pirmiau geležis vašku taps ir vanduo į plieną pavirs, negu iš mūsų išėjusį žodį atšauksime“?', 'Gediminui', 'Vytautui', 'Mindaugui', 1),
(29, 1, 'Kurio muziejaus, įsikūrusio Kaune, įstatai buvo paskelbti 1921 m. gruodžio 14 d.?', 'Nacionalinio M. K. Čiurlionio dailės muziejaus', 'Lietuvos aviacijos muziejaus', 'Kauno IX forto muziejaus', 1),
(30, 1, ' 1921 m. rugsėjo 7 d. buvo įkurtas pirmasis lietuviškas jachtklubas „Lietuva“. Kurioje miesto vietoje iš pradžių jis veikė?', 'Prie Kauno marių', 'Nemuno saloje', 'Prie tilto per Nevėžį', 2),
(31, 1, '1921 m. rudenį Kaune pirmą kartą surengta žymi tarpukario paroda, kurios tikslas – „apžvelgti šalies krašto ūkį“. Koks buvo jos pavadinimas?', 'Ką pasėsi', 'Žemės ūkio ir pramonės paroda', 'Rinkis prekę lietuvišką', 2),
(32, 1, 'Kuris Kauno burmistras galėjo pasigirti ilgiausiai ėjęs šias pareigas?', 'Jonas Vileišis', 'Antanas Smetona', 'Antanas Vokietaitis', 1),
(33, 1, 'Kaip vadinami diplomatiniai sutarties projektai, kuriais 1921 m. Tautų sąjunga siekė sureguliuoti Lietuvos ir Lenkijos valstybių santykius?', 'Hymanso projektai', 'Manhatano projektai', 'Vostoko projektai', 1),
(34, 1, '1921 m. rugsėjo 22 d. Lietuva buvo priimta į sąjungą, kurios vienas pagrindinių tikslų buvo išlaikyti taiką pasaulyje. Kokia tai sąjunga?', 'Sovietų Sąjunga', 'Europos Sąjunga', 'Tautų Sąjunga', 3),
(35, 1, 'Pirmosios Lietuvos respublikos laikotarpiu buvo pasikėsinta į kelis lietuvių politikus. Į kurį jų buvo pasikėsinta 1921 m. lapkričio mėn.?', 'Augustiną Voldemarą', 'Ernestą Galvanauską', 'Antaną Smetoną', 2),
(36, 1, '  Kovų už nepriklausomybę laikotarpiu Lietuvos kariuomenės daliniuose tarnavo lietuvių, gudų, žydų ir kitų tautybių žmonės. Tačiau vienas iš jų, Lietuvoje vadintas Petro Činšos vardu, itin nustebino jį į nelaisvę paėmusius lenkus. Kaip galima sužinoti iš 1921 m. lietuviškos spaudos, lenkai jį panaudojo savo propagandai. Kokios tautybės jis buvo?', '  Kinas', '  Karelas', '  Kazachas', 1),
(37, 1, '1921 m. vasarą spauda rašė, kad Kaune susikūrė nauja religija, kurios apaštalas yra Domas Šidlauskas. Meno kūrėjų draugijos būstinėje šeštadieniais vykdavo paskaitos, kuriose buvo aptariamos naujosios religijos idėjos. Kaip buvo vadinami šios religijos pasekėjai?', 'Raganiai', 'Teosofai', 'Perkūnininkai', 3),
(40, 148, 'Romėnų istorikas Tacitas I a. veikale „Germanija“ rašė: „Dešinysis Svebų jūros krantas skalauja aisčių gentis [...] Jie garbina dievų motiną. Retai vartoja kalavijus, dažniau vėzdus. Javus ir kitokius augalus augina uoliau negu tingūs germanai. Jie ieško naudos ir jūroje, seklumose ir pačioje jos pakrantėje jie vieninteliai renka gintarą, kurį vadina glesum“. Koks yra kitas Tacito aprašytų aisčių genčių pavadinimas, pradėtas vartoti XIX a.?', 'Baltai', 'Germanai', 'Jotvingiai', 1),
(42, 148, 'Nurodykite tautą, kuriai, anot pasakojimų, Lietuvos didysis kunigaikštis patikėjęs saugoti Trakų miestą ir pilį.', 'Rusai', 'Totoriai', 'Karaimai', 3),
(43, 148, 'Koks Lietuvos pagonio valdovo dukters, tapusios pirmąja lietuvaite kitos valstybės karaliene, vardas?', 'Ona', 'Vida', 'Birutė', 1),
(46, 148, 'Koks nuo XV a. pabaigos buvo Lietuvos Didžiosios Kunigaikštystės (toliau – LDK)  vyriausiojo kariuomenės vado titulas?', 'Etmonas', 'Imperatorius', 'Viršila', 1),
(48, 148, 'Kurios šalies kilmingieji 1421 m. pasiūlė Lietuvos didžiajam kunigaikščiui Vytautui savo valstybės karūną?', 'Čekijos', 'Lenkijos', 'Anglijos', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(15) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 NOT NULL,
  `password` varchar(150) CHARACTER SET utf8 NOT NULL,
  `mail` varchar(35) CHARACTER SET utf8 NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `ban` tinyint(1) NOT NULL,
  `description` varchar(300) NOT NULL,
  `image` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `mail`, `admin`, `ban`, `description`, `image`) VALUES
(1, 'user100', '$2y$10$Hg7YWR4Ub1XOpUua53ccdebDJbIy06S11BBftRUMCu2lrlLVThhPS', 'user100@gmail.com', 0, 1, 'Aprašymas', 'user_img/Lake_mapourika_NZ.jpeg'),
(2, 'user200', '$2y$10$GKqQ2kmNbm8hoY/t4a0qvu0P9uV36tOvj2nwfGBvznBRP4RbUCyhW', 'user200@gmail.com', 0, 0, '', 'user_img/Screenshot_20220825-144413.png'),
(3, 'user300', '$2y$10$bWFjC1befEAVAQyxy1XFgeX3C73817Canmg8mKuSU9ttHnsUTX3j.', 'user300@gmail.com', 0, 0, '', 'user_img/basic.png'),
(4, 'user500', '$2y$10$gZgzWcovLi9x412sJefvieZGL.Vw4yiYUtRjZWy.lZ0QuXXdl4e4i', 'user500@gmail.com', 0, 0, '', 'user_img/basic.png'),
(45, 'user5000', '$2y$10$2d79c4zIYE6y8y0qVtXLTOB0DID65XRemAbgESPHPqqxR/sZoDpXy', 'user5000@gmail.com', 0, 0, '', 'user_img/basic.png'),
(128, 'user101', '$2y$10$O9m/SHgjA3dTyyTGNsrTuuwF3orDPW8uihRxdrzNJBpb04dWFTy7q', 'user101@gmail.com', 0, 0, '', 'user_img/basic.png'),
(129, 'user102', '$2y$10$y2fvIXfBwrIhsd.o48U.1uH2Kw13WLnFEP8kiN00Fl5W.9G1ZxNPK', 'user102@gmail.com', 0, 0, '', 'user_img/basic.png'),
(130, 'user103', '$2y$10$4sC4IkR5Kx4hLXd1FTQdO.mu0DFmzwRm/e.7r/UGITdMOjqpFPClO', 'user103@gmail.com', 0, 0, '', 'user_img/basic.png'),
(131, 'user104', '$2y$10$oQ/9v.xX40vCT0rl3DtOpumqqF90i5DxO8rbieq1m1ufNgcA4FElO', 'user104@gmail.com', 0, 0, '', 'user_img/basic.png'),
(132, 'user105', '$2y$10$RU4c8ahDmkXDd8L9gf8W9.LGEUu5wlFautxiF/VbgVmCrGS4kr6g2', 'user105@gmail.com', 0, 0, '', 'user_img/basic.png'),
(133, 'user106', '$2y$10$3HuPaBwFk0jKU60OCh.5xO0GtbKgnVp9FnpSNpfTQ3h.6CspFBgvu', 'user106@gmail.com', 0, 0, '', 'user_img/basic.png'),
(134, 'user107', '$2y$10$DGoWGEq4we7ZkXWwEsDoa.Z7stBQxs7bhqZOznwZrLyCLiQzn83b.', 'user107@gmail.com', 0, 0, '', 'user_img/basic.png'),
(135, 'user108', '$2y$10$2wkCZibFTZsOgacSMatlzewxIui57y0owVRVx./1CE7f3WJdIwqDC', 'user108@gmail.com', 0, 0, '', 'user_img/basic.png'),
(136, 'user109', '$2y$10$oGBaspNZdMtY0dTTIS4cN.TYJh02ybbj3SjIen9UoRGNrCWAhUiBq', 'user109@gmail.com', 0, 0, '', 'user_img/basic.png'),
(137, 'user110', '$2y$10$7rh4bUJKhZ55dboN2IRsEuOhODvxJv.GyY6XsBfqiLT5mN.SWFmAi', 'user110@gmail.com', 0, 0, '', 'user_img/basic.png'),
(138, 'user111', '$2y$10$uX/.FBRrvv4EXrF/es.2PeipmdZtGUUep3AIWPGgd3YysHTK3CCDS', 'user111@gmail.com', 0, 0, '', 'user_img/basic.png'),
(139, 'user112', '$2y$10$HXSkiVJzF/fNySsSOiPDme4raqSk02bwPnWxYH6st2pleU9sRxGDK', 'user112@gmail.com', 0, 0, '', 'user_img/basic.png'),
(140, 'user113', '$2y$10$K8RbbBiXBSBp0KF59Wcgbet7YdfKEtSfO15.7dUAaNUzXw2aO4sT.', 'user113@gmail.com', 0, 0, '', 'user_img/basic.png'),
(141, 'user114', '$2y$10$PrE7wjOtoYbIuB0sFR7VhOZdW.n8kIBnAsJlAgW/nGg07Bf6aFjSW', 'user114@gmail.com', 0, 0, '', 'user_img/basic.png'),
(142, 'user115', '$2y$10$jQTUsy4KTZdGzGhIzYaOxObX.8.ChtpozbNX8YjWSomEHBhZuc2cS', 'user115@gmail.com', 0, 0, '', 'user_img/basic.png'),
(143, 'user116', '$2y$10$m2Ijk5RlXSCzU0JxgoSfcOvJTRax/JJp0KVQCP7QKtsvWAp4iCG.K', 'user116@gmail.com', 0, 0, '', 'user_img/basic.png'),
(144, 'user117', '$2y$10$ViVCQCg1ujlxsuGGQxVYGORVF8.nQd7I61/rHnNyqGPgUquTunjTm', 'user117@gmail.com', 0, 0, '', 'user_img/basic.png'),
(145, 'user118', '$2y$10$ToEQT.pKnHoK8.V59IRwt.yPwLuXlJ0Yqymv8bqahRqkPj63CzYR6', 'user118@gmail.com', 0, 0, '', 'user_img/basic.png'),
(146, 'user119', '$2y$10$W8JriuG8rHDGT9e7c9rUN.5SsarUe2nvQdt6SCE4FEdDtQAyzLbVi', 'user119@gmail.com', 0, 0, '', 'user_img/basic.png'),
(147, 'user120', '$2y$10$ampJ9sUCa62AMLqSKYrdq.KCaDL5UIfGdtJawIUcETExnIL1oiruW', 'user120@gmail.com', 0, 0, '', 'user_img/basic.png'),
(148, 'admin11', '$2y$10$EZLu.ddMgccvY.rIq1g1PO.GYnC6cc9VLz/G5aHFQS4NOGALZ3nae', 'admin11@gmail.com', 1, 0, '  dfgdfg', 'user_img/Lake_mapourika_NZ.jpeg'),
(162, 'user555', '$2y$10$TgFBvUK8TJmpifHf1A5k6e4/OEyWrYfADRAKKNj3dygnbEQN6DWf.', 'xafalog594@eilnews.com', 0, 0, '  aprasyma', 'user_img/LNM-web-ikonos-3.jpg'),
(163, 'user444', '$2y$10$8por32b0HP0PfE1.91ZdLuC9F0sJTish56HyY80WPkhoU/MooapeC', 'miworef504@eilnews.com', 0, 1, '  Aprasymas naujas aprasymas', 'user_img/Gedimino_pilis_by_Augustas_Didzgalvis.jpg'),
(166, 'user666', '$2y$10$qFzz8iBeDt.GKizPZsDgaOOrDHE.mJlGnRyYJoqSDv2.farK9hOk2', '555', 0, 0, '  aprasyma', 'user_img/LNM-web-ikonos-3.jpg'),
(167, 'user777', '$2y$10$eJesYm1aUrlFUAnVQGwayeU.p0mc2a/DHgHrWC1TAl3L8O.nzxNXe', '498com', 0, 0, '  aprasymas', 'user_img/LNM-web-ikonos-3.jpg'),
(168, 'user888', '$2y$10$jQnAkY7hhLkInzCNNQ8xT.lQ9hTwFZv3nSSyDjDIYyId135X21nue', 'sidoj75484@diratu.com', 0, 0, '', 'user_img/basic.png'),
(169, 'user999', '$2y$10$u9d8BuEP0TEaAoiPEr.eEunCfCc.FK2hX8T9Db3nAUFDvX5fkZhVW', 'jixopay231@dmonies.com', 0, 0, '', 'user_img/basic.png'),
(170, 'naujas', '$2y$10$zncuktFjZNN0.NgL/JsKHebFNfuOseuPFaPq6CT2SeYp6vH1ormOK', 'balosax881@hisotyr.com', 1, 0, '', 'user_img/basic.png');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(15) NOT NULL,
  `userID` int(15) NOT NULL,
  `locationID` int(15) NOT NULL,
  `vote` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `userID`, `locationID`, `vote`) VALUES
(4685, 1, 85, 1),
(4689, 1, 97, 1),
(4690, 1, 86, 1),
(4691, 1, 99, 1),
(4692, 1, 104, 0),
(4693, 1, 105, 0),
(4694, 1, 93, 1),
(4695, 1, 87, 0),
(4697, 1, 100, 1),
(4698, 1, 88, 1),
(4699, 1, 94, 1),
(4700, 1, 92, 1),
(4701, 1, 84, 1),
(4702, 1, 89, 1),
(4703, 1, 90, 0),
(4704, 1, 98, 1),
(4705, 1, 106, 1),
(4706, 1, 91, 1),
(4707, 148, 98, 1),
(4708, 148, 94, 1),
(4710, 148, 104, 1),
(4712, 148, 86, 1),
(4713, 148, 99, 0),
(4714, 148, 93, 1),
(4715, 129, 100, 1),
(4716, 129, 91, 1),
(4717, 129, 81, 1),
(4718, 148, 91, 1),
(4726, 2, 104, 1),
(4727, 148, 81, 1),
(4730, 148, 90, 1),
(4731, 148, 96, 1),
(4732, 148, 82, 1),
(4738, 163, 94, 0),
(4741, 167, 89, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answered_questions`
--
ALTER TABLE `answered_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `quizID` (`quizID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `locationID` (`locationID`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locationID` (`locationID`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `mails`
--
ALTER TABLE `mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `password_recovery`
--
ALTER TABLE `password_recovery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator` (`creator`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `locationID` (`locationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answered_questions`
--
ALTER TABLE `answered_questions`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4958;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `mails`
--
ALTER TABLE `mails`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `password_recovery`
--
ALTER TABLE `password_recovery`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4742;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answered_questions`
--
ALTER TABLE `answered_questions`
  ADD CONSTRAINT `answered_questions_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `answered_questions_ibfk_2` FOREIGN KEY (`quizID`) REFERENCES `quiz` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `locations` (`id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`locationID`) REFERENCES `locations` (`id`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`);

--
-- Constraints for table `mails`
--
ALTER TABLE `mails`
  ADD CONSTRAINT `mails_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `password_recovery`
--
ALTER TABLE `password_recovery`
  ADD CONSTRAINT `password_recovery_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `users` (`id`);

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `locations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
