-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2019 at 11:14 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news_app_new_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `password`, `email`, `image`) VALUES
(1, 'admin', 'admin', 'viaviwebtech@gmail.com', 'profile.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cid` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cid`, `category_name`, `category_image`) VALUES
(1, 'Animation', '63095_Animation.jpg'),
(2, 'Entertainment', '91287_Comedy1.jpg'),
(3, 'World', '11419_fashion-images.jpg'),
(4, 'Music', '10543_music.jpg'),
(5, 'Sports', '26013_Sports.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `comment_text` text NOT NULL,
  `dt_rate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_comment`
--

INSERT INTO `tbl_comment` (`id`, `news_id`, `user_name`, `comment_text`, `dt_rate`) VALUES
(2, 21, 'kuldip', 'test', '2019-01-30 05:14:23'),
(3, 3, 'admin', 'test', '2019-01-30 05:29:06'),
(5, 5, 'admin', 'test', '2019-01-30 05:28:27'),
(6, 3, 'kuldip', 'nice video', '2019-01-30 05:27:42'),
(7, 3, 'kuldip', 'nice video', '2019-01-30 05:32:30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home_banner`
--

CREATE TABLE `tbl_home_banner` (
  `id` int(11) NOT NULL,
  `banner_name` varchar(255) NOT NULL,
  `banner_image` varchar(255) NOT NULL,
  `banner_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_home_banner`
--

INSERT INTO `tbl_home_banner` (`id`, `banner_name`, `banner_image`, `banner_url`) VALUES
(1, 'Android Drawing', '97286_android_drawing.jpg', 'https://codecanyon.net/item/android-drawing/8193028'),
(2, 'Daily Motion', '9680_Daily_Motion.jpg', 'https://codecanyon.net/item/daily-motion/8239582'),
(3, 'Alphabet', '40905_alphabet.jpg', 'https://codecanyon.net/item/alphabet/8108766');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `news_type` varchar(255) NOT NULL,
  `news_title` varchar(255) NOT NULL,
  `video_url` text NOT NULL,
  `video_id` varchar(255) NOT NULL,
  `news_image` text NOT NULL,
  `news_description` text NOT NULL,
  `news_date` int(11) NOT NULL,
  `featured` int(1) NOT NULL DEFAULT '1',
  `news_views` int(11) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`id`, `cat_id`, `news_type`, `news_title`, `video_url`, `video_id`, `news_image`, `news_description`, `news_date`, `featured`, `news_views`, `status`) VALUES
(3, 1, 'image', 'NASA Astronauts Replace Failed Computer During Spacewalk on Tuesday', '', '', '66545_nasa.jpg', '<p>Two US astronauts successfully completed Tuesday what NASA described as a &quot;critical&quot; spacewalk to repair a failed piece of equipment that helps power the International Space Station.</p>\r\n\r\n<p>&quot;We have declared victory,&quot; NASA commentator Rob Navias said about two hours into the emergency spacewalk by space station commander Peggy Whitson, 57, and flight engineer Jack Fischer, 43.</p>\r\n\r\n<p>The reason for the outing was the sudden breakdown on Saturday of a computer relay box known as a multiplexer-demultiplexer (MDM) unit. The MDM - which is about the size of a small microwave oven and would weigh 50 pounds (23 kilograms) on Earth - helps operate solar arrays, electrical power generation, and robotic equipment at the ISS.</p>\r\n', 1495584000, 0, 274, 1),
(4, 5, 'image', 'Sachin Tendulkar Explains Why Watching A Billion Dreams Will Be \'Unsettling\' For Him', '', '', '96104_sachin.jpg', '<p>A hotly anticipated film about the life of Indian cricket legend Sachin Tendulkar hits cinemas this week but the batting great says he might find watching it an unsettling experience. &quot;I am used to seeing myself on a big screen inside the stadium, not inside a movie theatre,&quot; Tendulkar told AFP ahead of Friday&#39;s release of Sachin: A Billion Dreams. The docudrama, directed by Emmy-nominated British filmmaker James Erskine, took four years to make and traces Tendulkar&#39;s life from aspiring cricketer to arguably the greatest batsman of all time. It features real footage, including clips from his matches and interviews with colleagues and family and present day stars including Virat Kohli and Mahendra Singh Dhoni.</p>\r\n', 1495584000, 0, 153, 1),
(5, 1, 'image', 'BSNL Launches Satellite Phone Service for Areas With No Networks', '', '', '66456_satellite_pics.jpeg', '<p>State-owned BSNL on Wednesday started satellite phone service through INMARSAT which will be initially offered to government agencies and later opened for others citizens in phased manner.</p>\r\n\r\n<p>The service will cover areas where no networks are present and be provided by INMARSAT which has 14 satellites.</p>\r\n\r\n<p>Agencies handling disasters, state police, railways, Border Security Force and other government agencies will be given the phones in the first phase, Telecom Minister Manoj Sinha said at the service launch.</p>\r\n\r\n<p>&quot;Later people while travelling in flight and on ships will be able to use it,&quot; he added.</p>\r\n', 1495584000, 1, 114, 1),
(6, 1, 'image', 'Apple Starts Testing 5G Millimetre Wave Wireless Technology: Report ', '', '', '96720_apple_logo.jpg', '<p>Apple is not especially known to be an early adopter in tech world but if reports are to be believed, the Cupertino-based company is already planning to test new advancement in the world of wireless Internet - 5G. Apple has reportedly filed an application to test the next generation of wireless technology, termed as millimetre wave.</p>\r\n\r\n<p>The iPhone-maker will be testing the 5G wireless technology at two locations, one in Milpitas, California, on Yosemite Drive, and the other one on Mariana Avenue adjacent to its headquarters at 1 Infinite Loop, as per a report by Business Insider. The application was signed on Tuesday, and made public by the US FCC, the report notes.</p>\r\n', 1495584000, 0, 150, 1),
(7, 3, 'image', 'IT Workers Flay Steep Hike In Top Executives Compensation', '', '', '81567_it.jpg', '<p>Two IT employee groups have flayed the steep hike in compensation awarded to top executives of Infosys, terming the move by the software giant as &quot;painful&quot; amid job losses in the industry.</p>\r\n\r\n<p>According to the 2017 annual report of Infosys that was published on the company&#39;s website, payouts of at least four Infosys executives have increased by over 50 per cent in the previous fiscal year.</p>\r\n\r\n<p>&quot;Year-after-year, the IT companies remove and sack professionals and simultaneously hike their top executives&#39; salaries in the name of fancied compensation based on variable pay and stock incentives,&quot; FITE General Secretary AJ Vinod told PTI. &nbsp;</p>\r\n', 1495584000, 1, 115, 1),
(8, 3, 'image', 'Suresh Raina, Hardik Pandya, Shikhar Dhawan Appear In The Kapil Sharma Show', '', '', '24191_kapil.jpg', '<p>Free time is always at a premium for cricketers, especially Indian cricketers, who are involved in some tournament or the other at any time of the year. No sooner than the Indian Premier League (IPL) ended, they were all set for the ICC Champions Trophy 2017. But whatever little time they get, the players tend to still be in the thick of things. Suresh Raina, Hardik Pandya and Shikhar Dhawan found themselves in The Kapil Sharma Show during their free time and obviously they had a blast.<br />\r\n&quot;Good fun tonight with Kapil Sharma, Suresh Raina and Hardik Pandya. Full on mast,&quot; Dhawan wrote on his Instagram account.</p>\r\n', 1495584000, 0, 118, 1),
(9, 1, 'video', 'Shivraj Announces Free Education', 'https://www.youtube.com/watch?v=M4uhAjC0RTs', 'M4uhAjC0RTs', '', '<p>The ruling BJP government in Madhya Pradesh went ahead and announced free education for scheduled caste students.</p>\r\n', 1495497600, 0, 160, 1),
(10, 4, 'video', 'JatQuotaWar: Shopkeepers Shout Slogans In Rohtak', 'https://www.youtube.com/watch?v=CtHkN9ukUYg', 'CtHkN9ukUYg', '', '<p>The Chief Minister of the state faced anger of those who lost their means of livelihood.</p>\r\n', 1495584000, 0, 229, 1),
(11, 3, 'image', 'Here\'s How Belly Fat Can Predict Your Cancer Risk', '', '', '41354_belly.jpg', '<p>No one really wants to deal with the stubborn belly fat but it is the easiest the gain and the hardest to get rid of. Belly fat can not only affect the way you look, but it also comes with its own set of health risks like type-2 diabetes, cardiovascular diseases and even cancer. According to a new study,&nbsp;published in the British Journal of Cancer, people with increased belly fat may be at a higher risk of developing cancer, especially breast and bowel cancer in older adults.&nbsp;</p>\r\n', 1495584000, 0, 216, 1),
(12, 5, 'video', 'Caught On Camera: Man Falls Off Moving Train In Mumbai', 'https://www.youtube.com/watch?v=rPRRL9kKA6M', 'rPRRL9kKA6M', '', '<p>Caught On Camera: Man Falls Off Moving Train In Mumbai<br />\r\nIt was a close shave for a 28 year old man in Mumbai who almost fell under a train.</p>\r\n', 1495584000, 0, 200, 1),
(13, 1, 'video', 'So Sorry: Special Song Episode : Main Hoon Modi', 'https://www.youtube.com/watch?v=by-MLCGmik8', 'by-MLCGmik8', '', '<p>Here&#39;s a comical and satirical take on the whole Modi phenomenon sweeping the country - and have you seen Modi dance ? This video will make your stomach hurt from laughing.&nbsp;</p>\r\n', 1495411200, 0, 348, 1),
(14, 3, 'image', 'Kriti Sanon will wow you with her easy breezy summer style', '', '', '35042_kriti.jpg', '<p>Kriti Sanon, who is on a promotional spree for her upcoming film &lsquo;Raabta&rsquo; opposite Sushant Singh Rajput, is giving onlookers some major style goals. Be it the glam doll or the girl-next-door, the leggy actress manages to pull off every look with ease. Kriti recently took to Instagram and shared a picture with the caption, &ldquo;Today for promotions!!&rdquo; In the picture, she can be seen sporting a flirty gingham print summer dress with a frilly hemline and white sneakers. With hair tied in a messy side braid and soft pink lips, Kriti looks like a pretty damsel.</p>\r\n\r\n<p>Kriti Sanon, who is on a promotional spree for her upcoming film &lsquo;Raabta&rsquo; opposite Sushant Singh Rajput, is giving onlookers some major style goals. Be it the glam doll or the girl-next-door, the leggy actress manages to pull off every look with ease. Kriti recently took to Instagram and shared a picture with the caption, &ldquo;Today for promotions!!&rdquo; In the picture, she can be seen sporting a flirty gingham print summer dress with a frilly hemline and white sneakers. With hair tied in a messy side braid and soft pink lips, Kriti looks like a pretty damsel.</p>\r\n\r\n<p>Kriti Sanon, who is on a promotional spree for her upcoming film &lsquo;Raabta&rsquo; opposite Sushant Singh Rajput, is giving onlookers some major style goals. Be it the glam doll or the girl-next-door, the leggy actress manages to pull off every look with ease. Kriti recently took to Instagram and shared a picture with the caption, &ldquo;Today for promotions!!&rdquo; In the picture, she can be seen sporting a flirty gingham print summer dress with a frilly hemline and white sneakers. With hair tied in a messy side braid and soft pink lips, Kriti looks like a pretty damsel.</p>\r\n', 1495670400, 0, 228, 1),
(15, 5, 'image', 'BCCI Unhappy With Anil Kumble, Say Sources, Seeks CVs For Head Coach', '', '', '46800_anil-kumble.jpg', '<p>Anil Kumble can apply again for the same role and will get a direct entry for the process.</p>\r\n\r\n<p>Hours after the Indian cricket team left for their Champions Trophy campaign, the Indian cricket board issued a press release, inviting applications for the position of the Head Coach for the men&#39;s team. While the board has not made any obvious connection between the two, sources in the Board of Control for Cricket in India (BCCI) have told NDTV that they are &#39;unhappy&#39; with Kumble&#39;s role in players&#39; pay negotiations just before the IPL final.<br />\r\nAnil Kumble spoke to the Committee of Administrators (CoA), while Virat Kohli joined on Skype, asking for 150 per cent hike in the retainership of the Grade A players. Also, Kumble himself demanded Rs 7.5 crore per annum. His present salary is around Rs 6.25 crore.<br />\r\nThe release, headlined &#39;Applications invited for the position of Head Coach for Indian Cricket Team (Men)&#39;, states: &quot;The Board of Control for Cricket in India (BCCI) would like to call upon interested candidates to apply for the position of &#39;Head Coach&#39; for Indian Cricket Team (Men).</p>\r\n\r\n<p>&quot;The process has been initiated since the term of the current coach, Mr. Anil Kumble concludes with the Champions Trophy,&quot; it further said.</p>\r\n\r\n<p>&quot;Present Head Coach, Mr. Anil Kumble will be a direct entry for the process.</p>\r\n\r\n<p>&quot;To ensure a fair and completely transparent process, a nominee of the Committee of Administrators (CoA) will oversee the entire process along with the Cricket Advisory Committee,&quot; it added.<br />\r\n&quot;The BCCI&#39;s three-member Cricket Advisory Committee comprising Mr. Sachin Tendulkar, Mr. Sourav Ganguly and Mr. VVS Laxman will conduct interviews and seek presentations to select the best possible candidate to guide the team and take Indian Cricket forward,&quot; it adds.</p>\r\n\r\n<p>While the administrators have given a chance to the bowling legend to return to the top job, they aren&#39;t making his road easy.</p>\r\n\r\n<p>He will once again have to send his CV and appear for an interview with the Cricket Advisory Committee of Ganguly, Tendulkar and Laxman.<br />\r\n&quot;Obviously, he is in contention as the current chief coach,&quot; a BCCI official told PTI.</p>\r\n\r\n<p>The surprising aspect has been the timing of the announcement for inviting fresh applications as the team just landed in UK on Thursday for their Champions Trophy defence.<br />\r\n&quot;Obviously BCCI could have waited till the end of the Champions Trophy to invite applications. But then no one should take his place for granted,&quot; the source added.<br />\r\n&quot;Kumble is bargaining for himself as well as the players. Fair enough but tomorrow if BCCI decides to replace him, he will not be in a position to bargain. Some of his demands have been simply inexplicable,&quot; the official said.<br />\r\nSome in the cricket circles feel,&quot;the legendary player has been insulted by the BCCI and the process could have been done after the Champions Trophy was over.&quot;</p>\r\n\r\n<p>Kumble has also asked for a promotion of Sanjay Bangar as the assistant coach and Zaheer Khan as bowling coach.</p>\r\n', 1495756800, 0, 162, 1),
(16, 5, 'image', 'Champions Trophy 2017: India and Australia are the two most well balanced teams, says Erapalli Prasanna', '', '', '49122_indian-team.jpg', '<p>Former Indian spinner Erapalli Prasanna has gone on to claim that India and Australia will be the teams to beat as they have a balanced squad.</p>\r\n\r\n<p>In an interview to the PTI, he said,&rdquo;I feel India and Australia are two most well balanced teams. They should make the final. India especially have a very good attack with six specialist bowlers.&rdquo;<br />\r\n&nbsp;<br />\r\nCommenting on the Indian spinners he said,&rdquo;I also wanted to see Kuldeep Yadav in the squad but probably the selectors did not pick him considering the tournament is in England where you would need seamers and all four pacers that we have will prove more than a handful.&rdquo;</p>\r\n\r\n<p>The 20 overs bowled by spinners will also be crucial. It is a 50-over game and their job will be to stem the flow of runs and take wickets in the middle overs.</p>\r\n\r\n<p>Spekaing on the experience in the Indian team he added,&rdquo;We have a lot of experience in this current squad. The core remains the same which is the biggest advantage. With nine out of 15 from the current squad being part of the victorious 2013 squad, there will be a certain sense of familiarity with the conditions and that will help our team.&rdquo;</p>\r\n', 1495670400, 1, 337, 1),
(17, 3, 'video', 'Manchester bombing latest: Army bomb disposal team called to college in Hulme', 'https://www.youtube.com/watch?v=WJ-5Zre6cVc', 'WJ-5Zre6cVc', '', '<p>​​​​​An army bomb disposal team have been called to a college in Hulme as witnesses reportedly heard police shout take cover. UK Government &quot;furious&quot; about leaks, Whitehall sources say</p>\r\n\r\n<ul>\r\n	<li>May expected to raise US intelligence leaks with Trump</li>\r\n	<li>Greater Manchester Police have stopped sharing info</li>\r\n	<li>Leaked pictures show Manchester attacker&#39;s suicide bomb</li>\r\n	<li>Eilidh MacLeod&#39;s family pay tribute after she is confirmed dead</li>\r\n	<li>Minute&#39;s silence will be held at 11am on Thursday</li>\r\n	<li>Everything we know about attack targeting Ariana Grande gig</li>\r\n</ul>\r\n\r\n<p>Greater Manchester Police said it was too early to say whether the alert is linked to its investigation into the Manchester bomb attack.</p>\r\n\r\n<p><img alt=\"\" src=\"http://www.viaviweb.in/envato/cc/all_in_one_videos_demo/images/thumbs/63095_Animation.jpg\" style=\"height:250px; width:250px\" /><br />\r\nIt said several roads were closed and officers were &quot;currently assessing the situation&quot;.</p>\r\n\r\n<p>Earlier it was revealed police hunting the terror network behind the Manchester Arena bombing have stopped passing information to the US on the investigation as a major transatlantic row erupted over leaks of key evidence in the US, according to a report.</p>\r\n', 1495670400, 0, 273, 1),
(18, 3, 'image', 'General election 2017: Latest polls and odds tracker', '', '', '46091_world.png', '<p>While still riding high in the general election polls, Theresa May&#39;s Conservative Party is seeing its lead narrow with less than three weeks to go before the general election on June 8.</p>\r\n\r\n<p>Some early polls had the Tories at almost double the vote share of the Labour Party led by Jeremy Corbyn, indicating that the most likely outcome would be a landslide victory that would increase her party&rsquo;s current working majority of 17 in the House of Commons.</p>\r\n\r\n<p>UK General Election 2017 - polling averages<br />\r\nHover or tap for more info</p>\r\n\r\n<p>21 May 2017</p>\r\n\r\n<ul>\r\n	<li>Con: 45.8%</li>\r\n	<li>Lab: 33.6%</li>\r\n	<li>LD: 8%</li>\r\n	<li>UKIP: 4.2%</li>\r\n	<li>Green: 2%</li>\r\n</ul>\r\n\r\n<p><br />\r\nTheresa May&#39;s lead has dropped from 17.8 points to 12.7 since she called the election on April 18.</p>\r\n\r\n<p>While the pollsters still give the Tories a clear lead, the apparent impact of early campaigning will be a concern to party headquarters, and a boost to their rivals.</p>\r\n\r\n<p>Some experts had estimated that the Tories would take as many as 56 seats from Labour, leaving them with a 200-seat lead over the official opposition party, aided by Ukip&#39;s apparent collapse in popular support over recent weeks.</p>\r\n\r\n<p>A healthy Tory majority is still on the cards, but Labour now look set to win more of the vote than they did under Ed Miliband in 2015. Theresa May won&#39;t be worried yet, but alarm bells will ring if her lead continues to narrow.</p>\r\n\r\n<p>Follow how the race is shaping up with The Telegraph&#39;s poll tracker, which looks at national voting intention from individual polls.</p>\r\n\r\n<p><a href=\"http://viavilab.com/\"><img alt=\"\" src=\"http://viavilab.com/images/logo.png\" style=\"height:84px; width:400px\" /></a></p>\r\n', 1495670400, 0, 248, 1),
(19, 2, 'image', 'Bollywood actress in Rajinikanth\'s \'Kaala\'', '', '', '23345_kala.png', '<p>The title of Superstar Rajinikanth and director Ranjith&#39;s film &#39;Kaala&#39; with a tagline Karikaalan was revealed today. While the Superstar is set to head to Mumbai for the shoot of the film, the latest news is that Bollywood actress Anjali Patil of &#39;Finding Fanny&#39; fame has been roped into the film. The month long schedule is set to begin on May 28th.</p>\r\n\r\n<p>The pretty actress tweeted, &quot;Next film for this year. With THE ONE AND ONLY. Thalaiva. Produced by @dhanushkraja Directed by @beemji #Rajnikanth #Superstar #Kaala&quot;</p>\r\n\r\n<p>Ranjith of Madras and Kabali fame is the director of Kaala , which will have music composed by Santhosh Narayanan. Another intersting addition to the team is Sreekar Prasad, who will take care of the editing with Murali cranking the camera.</p>\r\n', 1495670400, 1, 480, 1),
(20, 2, 'video', 'Israeli beauty queen sizzles in these bikini pictures', 'https://www.youtube.com/watch?v=yeSC5ZKAwek', 'yeSC5ZKAwek', '', '<p>Bold and beautiful title goes to none other than Rotem Rabi. Miss World Israel 2017 will be representing her motherland at Miss World 2017 very soon. Before that milestone, let&rsquo;s take a look at the insanely gorgeous bikini pictures of the lady in the tiara.</p>\r\n\r\n<p>Beauty Queen has served as a medic in the Israel Air Force, and while she is currently working as a model, she has begun the process of joining the Israel Police investigative division.</p>\r\n\r\n<p>Hailing from the holy city of Jerusalem, Rotem Rabi was crowned amongst 21 other competitors.</p>\r\n\r\n<p>After winning in the grand finale, 21-year-old thanked her army of social media followers for the constant support.</p>\r\n\r\n<p>The geometrical print bikini looks captivating. Not surprising, she stole the crown of Miss World Israel 2017.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1495663200, 0, 1081, 1),
(21, 2, 'image', '‘Baahubali 2: The Conclusion’ box-office collection: Film’s Hindi version becomes highest fourth week grosser', '', '', '18630_bahubali.png', '<p>SS Rajamouli&#39;s magum opus &#39;Baahubali 2: The Conclusion&#39; is the biggest blockbuster of Indian cinema and continues to shatter records even in its fourth week. The film&#39;s Hindi version amassed as much as Rs 18 crore (nett) in its fourth weekend at the ticket windows, according to a report on Boxofficeindia.com. With this, the film has become the highest fourth week grosser - previously, the highest fourth week record was held by Aamir Khan&#39;s &#39;3 Idiots&#39; that had grossed Rs 15.95 crore (nett) in its fourth week. &#39;Baahubali 2&#39; (Hindi) has smashed that record in the fourth weekend itself. The total collection of the Hindi version now stands at Rs 474.49 crore and is nearing the 500-crore benchmark.</p>\r\n\r\n<p><img alt=\"\" src=\"http://data1.ibtimes.co.in/cache-img-900-423/en/full/634050/1494513424_bahubali-2-baahubali-2-baahubali-2-poster-prabhas-anushka-shetty-baahubali-conclusion.jpg\" style=\"height:183px; width:390px\" /></p>\r\n\r\n<p>The first week collection of &#39;Baahubali 2&#39; (Hindi) was an astounding Rs 246.47 crore, followed by Rs 142.52 crore in its second week and finally Rs 67.25 crore in its third week.</p>\r\n\r\n<p>Starring Prabhas and Rana Dagubatti in lead roles, &#39;Baahubali 2: The Conclusion&#39; enjoyed a grand release in about 9000 screens worldwide. The film was earlier scheduled to release in 2016, however, the makers pushed the release to 2017.</p>\r\n\r\n<p>While the cast and crew of the film is having a swell time vacaying overseas, Karan Johar is celebrating the success with numerous parties along with doing diaper duties for his recently born twins Roohi and Yash.<br />\r\n&nbsp;</p>\r\n', 1495670400, 1, 838, 1),
(22, 2, 'image', 'Sanjay Dutt’s new look for ‘Saheb Biwi Aur Gangster 3’ is menacing', '', '', '69588_sanjubaba.png', '<p><img alt=\"\" src=\"http://localhost/news_app_new_demo/fileman/Uploads/roxy-fileman-logo.gif\" style=\"height:127px; width:289px\" /></p>\r\n\r\n<p>Rohit Shetty introduced the character of inspector Sooryavanshi in his recent cop drama &#39;Simmba&#39; starring Ranveer Singh. Akshay Kumar played the role of Sooryavanshi in the film.</p>\r\n\r\n<p>Now, the director has headed out to shoot the stand-alone movie on Inspector Sooryavanshi. He took to his Instagram to share a picture with his crew and captioned, &quot;Mission SOORYAVANSHI En route Goa.&quot; As always, the film will be shot in Goa.</p>\r\n\r\n<p>Sonu Sood who played the role of a villain in &#39;Simmba&#39; also commented, Another blockbuster on the way .</p>\r\n', 1495663200, 0, 1600, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news_gallery`
--

CREATE TABLE `tbl_news_gallery` (
  `id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `news_gallery_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_news_gallery`
--

INSERT INTO `tbl_news_gallery` (`id`, `news_id`, `news_gallery_image`) VALUES
(1, 22, '27004_fashion_2.jpg'),
(2, 22, '94709_fashion_3.jpg'),
(3, 22, '17179_Fashion1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `envato_buyer_name` varchar(255) NOT NULL,
  `envato_purchase_code` varchar(255) NOT NULL,
  `envato_purchased_status` int(1) NOT NULL DEFAULT '0',
  `package_name` varchar(255) DEFAULT NULL,
  `ios_bundle_identifier` varchar(255) DEFAULT NULL,
  `onesignal_app_id` varchar(500) NOT NULL,
  `email_from` varchar(255) NOT NULL,
  `onesignal_rest_key` varchar(500) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `app_logo` varchar(255) NOT NULL,
  `app_email` varchar(255) NOT NULL,
  `app_version` varchar(255) NOT NULL,
  `app_author` varchar(255) NOT NULL,
  `app_contact` varchar(255) NOT NULL,
  `app_website` varchar(255) NOT NULL,
  `app_description` text NOT NULL,
  `app_developed_by` varchar(255) NOT NULL,
  `app_privacy_policy` text NOT NULL,
  `api_all_order_by` varchar(255) NOT NULL,
  `api_latest_limit` int(3) NOT NULL,
  `api_cat_order_by` varchar(255) NOT NULL,
  `api_cat_post_order_by` varchar(255) NOT NULL,
  `publisher_id` varchar(500) NOT NULL,
  `interstital_ad` varchar(500) NOT NULL,
  `interstital_ad_id` varchar(500) NOT NULL,
  `interstital_ad_click` varchar(500) NOT NULL,
  `banner_ad` varchar(500) NOT NULL,
  `banner_ad_id` varchar(500) NOT NULL,
  `publisher_id_ios` varchar(500) NOT NULL,
  `app_id_ios` varchar(500) NOT NULL,
  `interstital_ad_ios` varchar(500) NOT NULL,
  `interstital_ad_id_ios` varchar(500) NOT NULL,
  `interstital_ad_click_ios` varchar(500) NOT NULL,
  `banner_ad_ios` varchar(500) NOT NULL,
  `banner_ad_id_ios` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `envato_buyer_name`, `envato_purchase_code`, `envato_purchased_status`, `package_name`, `ios_bundle_identifier`, `onesignal_app_id`, `email_from`, `onesignal_rest_key`, `app_name`, `app_logo`, `app_email`, `app_version`, `app_author`, `app_contact`, `app_website`, `app_description`, `app_developed_by`, `app_privacy_policy`, `api_all_order_by`, `api_latest_limit`, `api_cat_order_by`, `api_cat_post_order_by`, `publisher_id`, `interstital_ad`, `interstital_ad_id`, `interstital_ad_click`, `banner_ad`, `banner_ad_id`, `publisher_id_ios`, `app_id_ios`, `interstital_ad_ios`, `interstital_ad_id_ios`, `interstital_ad_click_ios`, `banner_ad_ios`, `banner_ad_id_ios`) VALUES
(1, 'vspeight06', '030f0e57-5fba-4de3-ad52-28e8ba73a812', 1, 'com.example.abcd', 'com.example.news', '8f10acab-fd35-40b8-9497-a79ab6bd634b', 'info@viaviweb.in', 'YjJkODlkNzYtYjQ1NC00ZTQ1LWE1MjktNWE0OGMzOGQ4ZGRk', 'News App', '96app_icon.png', 'info@viaviweb.com', '2.4.6', 'Viavi Webtech', '+91 9227777522', 'www.viaviweb.com', '<p>As Viavi Webtech is finest offshore IT company which has expertise in the below mentioned all technologies and our professional, dedicated approach towards our work has always satisfied our clients as well as users. We have reached to this level because of the dedication and hard work of our 10+ years experienced team as well as new ideas of freshers, they always provide the best solutions. Here are the promising services served by Viavi Webtech.</p>\r\n\r\n<p>Contact on Skype &amp; Email for more information.</p>\r\n\r\n<p><strong>Skype ID:</strong> support.viaviweb <strong>OR</strong> viaviwebtech<br />\r\n<strong>Email:</strong> info@viaviweb.com <strong>OR</strong> viaviwebtech@gmail.com<br />\r\n<strong>Website:</strong> http://www.viaviweb.com</p>\r\n', 'Viavi Webtech', '<p><strong>We are committed to protecting your privacy</strong></p>\r\n\r\n<p>We collect the minimum amount of information about you that is commensurate with providing you with a satisfactory service. This policy indicates the type of processes that may result in data being collected about you. Your use of this website gives us the right to collect that information.&nbsp;</p>\r\n\r\n<p><strong>Information Collected</strong></p>\r\n\r\n<p>We may collect any or all of the information that you give us depending on the type of transaction you enter into, including your name, address, telephone number, and email address, together with data about your use of the website. Other information that may be needed from time to time to process a request may also be collected as indicated on the website.</p>\r\n\r\n<p><strong>Information Use</strong></p>\r\n\r\n<p>We use the information collected primarily to process the task for which you visited the website. Data collected in the UK is held in accordance with the Data Protection Act. All reasonable precautions are taken to prevent unauthorised access to this information. This safeguard may require you to provide additional forms of identity should you wish to obtain information about your account details.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Your Internet browser has the in-built facility for storing small files - &quot;cookies&quot; - that hold information which allows a website to recognise your account. Our website takes advantage of this facility to enhance your experience. You have the ability to prevent your computer from accepting cookies but, if you do, certain functionality on the website may be impaired.</p>\r\n\r\n<p><strong>Disclosing Information</strong></p>\r\n\r\n<p>We do not disclose any personal information obtained about you from this website to third parties unless you permit us to do so by ticking the relevant boxes in registration or competition forms. We may also use the information to keep in contact with you and inform you of developments associated with us. You will be given the opportunity to remove yourself from any mailing list or similar device. If at any time in the future we should wish to disclose information collected on this website to any third party, it would only be with your knowledge and consent.&nbsp;</p>\r\n\r\n<p>We may from time to time provide information of a general nature to third parties - for example, the number of individuals visiting our website or completing a registration form, but we will not use any information that could identify those individuals.&nbsp;</p>\r\n\r\n<p>In addition Dummy may work with third parties for the purpose of delivering targeted behavioural advertising to the Dummy website. Through the use of cookies, anonymous information about your use of our websites and other websites will be used to provide more relevant adverts about goods and services of interest to you. For more information on online behavioural advertising and about how to turn this feature off, please visit youronlinechoices.com/opt-out.</p>\r\n\r\n<p><strong>Changes to this Policy</strong></p>\r\n\r\n<p>Any changes to our Privacy Policy will be placed here and will supersede this version of our policy. We will take reasonable steps to draw your attention to any changes in our policy. However, to be on the safe side, we suggest that you read this document each time you use the website to ensure that it still meets with your approval.</p>\r\n\r\n<p><strong>Contacting Us</strong></p>\r\n\r\n<p>If you have any questions about our Privacy Policy, or if you want to know what information we have collected about you, please email us at hd@dummy.com. You can also correct any factual errors in that information or require us to remove your details form any list under our control.</p>\r\n', 'DESC', 12, 'cid', 'DESC', 'pub-8356404931736973', 'true', 'ca-app-pub-8356404931736973/8732534868', '5', 'true', 'ca-app-pub-8356404931736973/9694015321', 'pub-8356404931736973', 'ca-app-pub-8356404931736973~5938963872', 'true', 'ca-app-pub-3940256099942544/1033173712', '5', 'true', 'ca-app-pub-3940256099942544/6300978111');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `name`, `email`, `password`, `phone`, `status`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', '12345678963', '1'),
(2, 'wferf', 'ektabarad12@gmail.com', 'eefd', '1234567892', '1'),
(3, 'john', 'kuldip@viaviweb.com', 'asds123', '1256098765', '1'),
(4, 'john', 'adminfg@gmail.com', 'admin1233', '1256098765', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_home_banner`
--
ALTER TABLE `tbl_home_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_news_gallery`
--
ALTER TABLE `tbl_news_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_home_banner`
--
ALTER TABLE `tbl_home_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_news_gallery`
--
ALTER TABLE `tbl_news_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
