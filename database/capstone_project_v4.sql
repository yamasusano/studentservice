-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 17, 2018 at 10:22 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `capstone_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_chat`
--

CREATE TABLE `wp_chat` (
  `ID` bigint(20) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_chat_user`
--

CREATE TABLE `wp_chat_user` (
  `ID` bigint(20) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `sender` bigint(20) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_chat_user`
--

INSERT INTO `wp_chat_user` (`ID`, `chat_id`, `sender`, `message`, `status`, `create_date`) VALUES
(14, 16, 116, 'hello ban toi', 1, '2018-12-17 09:30:54'),
(15, 16, 115, 'oi, goi gi day', 1, '2018-12-17 09:31:16'),
(16, 16, 116, 'mai di choi khong', 1, '2018-12-17 09:31:44'),
(17, 16, 115, 've ha noi xem phim di', 1, '2018-12-17 09:31:50'),
(18, 17, 105, 'hello trang', 1, '2018-12-17 09:34:30'),
(19, 16, 116, 'e mai oi', 1, '2018-12-17 10:12:20'),
(20, 16, 116, 'e, mai di choi khong', 1, '2018-12-17 10:13:33'),
(38, 16, 116, 'ê trang ơi', 1, '2018-12-17 14:20:02'),
(39, 18, 105, 'huy ơi', 0, '2018-12-17 18:18:00'),
(40, 18, 105, 'huy ơi', 0, '2018-12-17 18:18:23'),
(41, 18, 116, 'Thầy gọi em ạ', 1, '2018-12-17 18:24:20');

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-10-13 14:08:58', '2018-10-13 14:08:58', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, 'post-trashed', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_finder_form`
--

CREATE TABLE `wp_finder_form` (
  `ID` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `other_skill` text COLLATE utf8_unicode_ci NOT NULL,
  `contact` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL,
  `semester` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `special` int(11) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_finder_form`
--

INSERT INTO `wp_finder_form` (`ID`, `user_id`, `title`, `description`, `other_skill`, `contact`, `status`, `semester`, `special`, `updated_date`, `created_date`) VALUES
(1, 3, 'Chart Designer (Adobe Illustrator)', 'We are looking for experienced graphic designers to join us for the position as Illustrator\r\nNo need to spend time looking for work or discussing with clients, you will receive a constant flow of projects while others take care of the administrative work\r\nAs part of the Konsus team, your job will be to support on illustration and chart redrawing across our PowerPoint and Graphic Design Services\r\nWe are looking for highly skilled Adobe Illustrator wizards to join our technical chart drawing team as part of the ever-expanding Konsus community\r\nIn the AI chart drawing team, you will mainly be re-creating charts such as technical or business presentation graphs given to you as images\r\nWe work for premium corporate clients including large global corporations. We learn our client\'s style preferences and develop their branding\r\nBe part of dedicated client teams responsible for building long-lasting client relationships, and a community of top-tier specialists that work, learn, build and have fun together\r\nWork from wherever you want and manage your own schedule\r\nBe available to work a minimum of 25-30 hours per week', 'Graphic Design, Adobe Illustrator,Microsoft Windows platform', '0026561107', 1, 'FALL 2018', 0, '2018-12-05 03:56:08', '2018-12-05 03:56:08'),
(2, 4, 'Online Interior Designer', 'Do you spend your days perusing the internet for new trends in home decor and furnishing…..and then pinning your findings to one of your many Pinterest boards? \r\n\r\nDo you create photoshop mood boards to redecorate the rooms in your house each season? \r\n\r\nDoes the word \"\"couch\"\" make you cringe? It\'s a sofa, people! \r\n\r\nDo you constantly find ways to go above and beyond for your design clients, stopping at nothing until they are over the moon in love with their beautiful new room? \r\n\r\nDo you want to grow your own design business and personal brand without spending time or money on sales and marketing? \r\n\r\nIf you can answer \"\"yes\"\" to those questions, then the Havenly e-Designer opportunity might be a great fit for you! \r\n\r\nHavenly is an online interior design service and home decorating discovery engine. We are your design BFF, looking to make home design dreams come true for all budgets and styles. Our goals are to make home design effortless, empowering and accessible for everyone! \r\n\r\nWe are growing our Online Design team! We\'re looking for experienced interior designers who are entrepreneurially spirited, client-focused and fired up to grow a business in a new and exciting way. ', 'Havenly platform, e-Designer', '7507313401', 1, 'SUMMER 2019', 0, '2018-12-05 03:56:08', '2018-12-05 03:56:08'),
(3, 5, 'Software Developer', 'Software developers create software programs that allow users to perform specific tasks on various devices, such as computers or mobile devices. They are responsible for the entire development, testing, and maintenance of software.\r\n\r\nSoftware developers must have the technical creativity required to solve problems uniquely. They need to be fluent in the computer languages that are used to write the code for programs.\r\n\r\nCommunication skills are vital for securing the necessary information and insight from end users about how the software is functioning.', 'Advanced quantitative, Analytical Analyzing, algorithms, Analyzing data relationships', '9817470598', 1, 'SPRING 2019', 0, '2018-12-05 03:56:08', '2018-12-05 03:56:08'),
(4, 6, 'Database Administrator', 'Database administrators analyze and evaluate the data needs of users. They develop and improve data resources to store and retrieve critical information.\r\n\r\nThey need the problem-solving skills of the computer science major to correct any malfunctions in databases and to modify systems as the needs of users evolve.', 'Assembly,Assessing the needs of end users,C,C++', '2706835204', 1, 'SPRING 2019', 0, '2018-12-05 03:56:08', '2018-12-05 03:56:08'),
(5, 7, 'Computer Hardware Engineer', 'Computer hardware engineers are responsible for designing, developing, and testing computer components, such as circuit boards, routers, and memory devices.\r\n\r\nComputer hardware engineers need a combination of creativity and technical expertise. They must be avid learners who stay on top of emerging trends in the field to create hardware that can accommodate the latest programs and applications.\r\n\r\nComputer hardware engineers must have the perseverance to perform comprehensive tests of systems, again and again, to ensure the hardware is functioning properly.', 'Collaboration,Communication,Composing processes with pipes,Creating, modifying and executing a makefile, Creating a code portfolio showcasing programming projects, Creativity', '7057751726', 1, 'SUMMER 2019', 0, '2018-12-05 03:56:08', '2018-12-05 03:56:08'),
(6, 8, 'Computer Systems Analyst', 'Computer systems analysts assess an organization computer systems and recommend changes to hardware and software to enhance the company efficiency.\r\n\r\nBecause the job requires regular communication with managers and employees, computer systems analysts need to have strong interpersonal skills. Systems analysts need to able to convince staff and management to adopt technology solutions that meet organizational needs.\r\n\r\nAlso, systems analysts need the curiosity and thirst for continual learning to track trends in technology and research cutting-edge systems.\r\n\r\nSystems analysts also need business skills to know what is best for the entire organization. In fact, similar job titles are business analysts or business systems analysts.', 'Critical thinking,Cultivating relationships with customers and/or internal constituents', '0757714414', 1, 'SUMMER 2019', 0, '2018-12-05 03:56:09', '2018-12-05 03:56:09'),
(7, 9, 'Computer Network Architect', 'Computer network architects design, implement and maintain networking and data communication systems, including local area networks, wide area networks, extranets, and intranets. They assess the needs of organizations for data sharing and communications.\r\n\r\nIn addition, computer network architects evaluate the products and services available in the marketplace. Computer network architects test systems before implementation and resolve problems as they occur after the set-up is in place.\r\n\r\nComputer network architects need to have the analytical skills to evaluate computer networks.', 'Debugging programs,Detail orientation,Devising algorithms,Documenting coding changes', '3195907357', 1, 'SUMMER 2019', 0, '2018-12-05 03:56:09', '2018-12-05 03:56:09'),
(8, 10, 'Web Developer', 'Web developers assess the needs of users for information-based resources. They create the technical structure for websites and make sure that web pages are accessible and easily downloaded through a variety of browsers and interfaces.  \r\n\r\nWeb developers structure sites to maximize the number of page views and visitors through search engine optimization. They must have the communication ability and creativity to make sure the website meets its user\'s needs.', 'Editing files with emacs and vim,Engaging in lifelong learning,Evaluating sorting, searching, and filtering methods,Explaining technical concepts', '2243525960', 1, 'SUMMER 2019', 0, '2018-12-05 03:56:09', '2018-12-05 03:56:09'),
(9, 11, 'Information Security Analyst', 'Information security analysts create systems to protect information networks and websites from cyber attacks and other security breaches. Their responsibilities also include researching trends in data security to anticipate problems and install systems to prevent issues before they occur.\r\n\r\nSecurity analysts also need strong problem-solving skills to investigate breaches, determine the causes, and modify or repair security systems.', 'Haskell,Independence,Investigative ,Java,JavaScript,LaTeX', '3724281812', 1, 'SUMMER 2019', 0, '2018-12-05 03:56:09', '2018-12-05 03:56:09'),
(10, 12, 'Computer Programmer', 'Computer programmers write the code that enables software to operate as intended by software developers.\r\n\r\nThe computer science major equips students to master common computer languages used to create programs and to understand the logic and structure of languages so that they can more easily learn new computer languages.  \r\n\r\nComputer programmers debug problems with existing programs and modify programs as the needs of end users change.', 'Leadership,Learning new computer languages,Listening,Logical reasoning', '7664791291', 1, 'SUMMER 2019', 0, '2018-12-05 03:56:09', '2018-12-05 03:56:09'),
(11, 13, 'Finance Manager - Industrial Finance\r\n', 'Be partner with Make team to build/drive/control production cost of factories, including both 3P and in-house plants through in year performance . Be involved in the negotiation process with 3P about processing fees.\r\nProvide partnering to all commercial support for SC team in decision making\r\nCapex Investment decision support\r\nWCM CD lead to drive saving program and saving initiatives for manufacturing activities\r\nQuarterly lead Stock count for factories and annually for distribution centers. Verify reports for variances and have follow up for compensation payment or scrap factor adjustment\r\nProvide support to control and audit related matters for factory\r\n\r\nStrategic planning:\r\nIn charge of long-term plan and Annual target setting of Production cost\r\n\r\nProjects/ad-hoc business requests:\r\nProject based to support SC overall for decision support\r\nSupport with ad-hoc requests for business engagement with regional SC teams\r\n', 'Solid knowledge,  financial planning , performance management, Strong analytical skills, ', '5836259796', 1, 'SPRING 2019', 0, '2018-12-05 03:56:09', '2018-12-05 03:56:09'),
(12, 14, 'Senior Finance Manager', 'PS are the recruitment partner for a global private schools’ group who own and operate over 70 schools around the world.   \r\n\r\n\r\nWe are seeking to appoint a Senior Finance Manager,  a key member of the local management team in the School and the Regional Finance team. This role reports to the Asia Regional Director of Finance and supports the Head of School with daily school finance operation.\r\n\r\n  \r\nAs a Senior Finance Manager across three schools, your responsibilities will include:\r\n\r\n', 'high level of integrity,Strong partnership skills ,collaborate and drive actions with SC, Solid leadership skills, Degree in accounting/finance,CPA or CMA certified preferred', '3509943513', 1, 'SPRING 2019', 0, '2018-12-05 03:56:09', '2018-12-05 03:56:09'),
(13, 15, 'Finance Controller', 'Our client is an international company with fast pace environment seeking a strong leader in running the Finance & Accounting team of 25 for the company.', 'Telecommunications/Technology Company,International team culture', '7324670981', 1, 'SPRING 2019', 0, '2018-12-05 03:56:09', '2018-12-05 03:56:09'),
(14, 16, 'Finance Analyst', 'Provides financial analysis for business/function and strategic plans, budget and forecast process. Performs monthly analysis of results to provide insight to management. Supports commercial owner in investment appraisal/monitoring by developing appropriations and maintaining monthly balances. Creates and evaluates key financial indicators that provide financial and business insight to management. Proactively maintains and enhances financial planning and analysis systems to ensure accuracy and integrity of data. Supports Finance Managers on ad hoc business requests and works directly with operational managers in meeting their finance requirements. May have audit and accounting exposure.', 'Domain Expertise, Advanced Analytics,Unparalleled Data', '6959926531', 1, 'FALL 2018', 0, '2018-12-05 03:56:09', '2018-12-05 03:56:09'),
(15, 17, 'Supply Chain Finance Assistant Manager', 'Đánh giá hiệu quả đầu tư các dự án, sửa chửa lớn và các chương trình KAIZEN của các nhà máy.\r\nQuản lý ngân sách đầu tư, danh mục tờ trình và theo dõi Project Status của các nhà máy thuộc trách nhiệm quản lý. Quản lý việc nghiệm thu và hình thành tài sản cho các dự án đang quản lý.\r\nHỗ trợ phân tích tài chính cho phòng ban MPO/Manufacturing/Supply Chain trước khi đưa ra quyết định. xây dựng báo cáo đánh giá AD-HOC liên quan đến hiệu quả cost saving (logistic, costing, pet…).\r\nPhối hợp với bộ phận để đưa bộ máy sản xuất đạt được mức tối ưu về hoạt động và tài chính.', ' kế toán , phân tích tài chính,kiểm toán độc lập,  phân tích tài chính,CFA/ACCA/CIMA ', '6562418399', 1, 'FALL 2018', 0, '2018-12-05 03:56:09', '2018-12-05 03:56:09'),
(16, 18, 'Business Development Executive (Broking), Finance Services and Professional Group', 'To work with Sales Professional (SP) in dealing with market to have the best sales pitch for Finance Services and Profession Group (FSPG), to be responsible for providing satisfactory services to assigned customers in arranging policies and other relevant documents, answering queries and coordinating activities to ensure the quality of services and compliance with standard business procedures and provide other colleagues with advice within the professional area.', ' Fluent English communication and writing,Excellent IT skills, specially Excel, Word and Power Point, Strong interpersonal skill.', '4594281016', 1, 'FALL 2018', 0, '2018-12-05 03:56:09', '2018-12-05 03:56:09'),
(17, 19, 'Finance and Administration Manager, Tackling Modern Slavery in Vietnam', 'Tackling Modern Slavery in Vietnam project is funded by the UK Home Office and implemented by a consortium composed of International Organisation of Migration, British Council and World Vision. International Organisation for Migration (IOM) is the consortium lead.\r\n\r\n \r\n\r\nThe Project is expected to achieve the following three broad impact areas: 1) Preventing vulnerable populations from becoming victims, 2) Strengthening the judicial response to human trafficking and 3) Supporting the rehabilitation and reintegration of victims of trafficking.', 'Financial Management, Accounting, equivalent.', '9116568521', 1, 'SPRING 2019', 0, '2018-12-05 03:56:09', '2018-12-05 03:56:09'),
(18, 20, 'Asst/ Deputy Manager - Finance & Accounts', 'Job Purpose<?xmlnamespace prefix = \"\"o\"\" />\r\nTo manage financial accounting, MIS and legal compliance for the branch.\r\nRecovery of payment on time\r\nManaging account reconciliation and compliance– separated geographically, dealing with local citizens in the function\r\nSOP Compliances\r\nJob Context & Major Challenges', 'Renewal of licenses, Physical inventory management, Contract management', '6774492993', 1, 'SUMMER 2019', 0, '2018-12-05 03:56:10', '2018-12-05 03:56:10'),
(19, 21, 'Security monitoring system for enterprise VPN service', '• Tham gia xây dựng giải pháp, triển khai và chuyển giao giải pháp giám sát an toàn/an ninh mạng\r\n• Tìm hiểu, xây dựng và triển khai giải pháp Security chuyên sâu về giám sát, phân tích dữ liệu, thông tin an toàn an ninh với, phân tích như Firewall/IDS, SIEM, IPS\r\n• Tích hợp hệ thống (SI) với các sản phẩm Security thương mại như Firewall, Application Firewall, các thiết bị Access control….\r\n', 'Firewall,IDS,VPN,Monitoring,Cloud,Networking', '1888466789', 1, 'SPRING 2019', 0, '2018-12-05 03:56:45', '2018-12-05 03:56:45'),
(20, 22, 'FPTU Multifunction Card - Security Threats and Countermeasures', '• Kiểm tra, đánh giá kịp thời các lỗi bảo mật cho các ứng dụng, hệ thống CNTT và đề xuất, tham vấn các biện pháp xử lý, khắc phục;\r\n• Tư vấn, xây dựng và cập nhật các chính sách, quy định, quy trình về an toàn thông tin;\r\n• Nghiên cứu, cập nhật công nghệ, kỹ thuật, cũng như các giải pháp đảm bảo an toàn, bảo mật cho các hệ thống;\r\n', 'MCSA, MCSE, CEH,Firewall, IPS, IDS,\r\nCloud computing, Data center Model\r\n', '1698898242', 1, 'SUMMER 2019', 0, '2018-12-05 03:56:45', '2018-12-05 03:56:45'),
(21, 23, 'Web Security Scanner', '- Xây dựng các hệ thống Web Server, DB Server, Media Server, Cloud, CDN\r\n- Xây dựng và triển khai các công cụ vận hành hệ thống;\r\n- Theo dõi, phân tích, cảnh báo và xử lý sự cố phức tạp hệ thống;\r\n- Viết tài liệu về việc triển khai và bảo trì hệ thống;\r\n\r\n', 'Python, Perl, Ganglia, Nagios, Cacti, TCP/IP', '4431759247', 1, 'FALL 2018', 0, '2018-12-05 03:56:45', '2018-12-05 03:56:45'),
(22, 24, ' BIG DATA APPLICATIONS IN INFORMATION SERCURITY', '- Thực hiện việc đánh giá hệ thống CNTT đang có, đề xuất các phương án thay đổi phù hợp với nhu cầu, phù hợp với tình hình của Công ty đảm bảo vận hành ổn định, an toàn.\r\n- Đảm bảo thực thi và tuân thủ về an toàn an ninh thông tin hệ thống , hướng dẫn người dùng bảo vệ thông tin trước các tấn công, phần mềm độc hại\r\n- Tham gia triển khai các giải pháp công nghệ mới, chương trình/ dự án CNTT theo kế hoạch phát triển của Công ty\r\n', 'CCNA Voice/ Asterisk (dCAP),\r\nCisco, Avaya, Asterisk, GSM\r\n', '2032724175', 1, 'FALL 2018', 0, '2018-12-05 03:56:45', '2018-12-05 03:56:45'),
(23, 25, 'Research And Development Of Central Management System Solutions', 'Hệ thống bao gồm:\r\n- Máy chủ, máy trạm, thiết bị mạng, camera, máy in , tổng đài ....\r\n- Quản trị các hệ điều hành mạng Windows server/Linux\r\n- Xử lý các lỗi phần mềm ứng dụng (MS office, Office365, Google Apps) , hệ thống email, Internet\r\n', 'Firewall, IPS, IDS,\r\nCloud computing,\r\n', '7946096822', 1, 'FALL 2018', 0, '2018-12-05 03:56:45', '2018-12-05 03:56:45'),
(24, 26, 'Malware incident prevention and handing solutions', '•General Desktop Support and Maintenance of all company equipment.\r\n• Maintenance and monitoring of internal CCTV systems as required by ISO requirements.\r\n• Monitor and maintain all software licenses ensuring compliance\r\n• Buying and set-up of all IT related items.\r\n• Maintain phone system for the company.\r\n• Maintenance and support of employee time clock system.\r\n• Monitor and maintain Remote Desktop Access with foreign offices.\r\n', 'SQL, Avaya, Asterisk, GSM', '2569508160', 1, 'SUMMER 2019', 0, '2018-12-05 03:56:46', '2018-12-05 03:56:46'),
(25, 27, 'Solution for DoS Attack Detection', '• Tham gia cài đặt và quản trị máy chủ: tên miền, web, email, cơ sở dữ liệu, lưu trữ của Công ty\r\n• Sử dụng hiệu quả các nguồn lực CNTT như: Máy chủ, máy tính cá nhân, thiết bị mạng, máy in, camera,…\r\n• Tham gia xây dựng các chính sách và quy định về sử dụng hệ thống thông tin.\r\n• Xây dựng chính sách bảo mật.\r\n', 'IT, Networking, MySQL', '0391709479', 1, 'SPRING 2019', 0, '2018-12-05 03:56:46', '2018-12-05 03:56:46'),
(26, 28, 'System Monitoring and Protecting based on centralized Logs', '- Hỗ trợ bộ phận nghiệp vụ phân tích, viết tài liệu mô tả quy trình nghiệp vụ (Tài chính, mua hàng, bán hàng, kho, sản xuất, nhân sự tiền lương,...)\r\n- Theo dõi chất lượng, tiến độ triển khai dự án trong phạm vi được phân công;\r\n- Tiếp nhận và vận hành quy trình xử lý trên hệ thống ERP để hỗ trợ các bộ phận phòng ban sử dụng hệ thống ERP;\r\n', 'Cisco, Asterisk, MyPBX, Granstream, GSM', '9571698034', 1, 'SPRING 2019', 0, '2018-12-05 03:56:46', '2018-12-05 03:56:46'),
(27, 29, '私は先週の土曜日', 'アンさんの家族は4人がいます。アンさんとアンさんのだんなさん、子供２人がいます。私はアンさんのうちに行ったとき、アンさんとご家族は駅へ迎えに行ってもらいました。その時、とても喜びました。\r\n\r\nアンさんのうちで、ベトナム料理を一緒に作って、食べました。とてもおいしかったです。ご飯を終わってから、色々なベトナムのことについて話しました。その後、アンさんの子供と一緒にゲームをしたり、歌を歌ったりしました。とても楽しかったです。', '日曜日に私,達はえきの近くに,行きまし,た。駅の', '7741337993', 1, 'SUMMER 2019', 0, '2018-12-05 03:56:46', '2018-12-05 03:56:46'),
(28, 30, '去年の誕生日に友子さんと渋谷のレス', 'その後、アンさんの家族と別れて、うちに帰りました。帰る時、アンさんからたくさんおいしいベトナム料理をもらいました。', '週末に友達,のうちへ,遊びに行く,ととて', '1507934772', 1, 'SUMMER 2019', 0, '2018-12-05 03:56:46', '2018-12-05 03:56:46'),
(29, 31, '店の人たちが来て', 'トランへ食事に行きました。静かにとてもきれいなところでした。\r\n\r\nレストランでご飯を食べて、ジュースを飲んでいる時', '誕生日,の歌を歌っ,てくれまし,た。私は少しび,っくりしま', '9120654492', 1, 'SPRING 2019', 0, '2018-12-05 03:56:46', '2018-12-05 03:56:46'),
(30, 32, '箱を開ける', 'と、ぬいぐるみでした。わたしは「わあ、かわいい。どうもありがとう', 'と言いま,した。本当に,うれしかったです。', '4077457514', 1, 'SPRING 2019', 0, '2018-12-05 03:56:47', '2018-12-05 03:56:47'),
(31, 33, 'ヤナーゴ゚ッアの『オンフ゜ニ゛ッ', 'ゲアオーのラカゝは、FM 放送のアラオッア音楽番組を流していた。曲はヤナーゴ゚ッ\r\nアの『オンフ゜ニ゛ッゲ』。渋滞に巻き込まれたゲアオーの中で聴くのにうってつけの音\r\n楽とは言えないはずだ。運転手もとくに熱心にその音楽に耳を澄ませているようには見え\r\nなかった。中年の運転手は、まるで舳先{へさき}に立って不吉な潮目を読む老練な漁師の\r\nように、前方に途切れなく並んだ車の列を、ただ', '豆は一九,二六年のゴ゚', '4162038480', 1, 'FALL 2018', 0, '2018-12-05 03:56:47', '2018-12-05 03:56:47'),
(32, 34, '」の中間くらいではあるまいか', 'ヤナーゴ゚ッアは一九二六年にその小振りなオンフ゜ニーを作曲した。冒頭のテーマは\r\nそもそも、あるガポーツ大会のためのフゔンフゔーレとして作られたものだ。青豆は一九\r\n二六年のゴ゚ウ?ガロバ゠ゕを想像した。第一次大戦が終結し、長く続いたハプガブルア\r\n家の支配からようやく解放され、人々はゞプでピルクン?ビールを飲み、アールでリゕ\r\nルな機関銃を製造し、中部ヨーロッパに訪れた', '束の間の,平和を,味わって,いた。フ,ランツ?\r\n', '7585562378', 1, 'FALL 2018', 0, '2018-12-05 03:56:47', '2018-12-05 03:56:47'),
(33, 35, 'は音楽を聴きな', 'ら、ボヘミゕの平原を渡るのびやかな風を想像し、歴史のあ\r\nり方について思いをめぐらせた。\r\n一九二六年には大正天皇が崩御し、年号が昭和に変わった。日本でも暗い嫌な時代がそ\r\nろそろ始まろうとしていた。モコニキムとデモアラオーの短い間奏曲が終わり、フゔオキ\r\nムが幅をきかせるようになる。\r\n歴史はガポーツとならんで、青豆が愛好するもののひとつだった。小説を読むことはあ\r\nまりないが、歴史に関連した書物ならいくらでも読めた。歴史に', 'いるの,は、す,べての', '1928338760', 1, 'FALL 2018', 0, '2018-12-05 03:56:47', '2018-12-05 03:56:47'),
(34, 36, '事実が基本的に特定', 'かんでしまえば、年号は自動的に浮\r\nかび上がってくる。中学と高校では、青豆は歴史の試験では常に', '聴き,ながら、ボヘミ,ゕの平原を渡,るのびや\r\n', '2885302409', 1, 'SPRING 2019', 0, '2018-12-05 03:56:47', '2018-12-05 03:56:47'),
(35, 37, 'FinTech Marketing Lead - Innovation & Cloud Platforms', 'Morgan McKinley are working in partnership with a Global FinTech who are seeking a FinTech Marketing Manager to be responsible for the marketing strategy behind their new cloud platform.\r\n\r\nYou will take full ownership for the marketing strategy around the developer community, working in partnership with Regional Marketing leads, Product, Sales and Sales Enablement functions to execute.', 'Owning the strategy ,Creation of collateral, assets using a range of techniques\r\n', '1894999053', 1, 'SPRING 2019', 0, '2018-12-05 03:56:47', '2018-12-05 03:56:47'),
(36, 38, 'Senior Marketing Executive', 'Senior Marketing Executive needed for a well-established award-winning media company based in West Sussex who are looking to employ an experienced Senior Marketing Executive with an in-depth knowledge of Marketing and Delivery\r\n\r\nThe successful Senior Marketing Executive will want to work for this client not just because it\'s a great opportunity but also because they will give you a completive salary and an added bonus', 'Create and manage event websites ,Create and deliver targeted email marketing campaigns ,Create and deliver social media marketing plans, LinkedIn ,Facebook, Instagram', '5787427678', 1, 'SUMMER 2019', 0, '2018-12-05 03:56:47', '2018-12-05 03:56:47'),
(37, 39, 'Assistant Marketing Manager', 'This global B2B organisation are looking for an Assistant Marketing Manager to join their team based in West Birmingham.\r\n\r\nReporting into the Marketing Manager you will support in planning, implementing and coordinating a range of marketing and communications activities to complement the global communications strategy.', 'Marketing Manager, produce annual', '5609260519', 1, 'FALL 2018', 0, '2018-12-05 03:56:47', '2018-12-05 03:56:47'),
(38, 40, 'Assistant Product Marketing Manager - Interim', 'Our client has an opportunity for an experienced Assistant Product Marketing Manager to join the team based in Northwich. You will join us on a full time basis as part of a 6 month fixed term contract and in return will receive a competitive day rate until April 2019 with possible extension beyond this date.\r\n\r\nOur client is the global leader in water, hygiene, and energy technologies and services. They are a progressive and growing business and their brands are focused on providing clean water, safe food, abundant energy and healthy environments in a changing world Businesses in foodservice, food processing, hospitality, healthcare, industrial, and oil & gas markets choose products and services to keep their environment clean and safe, to operate efficiently and achieve sustainability goals.\r\n\r\nAs our Assistant Product Marketing Manager you will provide analysis and insights that enable effective decision making by manager and the leadership team, in fulfilment of the short- and medium-term action plans for the product portfolio.', 'SKUs, Build and maintain relationships', '7528936562', 1, 'SUMMER 2019', 0, '2018-12-05 03:56:47', '2018-12-05 03:56:47'),
(39, 41, 'Events & Marketing Manager', 'Our client is a global professional services business, looking for a talented marketing and events specialist to own the development and delivery of European campus attraction events.\r\n\r\nThey are looking for a creative thinker with a passion for organising top level events globally.\r\n\r\nIf you are a hard worker, looking for the opportunity to take your career to the next level this could be the perfect role for you.', 'Experience managing high profile corporate events ,Excellent understanding of event promotion, PR and Campus,Strong project management, organisation and communications skills\r\n', '1493512101', 1, 'SPRING 2019', 0, '2018-12-05 03:57:43', '2018-12-05 03:57:43'),
(40, 42, 'Salesforce Marketing Cloud Practice Lead', 'You have a great opportunity to join a rapidly growing business as their new Salesforce Marketing Cloud Practice Lead.\r\n\r\nThey need a Practice Lead to lead a small team of SFMC specialists in the design, development, implementation and testing of their SFMC solutions.', ' Adobe, Salesforce & IBM,,Adobe AEM, Adobe Target, Adobe/Google Analytics, Salesforce Sales & Service cloud, DMP solutions\r\n', '8135182650', 1, 'SPRING 2019', 0, '2018-12-05 03:57:43', '2018-12-05 03:57:43'),
(41, 43, 'Assistant Marketing Manager, Boots Advantage Card - Boots UK', 'Boots is the UKs leading pharmacy-led health and beauty retailer. With over 2500 stores in the UK our purpose is to help our customers look and feel better than they ever thought possible. Boots UK is part of the Retail Pharmacy International Division of Walgreens Boots Alliance, Inc, the first global pharmacy-led health and wellbeing enterprise.\r\n', '*Deliver Advantage Card , Boots App, delivering the marketing plan ', '', 1, 'SPRING 2019', 0, '2018-12-05 03:57:43', '2018-12-05 03:57:43'),
(42, 44, 'Insights and Product Marketing Executive', 'The Vax, Dirt Devil and Oreck brands fall under the floorcare division of TTI.\r\n\r\nVax is the number one, bestselling floor care brand in th UK. With a rich heritage and growing global position, it is a market leader in floor care innovation.\r\n\r\nWith turnover more than $5 billion, TTI is a world-class leader in design, manufacturing and marketing of Power Tools, Outdoor Power Equipment, and Floor Care and Appliances for consumers, professional and industrial users in the home improvement, repair and construction industries. Our unrelenting strategic focus on Powerful Brands, innovative Products, Operational Excellence and Exceptional People drives our culture.\r\n\r\nVax has forged its reputation as a brand that focuses on the needs of its customers, with premium products that include the lightest and the most powerful multi-cyclonic vacuum cleaners in the world. The company manages a portfolio of other brands, extending its influence over a wide consumer value proposition and into the public and private business sectors.', 'Product Management team,Interek', '', 1, 'FALL 2018', 0, '2018-12-05 03:57:43', '2018-12-05 03:57:43'),
(43, 45, 'Marketing Campaign Executive', 'As the Marketing Campaign Executive, you will be given immediate responsibility from the start by forming the bridge between the marketing team and the business through development of campaigns. This is an interesting and varied role for an ambitious candidate who is keen to travel the UK working on campaigns.', 'Initially supporting ,Supporting campaigns , organising events, filming video content, launching email campaigns\r\n', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:57:43', '2018-12-05 03:57:43'),
(44, 46, 'I Will Be Your Social Media Manager,Social Media Marketing', ' Working together your business presence online will get:\r\n\r\ncreation of catchy posts with your images -products ( choose you which one would you like to promote) - branded business logo and clients website will be included \r\nCaptions/Description per each post to attract the audience.\r\nSearch and usage of trending hashtags -to reach more audiences - your business page will be appear on the search of the the ones looking with a specific hashtag \r\nPost scheduling at the best time- to reach a bigger audience \r\n Increased engagement.\r\nIncrease your Brand awareness\r\nMore followers (organically) + BONUS \r\nDrive traffic to your website or e-shop', 'Facebook ,Instagram ,Twitter ,Linkedin ,Pinterest ,Google+ ', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:57:43', '2018-12-05 03:57:43'),
(45, 47, 'Bobbi Brown Creative Marketing Assistant', 'The role will give the successful candidate exceptional experience in Creative Marketing, implementing strong, dynamic and engaging consumer activations as well as ensuring consistent image guidelines are achieved across media.\r\n\r\nReporting into the Assistant VM & Events Manager, we are looking for a dynamic and driven candidate able to demonstrate knowledge and understanding of Creative, Events and Visual Merchandising processes, good understating of Adobe Creative Suite (especially In-Design, Photoshop and Illustrator) with a desire to develop in this area. They must be able to follow Global Brand Guidelines whilst possessing creative flair and the agility to thrive in a fast-paced environment.\r\n\r\nThis role will give the candidate excellent experience to be able to progress into Content Production and Event production roles, whilst gaining sound beauty Marketing experience.', 'Checking consistency across creative layouts,Quoting for print and reviewing printing methods,Overseeing the distribution of collateral to stores,Ensuring stores receive collateral and are correctly briefed on usage\r\n\r\n\r\n', '', 1, 'FALL 2018', 0, '2018-12-05 03:57:44', '2018-12-05 03:57:44'),
(46, 48, 'Resourcing Assistant - Digital, Marketing & Creative', 'Operating at the heart of our business, Shared Services offer efficiencies to all of our Brands by providing centralised resources and competitive synergies for the Group. The Shared Services Teams work across all Brands and are responsible for a huge range of activities from delivering product to over 40 countries worldwide, to achieving award winning store designs and handling 100,000 Customer Care calls each year. Within Shared Services there are over 1,000 employees working across 16 distinctive departments including International, IT, Finance, HR, Logistics, PR, Property, Digital and Sourcing.', 'Sourcing, screening and shortlisting candidate applications assessing suitability for Digital, Marketing and Creative roles across all Arcadia Brands', '', 1, 'FALL 2018', 0, '2018-12-05 03:57:44', '2018-12-05 03:57:44'),
(47, 49, 'Marketing and Communications Assistant', 'This job is only available to University of Bradford staff. It may be released externally should we not appoint internally.\r\n\r\nThe Marketing and Communications Assistant is responsible for providing operational support to the Marketing Communications team. Working as part of this team you will be well organised to support on multiple projects.\r\n\r\nThis role offers a wide variety of experiences - on a day-to-day basis; you will be supporting setting up events, using internal systems to issue the University staff briefing, support with media relations and provide ongoing support to the Student Marketing Manager. You will be heavily involved in the University\'s on-campus events, and will act as an ambassador for excellence in customer service.', 'Analytics – Google Analytics,Adwords – Google Adwords', '', 1, 'SPRING 2019', 0, '2018-12-05 03:57:44', '2018-12-05 03:57:44'),
(48, 50, 'School Leaver & Graduate: Marketing Assistant Trainee', 'As part of the small friendly content team (and reporting to Content & Marketing Manager), you will be creating online content using our in-house CMS, including image selection, destination information and overall user experience.\r\n\r\nPartnering with some of the world\'s best hotel brands & airlines, you will inspire our members through high-quality editorial, photography & videos.\r\n\r\nThis role requires a real passion for travel and writing – someone who is really creative and able to transport the reader, telling stories with the right combination of beautiful imagery and words.\r\n\r\nWe require meticulous attention to detail – grammar and spelling must be faultless!\r\n\r\nYou must also be comfortable with your work being edited – although we encourage creative flair, you must be open to suggestions and improvements!\r\n\r\nInsider knowledge is really valuable to us, so if you have travelled a lot that is a great advantage!\r\n\r\nAs well as writing content you will have the opportunity to get involved in the weekly newsletters, social media campaigns, and special merchandising projects.', 'PRINCE2, Agile,Data manipulation, exploration, analysis and data integrity', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:57:44', '2018-12-05 03:57:44'),
(49, 51, 'Media & Communications Officer: The Scottish FA', 'Reporting to Head of Marketing and Communications.\r\n\r\nOverall purpose of Job Responsible for bringing to life the key areas of the Scottish FA’s strategic plan to multiple internal and external stakeholders, via proactive and engaging communications and media strategies.\r\n\r\nIf you wish to apply please go to the Vacancies page at the Scottish FA website.\r\n\r\nPlease be aware that CVs will not be accepted.', ' SSL – Secure Socket Layer ,SERP,Pop Up Ad', '', 1, 'FALL 2018', 0, '2018-12-05 03:57:44', '2018-12-05 03:57:44'),
(50, 52, 'Pharmacy Finder', 'In fact, when patients seek medical advice and treatment in hospital, they and doctors often have trouble finding the pharmacies that sell the medicines they need. Patients must also buy medicines at the hospital, they always want to find the nearest pharmacy, or reputable pharmacy to buy medicine. The doctor after medical treatment is difficult to help patients find pharmacies that sell prescription which they know. There are many systems help patient finding hospitals and pharmacies but most of them have several weaknesses', 'PHP,C++,HTML, CSS, JS,JAVA,Android,NodeJS,Swift', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:57:44', '2018-12-05 03:57:44'),
(51, 53, 'Cinema Schedule Management', 'The Cinema Schedule Managementis build up for dealing with the problem of managing film, schedule, ticket, income … of cinema. And it is advertising channel, introduces cinema to customer.The idea of CSM project is develop a new product contains 2 main modules: website and mobile application support booking ticket', 'Ruby,JAVA,Swift,C#,Python,Scala,TypeScript', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:57:44', '2018-12-05 03:57:44'),
(52, 54, 'NFC Library', 'NFC (Near Field Communication) is a new short ranged wireless technology. It’s based on the current RFID (Radio-Frequency Identification) technology with many better characteristics. NFC is a future proof and promising technology. We want to apply NFC to some field that’s practical and capable of taking NFC potential to its fullest. Library seems to be an appropriate choice. What we need is a more efficient one, which requires less effort and saves time', 'Shell ,PHP,JAVA,Scala,Ruby,NodeJS,C++', '', 1, 'FALL 2018', 0, '2018-12-05 03:57:45', '2018-12-05 03:57:45'),
(53, 55, 'Sale and Inventory Management System', 'Management systems are used popular in many small and big companies. It helps people save effort and time on management. There are many management systems were built and organizations can choose a suitable systems for their work. However, those systems still have many limitations and not satisfy demand of customer. We build sale and inventory management systems is suitable with spesific features and damand of the Vetvaco Company. Moreover, our systems is not only satisfy tada, check employees in/out, export report,... in accounting module. The combination of management systems and the processing systems, help customer save effort and time on training employees to use the systems. Instead of spending time and effort on training for two systems, now, when Vetvaco use our system, they just spend time and effort on training for only one system.', 'JAVA,Android,HTML, CSS, JS,PHP,C++,Swift,NodeJS', '', 1, 'SPRING 2019', 0, '2018-12-05 03:57:45', '2018-12-05 03:57:45'),
(54, 56, 'Direction hunter', 'This capstone project build an application that emphasize bringing a comfortable and friendly, while most efficiency for users, with the principle : simple and elegance in design but effective in functions. This application will bring about : The ability to collect, update, ranking and return sharp data ( millions users never wrong), the ability to search best places with easy, efficiency and less waiting time, the most useful function to tracking group member waypoints and manage a schedule. This application with becoming a Hunter that millions users will rely on whenever he asks himself \" where to go next and How to go there?', 'PHP,Android,Scala,NodeJS,Python,C++,C#', '', 1, 'SPRING 2019', 0, '2018-12-05 03:57:45', '2018-12-05 03:57:45'),
(55, 57, 'Homestay booking system', 'Develop a web application about homestay services in Vietnam to help Guest and Host families can find together', 'C#,Swift,C++,Python,Android,TypeScript,Shell ', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:57:45', '2018-12-05 03:57:45'),
(56, 58, 'E-Quaria', 'An owner of an aquaria store wants to make his business more popular with different kinds of customers. He also wants to make the culture of raising fishes and decorating aquariums become more accessible, and the information about this culture can be easily shared among members of the group. The objective of this project is to create a website that possesses two main functions: - An online shopping website, which can help the customer easily order the products. - A small online forum where users can share their knowledge about different subjects related to aquaria.', 'Android,Scala,C#,JAVA,TypeScript,C++,Ruby', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:57:45', '2018-12-05 03:57:45'),
(57, 59, 'YOFOTO E-COMMERCE WEBSITE', 'The system will be website.The system will provide the following main features. Anyone can visit the site and search for products of any kinds. Authenticated users can involve in the rating system to evaluate products. The rating system includes rating, review, comments, visiting...Authorized users can edit tha information of them to make it more correc. The system can integrate well with some other popular networks. The back end will allow the administrators to manage the most important activities as well as infomation on the site', 'PHP,C++,C#,Ruby,Python,Android,JAVA', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:57:45', '2018-12-05 03:57:45'),
(58, 60, 'Where should we go', 'With this app, users can search for locations in accordance with their criteria easier. In addition to locations searching, users can make question about locations for getting answers from other users', 'HTML, CSS, JS,C++,Android,Go,NodeJS,JAVA,Ruby', '', 1, 'FALL 2018', 0, '2018-12-05 03:57:45', '2018-12-05 03:57:45'),
(59, 61, 'Software for parking management using RFID technology and camera', 'Along with the development of information technology in areas such as: science, industry, agriculture, the application of information technology in daily life is becoming more and more popular, it helps reduce effort, increase efficiency and safety. In Vietnam, along with the rapid increase in population associated with high traffic density, vehicle management also becomes more difficult, parking becomes more difficult to control and unsafe. For that reason SPM-RFID software v1.0 our management will contribute to solving the parking more easily', 'Scala,Python,C#,Shell ,HTML, CSS, JS,TypeScript,C++', '', 1, 'FALL 2018', 0, '2018-12-05 03:58:18', '2018-12-05 03:58:18'),
(60, 62, 'Gift Card Market Place', 'Lately, gift card has becoming more popular in many ways of business as well as in daily life. In other countries, websites that allow user to exchange, buy or sell their gift cards gradually appeared and became an important part of common business. Unfortunately, this potential market is not yet explored in Vietnam. It is hard to buy, sell or exchange gift cards and trading via social network or E commerce forums can’t guarantee full benefits of users: hard to follow the card’s information or seller/buyer or searc h for needed gift cards.', 'NodeJS,Python,C#,JAVA,TypeScript,Scala,Ruby', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:18', '2018-12-05 03:58:18'),
(61, 63, 'The Dating Online Site', 'This project is a website helps users find the best of love for them. The product is the perfect combination between social networks and life. You can share information about themselves and their interested, the basic criteria for a partner that you want. So, rapid access and realize the relationship to love, get merried and happy', 'NodeJS,Scala,Python,Swift,PHP,JAVA,Ruby', '', 1, 'FALL 2018', 0, '2018-12-05 03:58:18', '2018-12-05 03:58:18'),
(62, 64, 'Online Document Management System', 'This project is registered and implemented as the capstone project for the team members. The first purpose is to fulfill the requirements from FPT University studying program. The second purpose is to create a complete product for going live', 'Swift,JAVA,Android,Shell ,NodeJS,PHP,TypeScript', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:18', '2018-12-05 03:58:18'),
(63, 65, 'Experts management system', ' The aim of this project is designed a system like a portal connecting people together, between recruitment in company and job seeker. Enterprise has chances to find candidates easily and professional and job seeker can find suitable job for themselves.', 'Go,C#,Swift,JAVA,Scala,Shell ,C++', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:18', '2018-12-05 03:58:18'),
(64, 66, 'Event Map', 'The main product of this project is a location base web application. Users will use the website to search event, create event, interactive with other users. Besides, user also bookmarks, share, like, comment and so on', 'Android,NodeJS,Shell ,Swift,Scala,JAVA,Go', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:18', '2018-12-05 03:58:18'),
(65, 67, 'Drawing objects recognition on mobile', 'In the drawing objects recognition on mobile project, we will make an application that can recognize the users drawing objects on smart phone android. The application will support the users to draw diagrams or write document. The application can automatically recognize drawing objects as lines, basic shapes (circle, square, rectangle, ect.) that the users draw and then editing them perfect and accurate. Moreover, recognizing people and animals images is a noticeable function of this application. It is the premise that helps us to develop games or animation applications in the future. Another function of the program is to support the users to create their own models for themselves and use these models to edit the drawing afterwards', 'TypeScript,NodeJS,Swift,C++,Android,PHP,Ruby', '', 1, 'FALL 2018', 0, '2018-12-05 03:58:18', '2018-12-05 03:58:18'),
(66, 68, 'Panoview', 'Virtual Reality technology has rapidly developed and become one of the best marketing tools for services such as: tourism and real estate.', 'Scala,Python,HTML, CSS, JS,JAVA,C#,Go,Shell ', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:18', '2018-12-05 03:58:18'),
(67, 69, 'Work track trace plug in out look', 'Provide users a function to control their task and even though assigned to the other one. The Outlook task is just kind of for one side users, the task receiver and task assigner seem to be in not in the same working environment because they do not know exactly the status or prolem that the task issues. Decided to use a simple common way for transfer information between email editors and make it implementable Work Track trace function in the future', 'Ruby,NodeJS,JAVA,Android,PHP,C#,Shell ', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:18', '2018-12-05 03:58:18'),
(68, 70, 'Hospital ERP Solution', 'The idea of our project is using the OpenERP system to develop a new ERP system that can be customized for hospital in Vietnam. The new system will contains some features of the OpenERP system like: accounting, human resource, purchasing... and some new features that using just for hospital business like: hospital fee management, drug warehouse management…', 'HTML, CSS, JS,Python,TypeScript,C++,Swift,Scala,Go', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:18', '2018-12-05 03:58:18'),
(69, 71, 'HUMAN RESOURCE ENTRY', ' Nowadays, there are many companies need Human Resource Management software as a part of ERP system. While the big companies can develop their own system, or buy an expensive package from famous ERP solution providers like SAP or Oracle, there are still many disadvantages. Develop an own ERP system costs much time, effort and resource while the risk of failure still exist if the development team is not experienced enough. In-house developed system like that is also having no way to reuse to other companies (because they not intended to do so). The remaining solution, buying from famous provider cost very much money that not every company can afford. Also, there are still many complex features that they don‟t need to use with their business, but still have to pay for. They just want lightweight software that provides what they need. Our target is to develop a fast, flexible, easy to use web-based Human Resource Management System that can meet every company‟s requirement at the reasonable price. At the starting stage, we aim to small and medium firms at Vietnam as main customer. Currently, the market for human resource solution inside Vietnam is not new, but not saturated. While there are some available solutions that existed, there is no market leader. In the next part, we will give an overview about existing solutions after analyzing.', 'Ruby,C++,Android,Go,Shell ,Python,PHP', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:19', '2018-12-05 03:58:19'),
(70, 72, 'Schools for Children', 'Nowadays, when the life grows, more and more people are interested in the quality of education and training. Especially, the pre-school is the first grade school in the national education system. Pre-school education is the initial environment that helps familiarize children with the outside, laying the foundation for the development of physical, intellectual, emotional, aesthetic and orienting shaping the children personality. Also, it promotes the learning and development of the next stage. Therefore parents always focus on finding the kindergartens that are consistent with their children and simultaneously suitable to their job as well as travel circumstances. With the number of kindergartens is increasing, finding schools for children is indeed quite difficult. Parents hardly find the kindergartens information from Google and those around them. However, sometimes information is not specific and unified that make the parents more troubled. Thus we are going to implementing a website to help parents find the schools for their children more easily and saving time. The website is a set of basic information about the kindergartens of all types as public, semi-public, people founded or international, along with special services and programs that are accompanied. In addition, parents also quickly find the appropriate school by information comparison function, rating and comments updating from members of the website about interested schools and receiving suggestion from the website via Google map application. Finding schools will be easier than ever. Besides, we also support to users the schools suggestion function. With some basic information, we will give schools appropriating to user’s expectation.', 'NodeJS,C#,TypeScript,Swift,Scala,JAVA,HTML, CSS, JS', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:19', '2018-12-05 03:58:19'),
(71, 73, 'Mobile Application Store', ' Mobile Application Store (MAS) is a website that is developed to help users download or upload applications for mobile devices. In addition, it is also a play ground that allows Vietnamese Mobile Application developers to show themselves or communicate with other people', 'PHP,Swift,Ruby,C++,NodeJS,HTML, CSS, JS,Go', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:58:19', '2018-12-05 03:58:19'),
(72, 74, 'Smart Medicine Dictionary ', 'The software has two versions for web and for mobile. With friendly interface, user can easily find out what they want without registration. Moreover, user can know more about the interaction between two kinds of medicine. It also displays the appropriate medicine that have similar uses with searched medicine. Therefore, user can reference to make the best choice for themselves. In addition, with pharmacy management function, our software can bring the best trustful pharmacy to users. It is also useful when users are staying at strange location and need to find out the rout to the nearest pharmacy', 'Scala,Android,Python,Shell ,JAVA,C#,TypeScript', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:19', '2018-12-05 03:58:19'),
(73, 75, 'Hotel Room Booking System', 'Hotel room booking system is a program to help customers make reservations. Also the program is the way to introduce and promote general information, type of services, pictures of rooms and amenities inside of the hotel to customers.', 'C++,Android,Scala,Swift,C#,Go,Shell ', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:58:20', '2018-12-05 03:58:20');
INSERT INTO `wp_finder_form` (`ID`, `user_id`, `title`, `description`, `other_skill`, `contact`, `status`, `semester`, `special`, `updated_date`, `created_date`) VALUES
(74, 76, 'ONLINE DIGITAL CAMERA WEBSITE', 'Beginners want to buy a new camera lens always difficult to choose. Because nowadays camera lens have a lot of categories, from semi-pro cameras to professional cameras. To make the decision to buy a kind of lens in accordance with money or hobbies and components in accordance with lens that is a very difficult problem for people who do not have experience on camera lens. Nowadays, most of the website selling cameras are only show camera lens on webpage or store without sharing more about user experience and components for customers.', 'HTML, CSS, JS,Ruby,NodeJS,Python,TypeScript,PHP,JAVA', '', 1, 'FALL 2018', 0, '2018-12-05 03:58:20', '2018-12-05 03:58:20'),
(75, 77, 'Admission Office System', 'This project building and enhancing a specialized tool to support for Admission office of FPT University. That tool will bring about : the ability to manage data, ability to export document ( Exam notification, list of candidates profile...) ability to transfer data to another system of another office, ability to decentralize flexibility and ability to synthesize and analyze data - that making an important contribution in helping managers decide new strategy in marketing or training..', 'NodeJS,TypeScript,Scala,C#,PHP,HTML, CSS, JS,C++', '', 1, 'FALL 2018', 0, '2018-12-05 03:58:20', '2018-12-05 03:58:20'),
(76, 78, 'Finding and sharing house for lease', 'Nowadays, Ha Noi and Ho Chi Minh City are big cities in Viet Nam. There are a lot of universities in here, therefore students are living in Ha Noi and Ho Chi Minh City is very crowded. The need of finding and sharing house for lease is going very popular. Normally, people spend lots of time for asking friends or going to somewhere to find a suitable house for lease. Other people find a house by surfing some house for lease websites. But there are a lot of information’s in websites. The information is not only house for lease and not detailed so people must spend lots of time for searching suitable house. Sometime, you want to share your house, or introduce for someone about house for lease, but you do not know how to share house for lease. That is based of ideas to build web application of finding and sharing house for lease. Our website will help people to find and share house for lease easily and efficiently. We would like the website will connect between owner of the house and people who want to lease the house. When you need to lease a house, you will use our services of our website. It is very easily, quickly and comfortable with you', 'Go,JAVA,Python,Swift,Shell ,Ruby,Android', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:20', '2018-12-05 03:58:20'),
(77, 79, 'Security token and it use in a practical application', 'This project is developed for Android mobile phone branches. This platforms support most types of smart phone nowaday and are gradually winning domestic and international mobile phone market. An application for mobile devices that can be used to generate a key code - a password used to authenticate with the system - and make transactions. It can be used in place of the more common hardware token in banking, securities...providing ease-of-use method for the customer.', 'Swift,PHP,TypeScript,Shell ,Ruby,C++,Android', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:20', '2018-12-05 03:58:20'),
(78, 80, 'Funny contents sharing community', 'This project is registered and implemented as a capstone project for the team members. The first purpose is to fulfill the requirements from FPT University studying program. The second purpose is to creat a complete product for going live. Doing project from scratch to product will be a good change for all team members. Team members can learn new technologies, working in group, communication, and other soft skills', 'HTML, CSS, JS,NodeJS,JAVA,C#,Scala,Go,Python', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:20', '2018-12-05 03:58:20'),
(79, 81, 'World Language System', 'The purpose of this software requirement specification document is to describe the behaviors and functionalities of the World Language system. The World Language system is developed to: Help children learning English language, improving English skills such as: Listening, Speaking, Reading and Writing. Help teachers to create new lessons', 'Ruby,Scala,Swift,TypeScript,C#,PHP,Android', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:58:20', '2018-12-05 03:58:20'),
(80, 82, 'Midas project', 'Midas was launched as a website to manage information of your customers, to provide opportunity for small companies and dynamic traders to experience the convenience of CRM (Customer Relationship Management). Midas with the Vietnamese language, friendly interface - desires to show Vietnam enterprise community the importance ans usefulness of the application of CRM in their business activities.', 'JAVA,NodeJS,Go,Python,Shell ,HTML, CSS, JS,C++', '', 1, 'FALL 2018', 0, '2018-12-05 03:58:48', '2018-12-05 03:58:48'),
(81, 83, 'World data visualization', 'Introduce the basic idea of the new system being developed, what are the existing solutions, and why is it that we feel the need to create a new system even though a number of solutions already exists.', 'NodeJS,HTML, CSS, JS,Swift,TypeScript,Go,Shell ,C#', '', 1, 'FALL 2018', 0, '2018-12-05 03:58:48', '2018-12-05 03:58:48'),
(82, 84, 'E-Office', 'This project have been developing a system that focuses on domestic enterprises, giving them a solution allowing access to their desired functions easily, effectively and the most important element: an affordable cost.', 'C++,Python,Android,JAVA,Scala,PHP,Ruby', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:58:48', '2018-12-05 03:58:48'),
(83, 85, 'Group purchasing for FPT Corporation', 'This project aims to create an enterprise network which connects a large number of corporations, companies, manufactures, ect...in Vietnam to build up an effective and effective supply chain Alliance. All information form both buying and selling site is shared fairly and competitively to all Alliance members via a web-service platform. Suppliers will know properly current demand on their products. On vice versa, buyers also can select the best prices on their demand.', 'Shell ,HTML, CSS, JS,PHP,C++,Swift,Android,NodeJS', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:58:48', '2018-12-05 03:58:48'),
(84, 86, 'Japanese Self Study', 'An application to support Vietnamese people study Japanese with android smart phones, that help Vietnamese people learn Japanese easier and more convenient. The content of application can be changed and modify by a tool name Content Maker and user can update it from server', 'Ruby,C#,Go,TypeScript,Python,Scala,JAVA', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:48', '2018-12-05 03:58:48'),
(85, 87, 'Using felica card & apriori algorithm in restaurant management', 'Cung cấp thông tin về phần mềm quản lý dự án, các yêu cầu ký thuật cơ bản của phần mềm, và mô tả thiết kế cụ thể dựa trên 3 phần: phát triển hệ thống quản lý nhà hàng với tất cả các chức năng miền; sử dụng card như thẻ quản lý, áp dụng thuật toán Apriori để khai thác dữ liệu', 'Swift,Scala,HTML, CSS, JS,Python,JAVA,C#,Ruby', '', 1, 'FALL 2018', 0, '2018-12-05 03:58:48', '2018-12-05 03:58:48'),
(86, 88, 'V-creatures system', 'The idea behind V-creatures is a uniformed, easy to access place to acquire information (including its academic information, distribution, endangered levels, etc…) about any Vietnamese creatures, thus increasing the awareness of the people, showing them the importance of wildlife and the need of a helping hand. It will also be the place for questions or debate, making its data better and larger. This is one of the very first digital databases of Vietnamese creatures. The information provided can be used as base theoretical points for new protecting laws, researches, or adding a new one into the Red List', 'Go,NodeJS,Shell ,C++,TypeScript,Android,PHP', '', 1, 'FALL 2018', 0, '2018-12-05 03:58:48', '2018-12-05 03:58:48'),
(87, 89, 'FPT’s Customer Relationship Management', 'The main product of this project is a system on Salesforce platform using modern technology Cloud computing. Users will use the system to manage FPT’s customer relationships, create new campaigns, marketing, and sales. Besides, the system provides services: supports, manage invoices, and reports… It helps FPT Software company can keep customers and find the ways to get more customers, reduce cost and increase profit', 'Ruby,NodeJS,TypeScript,C#,JAVA,Python,Android', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:48', '2018-12-05 03:58:48'),
(88, 90, 'Gastronomy and tourism site', 'For the purpose of bringing searchers precise information, the website focuses on provinding and sharing information on tourism sites and gastronomy all across our country. Currently, in the internet in Vietnam, there are very few websites providing information on this field or only cursory and unclear information. Therefore, the build of a tourism sites and gastronomy sharing websites will help internet users search useful information related to tourism-gastronomy quickly and precisely. With the contribution of many internet users like a function of a social network, the amount of information becomes more various.', 'Shell ,Go,Swift,C++,PHP,Scala,HTML, CSS, JS', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:58:48', '2018-12-05 03:58:48'),
(89, 91, 'The reliable decoration and construction services', 'During make a drawing, you can’t see your idea clearly and hard to imagine with 2D drawing, moreover you will go through many processes and once fail, you may repeat that step till you all accept, or in the worst case: find another company. It is a waste of time and money', 'PHP,TypeScript,Python,Ruby,Swift,NodeJS,Android', '', 1, 'FALL 2018', 0, '2018-12-05 03:58:49', '2018-12-05 03:58:49'),
(90, 92, 'Fall Detecting Device', 'Device that uses an accelerometer to detect fall and send warning message via SMS. The device must have the vital advantages of small size, light-weighted, low cost. The monthly cost of FDD is also very cheap due to using very low price SMS', 'C#,Scala,JAVA,Go,Shell ,C++,HTML, CSS, JS', '', 1, 'FALL 2018', 0, '2018-12-05 03:58:49', '2018-12-05 03:58:49'),
(91, 93, 'Design and implement a running Led circuit', 'Recent developments in LEDs permit them to be used in environmental and task lighting. LEDs have many advantages over incandescent light sources including lower energy consumption, longer lifetime, improved physical rob ustness, smaller size, and faster switching.', 'Swift,Python,JAVA,HTML, CSS, JS,TypeScript,NodeJS,C#', '', 1, 'SPRING 2019', 0, '2018-12-05 03:58:49', '2018-12-05 03:58:49'),
(92, 94, 'LED CUBE REMOTE', 'LED had been used in human life for a long time in entertaining and advertising. The combination of hundreds of LED will make an excited message or effect. A single LED can only turn on and off, light and dark. But to controll turning on and off of many LED, we could have a running message, rain dropping, bubble or any visualization human could imagine. For example: LED was used to build a big screen, give more stage-effect for big out-door show; a huge attractive public advertisment in the street. Our project give a solution to controll a LED cube through smart phone. By a visual simple interface, using it would be very easy, even with a general user. It could be use for home or advertisement business.', 'Shell ,Go,Scala,C++,PHP,Ruby,Android', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:58:49', '2018-12-05 03:58:49'),
(93, 95, 'Online Debating', 'The main product of this project is a website. User can join a clean, strong connected debating community. Besides, user also can enjoy the debate with many excited plus features. Second product of this project is a mobility application for Android OS devices. This application supports viewing the site content in a fast and easy way', 'Ruby,Python,Android,Scala,Shell ,PHP,NodeJS', '', 1, 'SUMMER 2019', 0, '2018-12-05 03:58:49', '2018-12-05 03:58:49'),
(94, 96, 'PROJECT MANAGEMENT SYSTEM FOR ORBIS ORGANIZATION IN VIETNAM BASED ON SHAREPOINT', 'The purpose of this project is to build a SharePoint-based website that can contribute to computerize the process of project management. In detail, this website will be built to have the functions and tools that help to improve the working effectiveness and reduce efforts in: managing, controlling and tracking all the tasks of the project(add project, assign task, track process…), doing all the administrative works(document, reports, make charts…), searching and sharing information and document, communicating with colleagues and partners. In addition, this website need to have beautiful outlook, friendly interface, easy-to-use process, certain stability to serve the need of long-term use of ORBIS Vietnam.', 'TypeScript,C#,HTML, CSS, JS,Swift,Go,C++,JAVA', '', 1, 'FALL 2018', 0, '2018-12-05 03:58:49', '2018-12-05 03:58:49'),
(95, 97, 'Online Newspaper Content Management System', 'All of the online newspaper needs a Content Management System(CMS). We will build a content management system to simplify and modernize the business of online newspaper offices. Our CMS helps to create and edit content of an online newspaper easily and quickly. It even can help editorial director manage his staff includes editors, reporters or photographers.Special our system can check online everywhere by computer, laptop, even cell phone. Reporter can post report rapid and timely about hot news. Our system will bring the convenience of content management systemfor user.', 'Python,Swift,JAVA,PHP,Scala,TypeScript,NodeJS', '', 0, 'SPRING 2019', 0, '2018-12-06 03:24:15', '2018-12-05 03:58:49'),
(123, 105, 'dự án xây dựng thêm DOM FPT ', '<p>dự &aacute;n x&acirc;y dựng th&ecirc;m DOM FPT&nbsp;</p>', 'quản trị dự án , quản lí  cơ sở dữ liệu', NULL, 0, 'FALL 2018', 1, '2018-12-06 10:12:55', '2018-12-06 02:13:10'),
(124, 105, 'dự án hỗ trợ sinh viên làm đồ án tốt nghiệp cho sinh viên khóa 10A', '<p>Using solar energy to generate hydrogen or other fuels is an attractive way of storing electricity from renewables, thereby compensating for their inherent intermitent nature. It also adds flexibility, particularly in transport applications On the other hand, using solar energy to generate ammonia, instead of energy from fossil fuels, as in the strongly energy consuming and more than 100 years old Haber process, will contribute significantly to decrease CO2 emissions and our dependence on fossil fuels. With our project we aim at making advances in the efficient storage of solar energy in the form of chemical fuels. Our approach to developing new efficient systems is based on combining recent developments in photoelectrochemical conversion of solar energy at liquid-liquid interfaces, and on making further improvements through a novel and original architecture.&nbsp;<br /><br />Photocatalysis provides an attractive approach to store solar energy in the form of chemical fuels. Assembling the photocatalyst at the interface between two immiscible electrolyte solutions (ITIES) adds some advantages, like the absence of direct electrical wiring of the photocatalyst to a solid electrolyte, the possibility to separate electron and hole transfer to the corresponding collectors in different liquid phases, and the ability to control the photocatalytic activity via the Galvani potential difference between the two liquids. Z-scheme systems, which mimic nature by combining two photocatalysts and an electronic coupler allow for a theoretical maximum efficiency of 40%, as opposed to 30% when using a single photocatalyst, but the highest apparent quantum yields achieved to date do not exceed 6.8%.&nbsp;<br />&nbsp;</p>', 'joomla , java Spring Frame work', NULL, 1, 'FALL 2018', 0, '2018-12-06 16:43:52', '2018-12-06 02:58:39'),
(128, 105, 'dự án bảo mật thông tin của FSOFT', '<p>dự &aacute;n bảo mật th&ocirc;ng tin của FSOFT</p>', 'c# , java , ', NULL, 1, 'FALL 2018', 0, '2018-12-06 10:40:05', '2018-12-06 10:39:38'),
(132, 115, 'PHP Developer - Junior / Senior (Làm Việc Tại Hà Nội)', '<p>Tuyển số lượng 5 Developer<br /><br />C&ocirc;ng việc:<br /><br />- Triển khai c&aacute;c giải ph&aacute;p về th&ocirc;ng tin người d&ugrave;ng bằng việc thực hiện v&agrave; bảo tr&igrave; c&aacute;c th&agrave;nh phần (component) cũng như giao diện (interface) tr&ecirc;n nền tảng Java ;<br />- Tham gia v&agrave;o qu&aacute; tr&igrave;nh ph&acirc;n t&iacute;ch, thiết kế v&agrave; ph&aacute;t triển hệ thống;<br />- L&agrave;m thiết kế chi tiết v&agrave; viết c&aacute;c t&agrave;i liệu kỹ thuật khi được y&ecirc;u cầu;<br />- Code v&agrave; thực hiện Unit test theo t&agrave;i liệu thiết kế từ đội BA<br />- X&aacute;c định mục ti&ecirc;u th&ocirc;ng qua việc ph&acirc;n t&iacute;ch y&ecirc;u cầu người d&ugrave;ng, h&igrave;nh dung c&aacute;c t&iacute;nh năng v&agrave; chức n</p>', 'English skill , java SPRING  , ', NULL, 1, 'FALL 2018', 0, '2018-12-16 09:15:55', '2018-12-16 09:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `wp_form_skill`
--

CREATE TABLE `wp_form_skill` (
  `ID` bigint(20) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `skill_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_form_skill`
--

INSERT INTO `wp_form_skill` (`ID`, `form_id`, `skill_id`) VALUES
(1, 52, 3),
(2, 53, 3),
(3, 54, 4),
(4, 55, 2),
(5, 56, 3),
(6, 57, 3),
(7, 58, 3),
(8, 59, 1),
(9, 60, 1),
(10, 61, 1),
(11, 62, 4),
(12, 63, 2),
(13, 64, 2),
(14, 65, 3),
(15, 66, 1),
(16, 67, 2),
(17, 68, 3),
(18, 69, 4),
(19, 70, 3),
(20, 71, 4),
(21, 72, 3),
(22, 73, 1),
(23, 74, 3),
(24, 75, 4),
(25, 76, 2),
(26, 77, 3),
(27, 78, 3),
(28, 79, 4),
(29, 80, 2),
(30, 81, 2),
(31, 82, 3),
(32, 83, 3),
(33, 84, 2),
(34, 85, 2),
(35, 86, 4),
(36, 87, 3),
(37, 88, 4),
(38, 89, 3),
(39, 90, 3),
(40, 91, 2),
(41, 92, 4),
(42, 93, 2),
(43, 94, 4),
(44, 95, 4),
(46, 97, 2),
(47, 27, 6),
(48, 28, 5),
(49, 29, 8),
(50, 30, 5),
(51, 31, 8),
(52, 32, 8),
(53, 33, 5),
(54, 34, 6),
(64, 123, 3),
(65, 123, 1),
(68, 128, 3),
(72, 132, 1),
(73, 132, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wp_groups`
--

CREATE TABLE `wp_groups` (
  `ID` bigint(20) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_groups`
--

INSERT INTO `wp_groups` (`ID`, `form_id`, `type`, `created_date`) VALUES
(1, 1, 'Student', '2018-12-05 03:47:53'),
(2, 2, 'Student', '2018-12-05 03:47:53'),
(3, 3, 'Student', '2018-12-05 03:47:53'),
(4, 4, 'Student', '2018-12-05 03:47:53'),
(5, 5, 'Student', '2018-12-05 03:47:53'),
(6, 6, 'Student', '2018-12-05 03:47:53'),
(7, 7, 'Student', '2018-12-05 03:47:53'),
(8, 8, 'Student', '2018-12-05 03:47:53'),
(9, 9, 'Student', '2018-12-05 03:47:53'),
(10, 10, 'Student', '2018-12-05 03:47:53'),
(11, 11, 'Student', '2018-12-05 03:47:53'),
(12, 12, 'Student', '2018-12-05 03:47:53'),
(13, 13, 'Student', '2018-12-05 03:47:53'),
(14, 14, 'Student', '2018-12-05 03:47:53'),
(15, 15, 'Student', '2018-12-05 03:47:53'),
(16, 16, 'Student', '2018-12-05 03:47:53'),
(17, 17, 'Student', '2018-12-05 03:47:53'),
(18, 18, 'Student', '2018-12-05 03:47:53'),
(19, 19, 'Student', '2018-12-05 03:47:53'),
(20, 20, 'Student', '2018-12-05 03:47:53'),
(21, 21, 'Student', '2018-12-05 03:47:53'),
(22, 22, 'Student', '2018-12-05 03:47:53'),
(23, 23, 'Student', '2018-12-05 03:47:53'),
(24, 24, 'Student', '2018-12-05 03:47:53'),
(25, 25, 'Student', '2018-12-05 03:47:53'),
(26, 26, 'Student', '2018-12-05 03:47:53'),
(27, 27, 'Student', '2018-12-05 03:47:53'),
(28, 28, 'Student', '2018-12-05 03:47:53'),
(29, 29, 'Student', '2018-12-05 03:47:53'),
(30, 30, 'Student', '2018-12-05 03:47:53'),
(31, 31, 'Student', '2018-12-05 03:47:53'),
(32, 32, 'Student', '2018-12-05 03:47:53'),
(33, 33, 'Student', '2018-12-05 03:47:53'),
(34, 34, 'Student', '2018-12-05 03:47:53'),
(35, 35, 'Student', '2018-12-05 03:47:53'),
(36, 36, 'Student', '2018-12-05 03:47:53'),
(37, 37, 'Student', '2018-12-05 03:47:53'),
(38, 38, 'Student', '2018-12-05 03:47:53'),
(39, 39, 'Student', '2018-12-05 03:47:53'),
(40, 40, 'Student', '2018-12-05 03:47:53'),
(41, 41, 'Student', '2018-12-05 03:47:53'),
(42, 42, 'Student', '2018-12-05 03:47:53'),
(43, 43, 'Student', '2018-12-05 03:47:53'),
(44, 44, 'Student', '2018-12-05 03:47:53'),
(45, 45, 'Student', '2018-12-05 03:47:53'),
(46, 46, 'Student', '2018-12-05 03:47:53'),
(47, 47, 'Student', '2018-12-05 03:47:53'),
(48, 48, 'Student', '2018-12-05 03:47:53'),
(49, 49, 'Student', '2018-12-05 03:47:53'),
(50, 50, 'Student', '2018-12-05 03:47:53'),
(51, 51, 'Student', '2018-12-05 03:47:53'),
(52, 52, 'Student', '2018-12-05 03:47:53'),
(53, 53, 'Student', '2018-12-05 03:47:53'),
(54, 54, 'Student', '2018-12-05 03:47:53'),
(55, 55, 'Student', '2018-12-05 03:47:53'),
(56, 56, 'Student', '2018-12-05 03:47:53'),
(57, 57, 'Student', '2018-12-05 03:47:53'),
(58, 58, 'Student', '2018-12-05 03:47:53'),
(59, 59, 'Student', '2018-12-05 03:47:53'),
(60, 60, 'Student', '2018-12-05 03:47:53'),
(61, 61, 'Student', '2018-12-05 03:47:53'),
(62, 62, 'Student', '2018-12-05 03:47:53'),
(63, 63, 'Student', '2018-12-05 03:47:53'),
(64, 64, 'Student', '2018-12-05 03:47:53'),
(65, 65, 'Student', '2018-12-05 03:47:53'),
(66, 66, 'Student', '2018-12-05 03:47:53'),
(67, 67, 'Student', '2018-12-05 03:47:53'),
(68, 68, 'Student', '2018-12-05 03:47:53'),
(69, 69, 'Student', '2018-12-05 03:47:53'),
(70, 70, 'Student', '2018-12-05 03:47:53'),
(71, 71, 'Student', '2018-12-05 03:47:53'),
(72, 72, 'Student', '2018-12-05 03:47:53'),
(73, 73, 'Student', '2018-12-05 03:47:53'),
(74, 74, 'Student', '2018-12-05 03:47:53'),
(75, 75, 'Student', '2018-12-05 03:47:53'),
(76, 76, 'Student', '2018-12-05 03:47:53'),
(77, 77, 'Student', '2018-12-05 03:47:53'),
(78, 78, 'Student', '2018-12-05 03:47:53'),
(79, 79, 'Student', '2018-12-05 03:47:53'),
(80, 80, 'Student', '2018-12-05 03:47:53'),
(81, 81, 'Student', '2018-12-05 03:47:53'),
(82, 82, 'Student', '2018-12-05 03:47:53'),
(83, 83, 'Student', '2018-12-05 03:47:53'),
(84, 84, 'Student', '2018-12-05 03:47:53'),
(85, 85, 'Student', '2018-12-05 03:47:53'),
(86, 86, 'Student', '2018-12-05 03:47:53'),
(87, 87, 'Student', '2018-12-05 03:47:53'),
(88, 88, 'Student', '2018-12-05 03:47:53'),
(89, 89, 'Student', '2018-12-05 03:47:53'),
(90, 90, 'Student', '2018-12-05 03:47:53'),
(91, 91, 'Student', '2018-12-05 03:47:53'),
(92, 92, 'Student', '2018-12-05 03:47:53'),
(93, 93, 'Student', '2018-12-05 03:47:53'),
(94, 94, 'Student', '2018-12-05 03:47:53'),
(95, 95, 'Student', '2018-12-05 03:47:53'),
(97, 97, 'Student', '2018-12-05 03:47:53'),
(119, 123, 'Teacher', '2018-12-06 02:13:10'),
(120, 124, 'Teacher', '2018-12-06 02:58:39'),
(124, 128, 'Teacher', '2018-12-06 10:39:38'),
(131, 132, 'Student', '2018-12-16 09:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `wp_group_chat`
--

CREATE TABLE `wp_group_chat` (
  `ID` bigint(20) NOT NULL,
  `form_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_major`
--

CREATE TABLE `wp_major` (
  `ID` bigint(20) NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `url_image` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `size_image` int(11) NOT NULL,
  `image_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_major`
--

INSERT INTO `wp_major` (`ID`, `code`, `name`, `url_image`, `size_image`, `image_type`, `comment`, `status`, `date_created`) VALUES
(1, 'IS', 'Information System', 'http://miconshow.com/wp-content/plugins/manage-major/major_images/Information System_IS_1.jpeg', 0, '', '', 1, '2018-12-10 03:46:35'),
(2, 'JS', 'Japanese Software', 'http://miconshow.com/wp-content/plugins/manage-major/major_images/Japanese Software_JS_2.jpeg', 0, '', '', 1, '2018-12-10 03:46:45'),
(3, 'IA', 'Information Assurance', 'http://miconshow.com/wp-content/plugins/manage-major/major_images/Information Assurance_IA_3.jpeg', 0, 'jpeg', '', 0, '2018-12-04 22:00:25'),
(4, 'CS', 'Computer Science', 'http://miconshow.com/wp-content/plugins/manage-major/major_images/Computer Science_CS_4.jpeg', 0, 'jpeg', '', 0, '2018-12-04 22:00:57'),
(5, 'GD', 'Graphic Design', 'http://miconshow.com/wp-content/plugins/manage-major/major_images/Graphic Design_GD_5.jpeg', 0, 'jpeg', '', 0, '2018-12-04 21:46:33'),
(6, 'MKT', 'Marketing', 'http://miconshow.com/wp-content/plugins/manage-major/major_images/Marketing_MKT_6.jpeg', 0, 'jpeg', '', 0, '2018-12-04 21:51:59'),
(7, 'FIN', 'Finance', 'http://miconshow.com/wp-content/plugins/manage-major/major_images/Finance_FIN_7.jpeg', 0, 'jpeg', '', 0, '2018-12-04 21:48:59');

-- --------------------------------------------------------

--
-- Table structure for table `wp_members`
--

CREATE TABLE `wp_members` (
  `ID` bigint(20) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `member_role` int(1) NOT NULL,
  `joined_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_members`
--

INSERT INTO `wp_members` (`ID`, `form_id`, `member_id`, `member_role`, `joined_date`) VALUES
(1, 1, 3, 0, '2018-12-05 03:48:31'),
(2, 2, 4, 0, '2018-12-05 03:48:31'),
(3, 3, 5, 0, '2018-12-05 03:48:31'),
(4, 4, 6, 0, '2018-12-05 03:48:31'),
(5, 5, 7, 0, '2018-12-05 03:48:31'),
(6, 6, 8, 0, '2018-12-05 03:48:31'),
(7, 7, 9, 0, '2018-12-05 03:48:31'),
(8, 8, 10, 0, '2018-12-05 03:48:31'),
(9, 9, 11, 0, '2018-12-05 03:48:31'),
(10, 10, 12, 0, '2018-12-05 03:48:31'),
(11, 11, 13, 0, '2018-12-05 03:48:31'),
(12, 12, 14, 0, '2018-12-05 03:48:31'),
(13, 13, 15, 0, '2018-12-05 03:48:31'),
(14, 14, 16, 0, '2018-12-05 03:48:31'),
(15, 15, 17, 0, '2018-12-05 03:48:31'),
(16, 16, 18, 0, '2018-12-05 03:48:31'),
(17, 17, 19, 0, '2018-12-05 03:48:31'),
(18, 18, 20, 0, '2018-12-05 03:48:31'),
(19, 19, 21, 0, '2018-12-05 03:48:31'),
(20, 20, 22, 0, '2018-12-05 03:48:31'),
(21, 21, 23, 0, '2018-12-05 03:48:31'),
(22, 22, 24, 0, '2018-12-05 03:48:31'),
(23, 23, 25, 0, '2018-12-05 03:48:31'),
(24, 24, 26, 0, '2018-12-05 03:48:31'),
(25, 25, 27, 0, '2018-12-05 03:48:31'),
(26, 26, 28, 0, '2018-12-05 03:48:31'),
(27, 27, 29, 0, '2018-12-05 03:48:31'),
(28, 28, 30, 0, '2018-12-05 03:48:31'),
(29, 29, 31, 0, '2018-12-05 03:48:31'),
(30, 30, 32, 0, '2018-12-05 03:48:31'),
(31, 31, 33, 0, '2018-12-05 03:48:31'),
(32, 32, 34, 0, '2018-12-05 03:48:31'),
(33, 33, 35, 0, '2018-12-05 03:48:31'),
(34, 34, 36, 0, '2018-12-05 03:48:31'),
(35, 35, 37, 0, '2018-12-05 03:48:31'),
(36, 36, 38, 0, '2018-12-05 03:48:31'),
(37, 37, 39, 0, '2018-12-05 03:48:31'),
(38, 38, 40, 0, '2018-12-05 03:48:31'),
(39, 39, 41, 0, '2018-12-05 03:48:31'),
(40, 40, 42, 0, '2018-12-05 03:48:32'),
(41, 41, 43, 0, '2018-12-05 03:48:32'),
(42, 42, 44, 0, '2018-12-05 03:48:32'),
(43, 43, 45, 0, '2018-12-05 03:48:32'),
(44, 44, 46, 0, '2018-12-05 03:48:32'),
(45, 45, 47, 0, '2018-12-05 03:48:32'),
(46, 46, 48, 0, '2018-12-05 03:48:32'),
(47, 47, 49, 0, '2018-12-05 03:48:32'),
(48, 48, 50, 0, '2018-12-05 03:48:32'),
(49, 49, 51, 0, '2018-12-05 03:48:32'),
(50, 50, 52, 0, '2018-12-05 03:48:32'),
(51, 51, 53, 0, '2018-12-05 03:48:32'),
(52, 52, 54, 0, '2018-12-05 03:48:32'),
(53, 53, 55, 0, '2018-12-05 03:48:32'),
(54, 54, 56, 0, '2018-12-05 03:48:32'),
(55, 55, 57, 0, '2018-12-05 03:48:32'),
(56, 56, 58, 0, '2018-12-05 03:48:32'),
(57, 57, 59, 0, '2018-12-05 03:48:32'),
(58, 58, 60, 0, '2018-12-05 03:48:32'),
(59, 59, 61, 0, '2018-12-05 03:48:32'),
(60, 60, 62, 0, '2018-12-05 03:48:32'),
(61, 61, 63, 0, '2018-12-05 03:48:32'),
(62, 62, 64, 0, '2018-12-05 03:48:32'),
(63, 63, 65, 0, '2018-12-05 03:48:32'),
(64, 64, 66, 0, '2018-12-05 03:48:32'),
(65, 65, 67, 0, '2018-12-05 03:48:32'),
(66, 66, 68, 0, '2018-12-05 03:48:32'),
(67, 67, 69, 0, '2018-12-05 03:48:32'),
(68, 68, 70, 0, '2018-12-05 03:48:32'),
(69, 69, 71, 0, '2018-12-05 03:48:32'),
(70, 70, 72, 0, '2018-12-05 03:48:32'),
(71, 71, 73, 0, '2018-12-05 03:48:32'),
(72, 72, 74, 0, '2018-12-05 03:48:32'),
(73, 73, 75, 0, '2018-12-05 03:48:32'),
(74, 74, 76, 0, '2018-12-05 03:48:32'),
(75, 75, 77, 0, '2018-12-05 03:48:32'),
(76, 76, 78, 0, '2018-12-05 03:48:32'),
(77, 77, 79, 0, '2018-12-05 03:48:32'),
(78, 78, 80, 0, '2018-12-05 03:48:32'),
(79, 79, 81, 0, '2018-12-05 03:48:32'),
(80, 80, 82, 0, '2018-12-05 03:48:32'),
(81, 81, 83, 0, '2018-12-05 03:48:32'),
(82, 82, 84, 0, '2018-12-05 03:48:32'),
(83, 83, 85, 0, '2018-12-05 03:48:32'),
(84, 84, 86, 0, '2018-12-05 03:48:32'),
(85, 85, 87, 0, '2018-12-05 03:48:32'),
(86, 86, 88, 0, '2018-12-05 03:48:32'),
(87, 87, 89, 0, '2018-12-05 03:48:32'),
(88, 88, 90, 0, '2018-12-05 03:48:32'),
(89, 89, 91, 0, '2018-12-05 03:48:32'),
(90, 90, 92, 0, '2018-12-05 03:48:32'),
(91, 91, 93, 0, '2018-12-05 03:48:32'),
(92, 92, 94, 0, '2018-12-05 03:48:32'),
(93, 93, 95, 0, '2018-12-05 03:48:32'),
(94, 94, 96, 0, '2018-12-05 03:48:32'),
(95, 95, 97, 0, '2018-12-05 03:48:32'),
(117, 123, 105, 0, '2018-12-06 02:13:10'),
(118, 124, 105, 0, '2018-12-06 02:58:39'),
(122, 128, 105, 0, '2018-12-06 10:39:38'),
(126, 128, 115, 1, '2018-12-07 03:24:07'),
(128, 124, 115, 1, '2018-12-07 07:07:52'),
(135, 124, 116, 1, '2018-12-10 12:43:13'),
(142, 130, 105, 2, '2018-12-10 14:47:25'),
(144, 132, 115, 0, '2018-12-16 09:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/studentservice', 'yes'),
(2, 'home', 'http://localhost/studentservice', 'yes'),
(3, 'blogname', 'Graduation Project Finder', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'admin@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:197:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:37:\"portfolio/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"portfolio/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"portfolio/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"portfolio/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"portfolio/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"portfolio/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:26:\"portfolio/([^/]+)/embed/?$\";s:47:\"index.php?zozo_portfolio=$matches[1]&embed=true\";s:30:\"portfolio/([^/]+)/trackback/?$\";s:41:\"index.php?zozo_portfolio=$matches[1]&tb=1\";s:38:\"portfolio/([^/]+)/page/?([0-9]{1,})/?$\";s:54:\"index.php?zozo_portfolio=$matches[1]&paged=$matches[2]\";s:45:\"portfolio/([^/]+)/comment-page-([0-9]{1,})/?$\";s:54:\"index.php?zozo_portfolio=$matches[1]&cpage=$matches[2]\";s:34:\"portfolio/([^/]+)(?:/([0-9]+))?/?$\";s:53:\"index.php?zozo_portfolio=$matches[1]&page=$matches[2]\";s:26:\"portfolio/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:36:\"portfolio/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:56:\"portfolio/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:51:\"portfolio/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:51:\"portfolio/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:32:\"portfolio/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:61:\"portfolio-categories/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?portfolio_categories=$matches[1]&feed=$matches[2]\";s:56:\"portfolio-categories/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?portfolio_categories=$matches[1]&feed=$matches[2]\";s:37:\"portfolio-categories/([^/]+)/embed/?$\";s:53:\"index.php?portfolio_categories=$matches[1]&embed=true\";s:49:\"portfolio-categories/([^/]+)/page/?([0-9]{1,})/?$\";s:60:\"index.php?portfolio_categories=$matches[1]&paged=$matches[2]\";s:31:\"portfolio-categories/([^/]+)/?$\";s:42:\"index.php?portfolio_categories=$matches[1]\";s:55:\"portfolio-tags/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?portfolio_tags=$matches[1]&feed=$matches[2]\";s:50:\"portfolio-tags/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?portfolio_tags=$matches[1]&feed=$matches[2]\";s:31:\"portfolio-tags/([^/]+)/embed/?$\";s:47:\"index.php?portfolio_tags=$matches[1]&embed=true\";s:43:\"portfolio-tags/([^/]+)/page/?([0-9]{1,})/?$\";s:54:\"index.php?portfolio_tags=$matches[1]&paged=$matches[2]\";s:25:\"portfolio-tags/([^/]+)/?$\";s:36:\"index.php?portfolio_tags=$matches[1]\";s:36:\"services/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"services/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"services/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"services/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"services/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"services/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:25:\"services/([^/]+)/embed/?$\";s:46:\"index.php?zozo_services=$matches[1]&embed=true\";s:29:\"services/([^/]+)/trackback/?$\";s:40:\"index.php?zozo_services=$matches[1]&tb=1\";s:37:\"services/([^/]+)/page/?([0-9]{1,})/?$\";s:53:\"index.php?zozo_services=$matches[1]&paged=$matches[2]\";s:44:\"services/([^/]+)/comment-page-([0-9]{1,})/?$\";s:53:\"index.php?zozo_services=$matches[1]&cpage=$matches[2]\";s:33:\"services/([^/]+)(?:/([0-9]+))?/?$\";s:52:\"index.php?zozo_services=$matches[1]&page=$matches[2]\";s:25:\"services/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"services/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"services/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"services/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"services/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"services/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:59:\"service-categories/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?service_categories=$matches[1]&feed=$matches[2]\";s:54:\"service-categories/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?service_categories=$matches[1]&feed=$matches[2]\";s:35:\"service-categories/([^/]+)/embed/?$\";s:51:\"index.php?service_categories=$matches[1]&embed=true\";s:47:\"service-categories/([^/]+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?service_categories=$matches[1]&paged=$matches[2]\";s:29:\"service-categories/([^/]+)/?$\";s:40:\"index.php?service_categories=$matches[1]\";s:39:\"testimonial/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:49:\"testimonial/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:69:\"testimonial/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"testimonial/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"testimonial/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:45:\"testimonial/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:28:\"testimonial/([^/]+)/embed/?$\";s:49:\"index.php?zozo_testimonial=$matches[1]&embed=true\";s:32:\"testimonial/([^/]+)/trackback/?$\";s:43:\"index.php?zozo_testimonial=$matches[1]&tb=1\";s:40:\"testimonial/([^/]+)/page/?([0-9]{1,})/?$\";s:56:\"index.php?zozo_testimonial=$matches[1]&paged=$matches[2]\";s:47:\"testimonial/([^/]+)/comment-page-([0-9]{1,})/?$\";s:56:\"index.php?zozo_testimonial=$matches[1]&cpage=$matches[2]\";s:36:\"testimonial/([^/]+)(?:/([0-9]+))?/?$\";s:55:\"index.php?zozo_testimonial=$matches[1]&page=$matches[2]\";s:28:\"testimonial/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:38:\"testimonial/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:58:\"testimonial/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:53:\"testimonial/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:53:\"testimonial/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:34:\"testimonial/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:63:\"testimonial-categories/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:61:\"index.php?testimonial_categories=$matches[1]&feed=$matches[2]\";s:58:\"testimonial-categories/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:61:\"index.php?testimonial_categories=$matches[1]&feed=$matches[2]\";s:39:\"testimonial-categories/([^/]+)/embed/?$\";s:55:\"index.php?testimonial_categories=$matches[1]&embed=true\";s:51:\"testimonial-categories/([^/]+)/page/?([0-9]{1,})/?$\";s:62:\"index.php?testimonial_categories=$matches[1]&paged=$matches[2]\";s:33:\"testimonial-categories/([^/]+)/?$\";s:44:\"index.php?testimonial_categories=$matches[1]\";s:32:\"team/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:42:\"team/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:62:\"team/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"team/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"team/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:38:\"team/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:21:\"team/([^/]+)/embed/?$\";s:49:\"index.php?zozo_team_member=$matches[1]&embed=true\";s:25:\"team/([^/]+)/trackback/?$\";s:43:\"index.php?zozo_team_member=$matches[1]&tb=1\";s:33:\"team/([^/]+)/page/?([0-9]{1,})/?$\";s:56:\"index.php?zozo_team_member=$matches[1]&paged=$matches[2]\";s:40:\"team/([^/]+)/comment-page-([0-9]{1,})/?$\";s:56:\"index.php?zozo_team_member=$matches[1]&cpage=$matches[2]\";s:29:\"team/([^/]+)(?:/([0-9]+))?/?$\";s:55:\"index.php?zozo_team_member=$matches[1]&page=$matches[2]\";s:21:\"team/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:31:\"team/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:51:\"team/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"team/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"team/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:27:\"team/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:52:\"team-groups/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:54:\"index.php?team_categories=$matches[1]&feed=$matches[2]\";s:47:\"team-groups/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:54:\"index.php?team_categories=$matches[1]&feed=$matches[2]\";s:28:\"team-groups/([^/]+)/embed/?$\";s:48:\"index.php?team_categories=$matches[1]&embed=true\";s:40:\"team-groups/([^/]+)/page/?([0-9]{1,})/?$\";s:55:\"index.php?team_categories=$matches[1]&paged=$matches[2]\";s:22:\"team-groups/([^/]+)/?$\";s:37:\"index.php?team_categories=$matches[1]\";s:40:\"vc_grid_item/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"vc_grid_item/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"vc_grid_item/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"vc_grid_item/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"vc_grid_item/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:46:\"vc_grid_item/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:29:\"vc_grid_item/([^/]+)/embed/?$\";s:45:\"index.php?vc_grid_item=$matches[1]&embed=true\";s:33:\"vc_grid_item/([^/]+)/trackback/?$\";s:39:\"index.php?vc_grid_item=$matches[1]&tb=1\";s:41:\"vc_grid_item/([^/]+)/page/?([0-9]{1,})/?$\";s:52:\"index.php?vc_grid_item=$matches[1]&paged=$matches[2]\";s:48:\"vc_grid_item/([^/]+)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?vc_grid_item=$matches[1]&cpage=$matches[2]\";s:37:\"vc_grid_item/([^/]+)(?:/([0-9]+))?/?$\";s:51:\"index.php?vc_grid_item=$matches[1]&page=$matches[2]\";s:29:\"vc_grid_item/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"vc_grid_item/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"vc_grid_item/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"vc_grid_item/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"vc_grid_item/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"vc_grid_item/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=7&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:4:{i:0;s:27:\"js_composer/js_composer.php\";i:1;s:21:\"manage-major/main.php\";i:2;s:24:\"manage-semester/main.php\";i:3;s:35:\"zozothemes-core/zozothemes-core.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:2:{i:0;s:92:\"/Applications/XAMPP/xamppfiles/htdocs/studentservice/wp-content/themes/metal-child/style.css\";i:1;s:0:\"\";}', 'no'),
(40, 'template', 'metal', 'yes'),
(41, 'stylesheet', 'metal-child', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '600', 'yes'),
(65, 'large_size_h', '600', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '7', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '0', 'yes'),
(93, 'initial_db_version', '38590', 'yes'),
(94, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'sidebars_widgets', 'a:9:{s:19:\"wp_inactive_widgets\";a:0:{}s:7:\"primary\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"secondary\";a:0:{}s:14:\"secondary-menu\";a:0:{}s:15:\"footer-widget-1\";a:0:{}s:15:\"footer-widget-2\";a:0:{}s:15:\"footer-widget-3\";a:0:{}s:15:\"footer-widget-4\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(102, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'cron', 'a:5:{i:1545080938;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1545098938;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1545142178;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1545142726;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(112, 'theme_mods_twentyseventeen', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1539439981;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(116, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:3:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.0.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.0.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.0.1\";s:7:\"version\";s:5:\"5.0.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.0.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.0.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.0.1\";s:7:\"version\";s:5:\"5.0.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.9.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.9.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.9-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.9-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.9.9-partial-8.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.9-rollback-8.zip\";}s:7:\"current\";s:5:\"4.9.9\";s:7:\"version\";s:5:\"4.9.9\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:5:\"4.9.8\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1545056240;s:15:\"version_checked\";s:5:\"4.9.8\";s:12:\"translations\";a:0:{}}', 'no'),
(121, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1545056244;s:7:\"checked\";a:2:{s:11:\"metal-child\";s:5:\"1.0.1\";s:5:\"metal\";s:5:\"1.0.3\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(124, 'can_compress_scripts', '1', 'no'),
(140, 'recently_activated', 'a:0:{}', 'yes'),
(143, 'vc_version', '5.4.5', 'yes'),
(144, 'widget_zozo_tweets-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(145, 'current_theme', 'Metal Child', 'yes'),
(146, 'theme_mods_metal-child', 'a:5:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:12:\"primary-menu\";i:2;s:11:\"mobile-menu\";i:3;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1539449207;s:4:\"data\";a:8:{s:19:\"wp_inactive_widgets\";a:0:{}s:7:\"primary\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"secondary\";a:0:{}s:14:\"secondary-menu\";a:0:{}s:15:\"footer-widget-1\";a:0:{}s:15:\"footer-widget-2\";a:0:{}s:15:\"footer-widget-3\";a:0:{}s:15:\"footer-widget-4\";a:0:{}}}s:18:\"custom_css_post_id\";i:-1;s:12:\"zozo_options\";a:1:{s:14:\"zozo_menu_type\";s:8:\"standard\";}}', 'yes'),
(147, 'theme_switched', '', 'yes'),
(148, 'widget_zozo_facebook_like-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(149, 'widget_zozo_call_to_action-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(150, 'widget_zozo_flickr_widget-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(151, 'widget_zozo_instagram_widget-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(152, 'widget_zozo_mailchimp_form_widget-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(153, 'widget_zozo_popular_posts-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(154, 'widget_zozo_category_posts-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(155, 'widget_zozo_tabs-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(156, 'widget_zozo_counters_widget-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(157, 'widget_zozo_social_link_widget-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(158, 'large_crop', '1', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(159, 'zozo_options', 'a:266:{s:8:\"last_tab\";s:0:\"\";s:24:\"zozo_disable_page_loader\";s:0:\"\";s:20:\"zozo_page_loader_img\";a:5:{s:3:\"url\";s:0:\"\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}s:22:\"zozo_enable_responsive\";s:1:\"1\";s:20:\"zozo_enable_rtl_mode\";s:0:\"\";s:23:\"zozo_enable_breadcrumbs\";s:1:\"1\";s:22:\"zozo_disable_opengraph\";s:0:\"\";s:9:\"zozo_logo\";a:5:{s:3:\"url\";s:71:\"http://localhost/studentservice/wp-content/themes/metal/images/logo.png\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:2:\"86\";s:5:\"width\";s:3:\"197\";s:9:\"thumbnail\";s:0:\"\";}s:16:\"zozo_retina_logo\";a:5:{s:3:\"url\";s:0:\"\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}s:19:\"zozo_logo_maxheight\";s:3:\"100\";s:17:\"zozo_logo_padding\";a:3:{s:11:\"padding-top\";s:0:\"\";s:14:\"padding-bottom\";s:0:\"\";s:5:\"units\";s:2:\"px\";}s:16:\"zozo_sticky_logo\";a:5:{s:3:\"url\";s:78:\"http://localhost/studentservice/wp-content/themes/metal/images/sticky-logo.png\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:2:\"86\";s:5:\"width\";s:3:\"197\";s:9:\"thumbnail\";s:0:\"\";}s:24:\"zozo_sticky_logo_padding\";a:3:{s:11:\"padding-top\";s:0:\"\";s:14:\"padding-bottom\";s:0:\"\";s:5:\"units\";s:2:\"px\";}s:18:\"zozo_mailchimp_api\";s:0:\"\";s:15:\"zozo_custom_css\";s:0:\"\";s:23:\"zozo_enable_maintenance\";s:1:\"0\";s:26:\"zozo_maintenance_mode_page\";s:0:\"\";s:23:\"zozo_enable_coming_soon\";s:1:\"0\";s:21:\"zozo_coming_soon_page\";s:0:\"\";s:17:\"zozo_theme_layout\";s:9:\"fullwidth\";s:11:\"zozo_layout\";s:7:\"one-col\";s:25:\"zozo_fullwidth_site_width\";s:4:\"1200\";s:21:\"zozo_boxed_site_width\";s:4:\"1200\";s:18:\"zozo_header_layout\";s:9:\"fullwidth\";s:26:\"zozo_enable_header_top_bar\";s:1:\"1\";s:18:\"zozo_sticky_header\";s:1:\"1\";s:16:\"zozo_header_skin\";s:5:\"light\";s:24:\"zozo_header_transparency\";s:14:\"no-transparent\";s:23:\"zozo_header_search_type\";s:1:\"0\";s:16:\"zozo_header_type\";s:8:\"header-1\";s:21:\"zozo_header_menu_skin\";s:5:\"light\";s:27:\"zozo_header_elements_config\";a:2:{s:7:\"enabled\";a:5:{s:7:\"placebo\";s:7:\"placebo\";s:12:\"primary-menu\";s:12:\"Primary Menu\";s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";}s:8:\"disabled\";a:5:{s:7:\"placebo\";s:7:\"placebo\";s:12:\"social-icons\";s:12:\"Social Icons\";s:12:\"contact-info\";s:12:\"Contact Info\";s:12:\"address-info\";s:21:\"Address / Store Hours\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:25:\"zozo_header_elements_text\";s:11:\"Header Text\";s:27:\"zozo_header_logo_bar_config\";a:2:{s:7:\"enabled\";a:3:{s:7:\"placebo\";s:7:\"placebo\";s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";}s:8:\"disabled\";a:7:{s:7:\"placebo\";s:7:\"placebo\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:12:\"primary-menu\";s:12:\"Primary Menu\";s:12:\"social-icons\";s:12:\"Social Icons\";s:12:\"contact-info\";s:12:\"Contact Info\";s:12:\"address-info\";s:21:\"Address / Store Hours\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:25:\"zozo_header_logo_bar_text\";s:20:\"Header Logo Bar Text\";s:23:\"zozo_header_left_config\";a:2:{s:7:\"enabled\";a:2:{s:7:\"placebo\";s:7:\"placebo\";s:12:\"primary-menu\";s:12:\"Primary Menu\";}s:8:\"disabled\";a:8:{s:7:\"placebo\";s:7:\"placebo\";s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:12:\"social-icons\";s:12:\"Social Icons\";s:12:\"contact-info\";s:12:\"Contact Info\";s:12:\"address-info\";s:21:\"Address / Store Hours\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:21:\"zozo_header_left_text\";s:16:\"Header Left Text\";s:24:\"zozo_header_right_config\";a:2:{s:7:\"enabled\";a:4:{s:7:\"placebo\";s:7:\"placebo\";s:12:\"social-icons\";s:12:\"Social Icons\";s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";}s:8:\"disabled\";a:6:{s:7:\"placebo\";s:7:\"placebo\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:12:\"primary-menu\";s:12:\"Primary Menu\";s:12:\"contact-info\";s:12:\"Contact Info\";s:12:\"address-info\";s:21:\"Address / Store Hours\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:22:\"zozo_header_right_text\";s:17:\"Header Right Text\";s:28:\"zozo_header_right_alt_config\";a:2:{s:7:\"enabled\";a:3:{s:7:\"placebo\";s:7:\"placebo\";s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";}s:8:\"disabled\";a:4:{s:7:\"placebo\";s:7:\"placebo\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:12:\"social-icons\";s:12:\"Social Icons\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:26:\"zozo_header_right_alt_text\";s:17:\"Header Right Text\";s:20:\"zozo_slider_position\";s:5:\"below\";s:27:\"zozo_header_toggle_position\";s:4:\"left\";s:22:\"zozo_header_side_width\";s:5:\"280px\";s:24:\"zozo_header_top_bar_left\";a:2:{s:7:\"enabled\";a:2:{s:7:\"placebo\";s:7:\"placebo\";s:12:\"contact-info\";s:12:\"Contact Info\";}s:8:\"disabled\";a:8:{s:7:\"placebo\";s:7:\"placebo\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";s:12:\"social-icons\";s:12:\"Social Icons\";s:11:\"search-icon\";s:6:\"Search\";s:9:\"cart-icon\";s:4:\"Cart\";s:8:\"top-menu\";s:8:\"Top Menu\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:11:\"welcome-msg\";s:15:\"Welcome Message\";}}s:29:\"zozo_header_top_bar_left_text\";s:17:\"Top Bar Left Text\";s:25:\"zozo_header_top_bar_right\";a:2:{s:7:\"enabled\";a:2:{s:7:\"placebo\";s:7:\"placebo\";s:12:\"social-icons\";s:12:\"Social Icons\";}s:8:\"disabled\";a:8:{s:7:\"placebo\";s:7:\"placebo\";s:12:\"contact-info\";s:12:\"Contact Info\";s:11:\"search-icon\";s:6:\"Search\";s:9:\"cart-icon\";s:4:\"Cart\";s:8:\"top-menu\";s:8:\"Top Menu\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:11:\"welcome-msg\";s:15:\"Welcome Message\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:30:\"zozo_header_top_bar_right_text\";s:18:\"Top Bar Right Text\";s:16:\"zozo_welcome_msg\";s:16:\"Welcome to Metal\";s:17:\"zozo_header_phone\";s:15:\"+12 123 456 789\";s:17:\"zozo_header_email\";s:17:\"info@yoursite.com\";s:19:\"zozo_header_address\";s:78:\"<strong>No. 12, Ribon Building, </strong><span>Walse street, Australia.</span>\";s:26:\"zozo_header_business_hours\";s:81:\"<strong>Monday-Friday: 9am to 5pm </strong><span>Saturday / Sunday: Closed</span>\";s:23:\"zozo_enable_sliding_bar\";s:0:\"\";s:24:\"zozo_disable_sliding_bar\";s:1:\"1\";s:24:\"zozo_sliding_bar_columns\";s:1:\"3\";s:19:\"zozo_header_spacing\";a:5:{s:11:\"padding-top\";s:0:\"\";s:13:\"padding-right\";s:0:\"\";s:14:\"padding-bottom\";s:0:\"\";s:12:\"padding-left\";s:0:\"\";s:5:\"units\";s:2:\"px\";}s:14:\"zozo_menu_type\";s:8:\"standard\";s:19:\"zozo_menu_separator\";s:0:\"\";s:24:\"zozo_dropdown_menu_width\";a:2:{s:5:\"width\";s:5:\"200px\";s:5:\"units\";s:2:\"px\";}s:16:\"zozo_menu_height\";a:2:{s:6:\"height\";s:4:\"70px\";s:5:\"units\";s:2:\"px\";}s:23:\"zozo_sticky_menu_height\";a:2:{s:6:\"height\";s:4:\"60px\";s:5:\"units\";s:2:\"px\";}s:20:\"zozo_logo_bar_height\";a:2:{s:6:\"height\";s:4:\"76px\";s:5:\"units\";s:2:\"px\";}s:20:\"zozo_menu_height_alt\";a:2:{s:6:\"height\";s:4:\"60px\";s:5:\"units\";s:2:\"px\";}s:27:\"zozo_sticky_menu_height_alt\";a:2:{s:6:\"height\";s:4:\"60px\";s:5:\"units\";s:2:\"px\";}s:26:\"zozo_enable_secondary_menu\";s:0:\"\";s:28:\"zozo_secondary_menu_position\";s:5:\"right\";s:11:\"mobile_logo\";a:5:{s:3:\"url\";s:0:\"\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}s:20:\"sticky_mobile_header\";s:1:\"1\";s:20:\"mobile_header_layout\";s:9:\"left-logo\";s:15:\"mobile_top_text\";s:0:\"\";s:18:\"mobile_show_search\";s:1:\"0\";s:23:\"mobile_show_translation\";s:1:\"0\";s:16:\"mobile_show_cart\";s:1:\"0\";s:19:\"zozo_copyright_text\";s:45:\"&copy; Copyright [year]. All Rights Reserved.\";s:26:\"zozo_footer_widgets_enable\";s:1:\"1\";s:23:\"zozo_enable_back_to_top\";s:1:\"1\";s:25:\"zozo_back_to_top_position\";s:13:\"copyright_bar\";s:23:\"zozo_enable_footer_menu\";s:0:\"\";s:27:\"zozo_footer_copyright_align\";s:4:\"left\";s:16:\"zozo_footer_skin\";s:4:\"dark\";s:17:\"zozo_footer_style\";s:7:\"default\";s:16:\"zozo_footer_type\";s:8:\"footer-1\";s:19:\"zozo_footer_spacing\";a:5:{s:11:\"padding-top\";s:0:\"\";s:13:\"padding-right\";s:0:\"\";s:14:\"padding-bottom\";s:3:\"0px\";s:12:\"padding-left\";s:0:\"\";s:5:\"units\";s:2:\"px\";}s:29:\"zozo_footer_copyright_spacing\";a:5:{s:11:\"padding-top\";s:0:\"\";s:13:\"padding-right\";s:0:\"\";s:14:\"padding-bottom\";s:0:\"\";s:12:\"padding-left\";s:0:\"\";s:5:\"units\";s:2:\"px\";}s:14:\"zozo_body_font\";a:9:{s:11:\"font-family\";s:5:\"Arimo\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"14px\";s:11:\"line-height\";s:4:\"25px\";s:5:\"color\";s:7:\"#333333\";}s:19:\"zozo_h1_font_styles\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"48px\";s:11:\"line-height\";s:4:\"62px\";s:5:\"color\";s:0:\"\";}s:19:\"zozo_h2_font_styles\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"40px\";s:11:\"line-height\";s:4:\"52px\";s:5:\"color\";s:0:\"\";}s:19:\"zozo_h3_font_styles\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"32px\";s:11:\"line-height\";s:4:\"42px\";s:5:\"color\";s:0:\"\";}s:19:\"zozo_h4_font_styles\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"24px\";s:11:\"line-height\";s:4:\"31px\";s:5:\"color\";s:0:\"\";}s:19:\"zozo_h5_font_styles\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"18px\";s:11:\"line-height\";s:4:\"23px\";s:5:\"color\";s:0:\"\";}s:19:\"zozo_h6_font_styles\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"16px\";s:11:\"line-height\";s:4:\"21px\";s:5:\"color\";s:0:\"\";}s:25:\"zozo_top_menu_font_styles\";a:9:{s:11:\"font-family\";s:5:\"Arimo\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"700\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"12px\";s:11:\"line-height\";s:4:\"12px\";s:5:\"color\";s:0:\"\";}s:21:\"zozo_menu_font_styles\";a:8:{s:11:\"font-family\";s:5:\"Arimo\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"700\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"11px\";s:5:\"color\";s:0:\"\";}s:24:\"zozo_submenu_font_styles\";a:9:{s:11:\"font-family\";s:5:\"Arimo\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"14px\";s:11:\"line-height\";s:4:\"20px\";s:5:\"color\";s:0:\"\";}s:28:\"zozo_single_post_title_fonts\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"700\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"32px\";s:11:\"line-height\";s:4:\"35px\";s:5:\"color\";s:0:\"\";}s:27:\"zozo_post_title_font_styles\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"26px\";s:11:\"line-height\";s:4:\"41px\";s:5:\"color\";s:0:\"\";}s:23:\"zozo_widget_title_fonts\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"16px\";s:11:\"line-height\";s:4:\"42px\";s:5:\"color\";s:0:\"\";}s:22:\"zozo_widget_text_fonts\";a:9:{s:11:\"font-family\";s:5:\"Arimo\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"13px\";s:11:\"line-height\";s:4:\"25px\";s:5:\"color\";s:0:\"\";}s:30:\"zozo_footer_widget_title_fonts\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"16px\";s:11:\"line-height\";s:4:\"42px\";s:5:\"color\";s:0:\"\";}s:29:\"zozo_footer_widget_text_fonts\";a:9:{s:11:\"font-family\";s:5:\"Arimo\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"13px\";s:11:\"line-height\";s:4:\"25px\";s:5:\"color\";s:0:\"\";}s:17:\"zozo_color_scheme\";s:10:\"yellow.css\";s:15:\"zozo_theme_skin\";s:5:\"light\";s:24:\"zozo_custom_scheme_color\";s:0:\"\";s:22:\"zozo_custom_color_skin\";a:2:{s:7:\"regular\";s:0:\"\";s:5:\"hover\";s:0:\"\";}s:15:\"zozo_link_color\";a:2:{s:7:\"regular\";s:0:\"\";s:5:\"hover\";s:0:\"\";}s:18:\"zozo_body_bg_image\";a:7:{s:16:\"background-color\";s:0:\"\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:18:\"zozo_page_bg_image\";a:7:{s:16:\"background-color\";s:0:\"\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:20:\"zozo_header_bg_image\";a:7:{s:16:\"background-color\";s:0:\"\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:20:\"zozo_sticky_bg_image\";a:7:{s:16:\"background-color\";s:0:\"\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:32:\"zozo_header_top_background_color\";s:0:\"\";s:29:\"zozo_sliding_background_color\";s:0:\"\";s:20:\"zozo_top_menu_hcolor\";a:1:{s:5:\"hover\";s:0:\"\";}s:21:\"zozo_main_menu_hcolor\";a:1:{s:5:\"hover\";s:0:\"\";}s:24:\"zozo_submenu_show_border\";s:1:\"1\";s:24:\"zozo_main_submenu_border\";a:6:{s:10:\"border-top\";s:3:\"3px\";s:12:\"border-right\";s:0:\"\";s:13:\"border-bottom\";s:0:\"\";s:11:\"border-left\";s:0:\"\";s:12:\"border-style\";s:5:\"solid\";s:12:\"border-color\";s:0:\"\";}s:21:\"zozo_submenu_bg_color\";s:7:\"#ffffff\";s:20:\"zozo_sub_menu_hcolor\";a:1:{s:5:\"hover\";s:0:\"\";}s:22:\"zozo_submenu_hbg_color\";s:0:\"\";s:20:\"zozo_footer_bg_image\";a:7:{s:16:\"background-color\";s:0:\"\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:25:\"zozo_footer_copy_bg_image\";a:7:{s:16:\"background-color\";s:0:\"\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:20:\"zozo_social_bg_color\";a:2:{s:7:\"regular\";s:0:\"\";s:5:\"hover\";s:0:\"\";}s:22:\"zozo_social_icon_color\";a:2:{s:7:\"regular\";s:0:\"\";s:5:\"hover\";s:0:\"\";}s:21:\"zozo_social_icon_type\";s:11:\"transparent\";s:18:\"zozo_facebook_link\";s:0:\"\";s:17:\"zozo_twitter_link\";s:0:\"\";s:18:\"zozo_linkedin_link\";s:0:\"\";s:19:\"zozo_pinterest_link\";s:0:\"\";s:20:\"zozo_googleplus_link\";s:0:\"\";s:17:\"zozo_youtube_link\";s:0:\"\";s:13:\"zozo_rss_link\";s:0:\"\";s:16:\"zozo_tumblr_link\";s:0:\"\";s:16:\"zozo_reddit_link\";s:0:\"\";s:18:\"zozo_dribbble_link\";s:0:\"\";s:14:\"zozo_digg_link\";s:0:\"\";s:16:\"zozo_flickr_link\";s:0:\"\";s:19:\"zozo_instagram_link\";s:0:\"\";s:15:\"zozo_vimeo_link\";s:0:\"\";s:15:\"zozo_skype_link\";s:0:\"\";s:17:\"zozo_blogger_link\";s:0:\"\";s:15:\"zozo_yahoo_link\";s:0:\"\";s:28:\"zozo_portfolio_archive_count\";s:2:\"10\";s:29:\"zozo_portfolio_archive_layout\";s:4:\"grid\";s:30:\"zozo_portfolio_archive_columns\";s:1:\"4\";s:29:\"zozo_portfolio_archive_gutter\";s:2:\"30\";s:24:\"zozo_portfolio_prev_next\";s:1:\"1\";s:29:\"zozo_portfolio_related_slider\";s:1:\"1\";s:28:\"zozo_portfolio_related_title\";s:0:\"\";s:21:\"zozo_portfolio_citems\";s:0:\"\";s:28:\"zozo_portfolio_citems_scroll\";s:0:\"\";s:22:\"zozo_portfolio_ctablet\";s:0:\"\";s:27:\"zozo_portfolio_cmobile_land\";s:0:\"\";s:22:\"zozo_portfolio_cmobile\";s:0:\"\";s:22:\"zozo_portfolio_cmargin\";s:2:\"20\";s:24:\"zozo_portfolio_cautoplay\";s:1:\"1\";s:23:\"zozo_portfolio_ctimeout\";s:4:\"5000\";s:20:\"zozo_portfolio_cloop\";s:0:\"\";s:26:\"zozo_portfolio_cpagination\";s:1:\"1\";s:26:\"zozo_portfolio_cnavigation\";s:0:\"\";s:26:\"zozo_service_archive_count\";s:2:\"10\";s:28:\"zozo_service_archive_columns\";s:1:\"4\";s:19:\"zozo_service_citems\";s:0:\"\";s:26:\"zozo_service_citems_scroll\";s:0:\"\";s:20:\"zozo_service_ctablet\";s:0:\"\";s:25:\"zozo_service_cmobile_land\";s:0:\"\";s:20:\"zozo_service_cmobile\";s:0:\"\";s:20:\"zozo_service_cmargin\";s:0:\"\";s:22:\"zozo_service_cautoplay\";s:1:\"1\";s:21:\"zozo_service_ctimeout\";s:4:\"5000\";s:18:\"zozo_service_cloop\";s:0:\"\";s:24:\"zozo_service_cpagination\";s:1:\"1\";s:24:\"zozo_service_cnavigation\";s:0:\"\";s:28:\"zozo_disable_blog_pagination\";s:0:\"\";s:24:\"zozo_blog_read_more_text\";s:0:\"\";s:30:\"zozo_blog_excerpt_length_large\";s:2:\"80\";s:29:\"zozo_blog_excerpt_length_grid\";s:2:\"40\";s:28:\"zozo_blog_slideshow_autoplay\";s:1:\"1\";s:27:\"zozo_blog_slideshow_timeout\";s:4:\"5000\";s:21:\"zozo_blog_date_format\";s:5:\"d.m.Y\";s:26:\"zozo_blog_post_meta_author\";s:0:\"\";s:24:\"zozo_blog_post_meta_date\";s:0:\"\";s:30:\"zozo_blog_post_meta_categories\";s:0:\"\";s:28:\"zozo_blog_post_meta_comments\";s:0:\"\";s:19:\"zozo_blog_read_more\";s:0:\"\";s:24:\"zozo_blog_archive_layout\";s:7:\"one-col\";s:22:\"zozo_archive_blog_type\";s:5:\"large\";s:30:\"zozo_archive_blog_grid_columns\";s:3:\"two\";s:33:\"zozo_show_archive_featured_slider\";s:0:\"\";s:24:\"zozo_blog_page_title_bar\";s:1:\"1\";s:15:\"zozo_blog_title\";s:0:\"\";s:16:\"zozo_blog_slogan\";s:0:\"\";s:16:\"zozo_blog_layout\";s:7:\"one-col\";s:14:\"zozo_blog_type\";s:5:\"large\";s:22:\"zozo_blog_grid_columns\";s:3:\"two\";s:30:\"zozo_show_blog_featured_slider\";s:0:\"\";s:23:\"zozo_single_post_layout\";s:7:\"one-col\";s:24:\"zozo_blog_social_sharing\";s:1:\"1\";s:21:\"zozo_blog_author_info\";s:1:\"1\";s:18:\"zozo_blog_comments\";s:1:\"1\";s:23:\"zozo_show_related_posts\";s:1:\"1\";s:23:\"zozo_related_blog_items\";s:1:\"3\";s:30:\"zozo_related_blog_items_scroll\";s:1:\"1\";s:26:\"zozo_related_blog_autoplay\";s:1:\"1\";s:25:\"zozo_related_blog_timeout\";s:4:\"5000\";s:22:\"zozo_related_blog_loop\";s:0:\"\";s:24:\"zozo_related_blog_margin\";s:2:\"30\";s:24:\"zozo_related_blog_tablet\";s:1:\"3\";s:27:\"zozo_related_blog_landscape\";s:1:\"2\";s:26:\"zozo_related_blog_portrait\";s:1:\"1\";s:22:\"zozo_related_blog_dots\";s:0:\"\";s:21:\"zozo_related_blog_nav\";s:1:\"1\";s:19:\"zozo_blog_prev_next\";s:1:\"1\";s:25:\"zozo_single_blog_carousel\";s:0:\"\";s:23:\"zozo_single_blog_citems\";s:1:\"3\";s:30:\"zozo_single_blog_citems_scroll\";s:1:\"1\";s:26:\"zozo_single_blog_cautoplay\";s:1:\"1\";s:25:\"zozo_single_blog_ctimeout\";s:4:\"5000\";s:22:\"zozo_single_blog_cloop\";s:0:\"\";s:24:\"zozo_single_blog_cmargin\";s:0:\"\";s:24:\"zozo_single_blog_ctablet\";s:1:\"3\";s:28:\"zozo_single_blog_cmlandscape\";s:1:\"2\";s:27:\"zozo_single_blog_cmportrait\";s:1:\"1\";s:22:\"zozo_single_blog_cdots\";s:0:\"\";s:21:\"zozo_single_blog_cnav\";s:1:\"1\";s:25:\"zozo_featured_slider_type\";s:12:\"below_header\";s:25:\"zozo_featured_posts_limit\";s:1:\"6\";s:27:\"zozo_featured_slider_citems\";s:1:\"3\";s:34:\"zozo_featured_slider_citems_scroll\";s:1:\"1\";s:30:\"zozo_featured_slider_cautoplay\";s:1:\"1\";s:29:\"zozo_featured_slider_ctimeout\";s:4:\"5000\";s:26:\"zozo_featured_slider_cloop\";s:0:\"\";s:28:\"zozo_featured_slider_cmargin\";s:0:\"\";s:28:\"zozo_featured_slider_ctablet\";s:1:\"3\";s:32:\"zozo_featured_slider_cmlandscape\";s:1:\"2\";s:31:\"zozo_featured_slider_cmportrait\";s:1:\"1\";s:26:\"zozo_featured_slider_cdots\";s:0:\"\";s:25:\"zozo_featured_slider_cnav\";s:1:\"1\";s:21:\"zozo_search_page_type\";s:4:\"grid\";s:24:\"zozo_search_grid_columns\";s:3:\"two\";s:27:\"zozo_search_results_content\";s:4:\"both\";s:21:\"zozo_sharing_facebook\";s:1:\"1\";s:20:\"zozo_sharing_twitter\";s:1:\"1\";s:21:\"zozo_sharing_linkedin\";s:1:\"1\";s:23:\"zozo_sharing_googleplus\";s:1:\"1\";s:22:\"zozo_sharing_pinterest\";s:0:\"\";s:19:\"zozo_sharing_tumblr\";s:0:\"\";s:19:\"zozo_sharing_reddit\";s:0:\"\";s:17:\"zozo_sharing_digg\";s:0:\"\";s:18:\"zozo_sharing_email\";s:1:\"1\";s:11:\"cpt_disable\";a:4:{s:14:\"zozo_portfolio\";s:0:\"\";s:13:\"zozo_services\";s:0:\"\";s:16:\"zozo_testimonial\";s:0:\"\";s:9:\"zozo_team\";s:0:\"\";}s:14:\"portfolio_slug\";s:9:\"portfolio\";s:25:\"portfolio_categories_slug\";s:20:\"portfolio-categories\";s:19:\"portfolio_tags_slug\";s:14:\"portfolio-tags\";s:13:\"services_slug\";s:8:\"services\";s:23:\"service_categories_slug\";s:18:\"service-categories\";s:28:\"zozo_woo_enable_catalog_mode\";s:0:\"\";s:23:\"zozo_woo_archive_layout\";s:7:\"one-col\";s:22:\"zozo_woo_single_layout\";s:13:\"two-col-right\";s:27:\"zozo_loop_products_per_page\";s:2:\"12\";s:22:\"zozo_loop_shop_columns\";s:1:\"4\";s:27:\"zozo_related_products_count\";s:1:\"3\";s:22:\"zozo_woo_shop_ordering\";s:1:\"1\";s:23:\"zozo_woo_social_sharing\";s:1:\"1\";s:27:\"zozo_remove_scripts_version\";s:1:\"1\";s:15:\"zozo_minify_css\";s:1:\"1\";s:14:\"zozo_minify_js\";s:1:\"1\";}', 'yes'),
(160, 'zozo_options-transients', 'a:2:{s:14:\"changed_values\";a:1:{s:19:\"zozo_footer_spacing\";a:5:{s:11:\"padding-top\";s:0:\"\";s:13:\"padding-right\";s:0:\"\";s:14:\"padding-bottom\";s:0:\"\";s:12:\"padding-left\";s:0:\"\";s:5:\"units\";s:2:\"px\";}}s:9:\"last_save\";i:1541480224;}', 'yes'),
(164, 'theme_mods_metal', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1539449720;s:4:\"data\";a:8:{s:19:\"wp_inactive_widgets\";a:0:{}s:7:\"primary\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"secondary\";a:0:{}s:14:\"secondary-menu\";a:0:{}s:15:\"footer-widget-1\";a:0:{}s:15:\"footer-widget-2\";a:0:{}s:15:\"footer-widget-3\";a:0:{}s:15:\"footer-widget-4\";a:0:{}}}}', 'yes'),
(167, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(329, 'clu_config', 'a:6:{s:5:\"login\";s:7:\"/login/\";s:8:\"register\";N;s:12:\"lostpassword\";N;s:6:\"logout\";N;s:14:\"redirect_login\";N;s:15:\"redirect_logout\";N;}', 'yes'),
(334, 'rda_access_switch', 'manage_options', 'yes'),
(335, 'rda_access_cap', 'manage_options', 'yes'),
(336, 'rda_redirect_url', 'http://localhost/studentservice', 'yes'),
(337, 'rda_enable_profile', '', 'yes'),
(338, 'rda_login_message', '', 'yes'),
(344, 'sbg_sidebars', 'a:0:{}', 'yes'),
(1260, '_site_transient_timeout_theme_roots', '1545058042', 'no'),
(1261, '_site_transient_theme_roots', 'a:2:{s:11:\"metal-child\";s:7:\"/themes\";s:5:\"metal\";s:7:\"/themes\";}', 'no'),
(1262, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1545056246;s:7:\"checked\";a:4:{s:21:\"manage-major/main.php\";s:5:\"1.0.0\";s:24:\"manage-semester/main.php\";s:5:\"1.0.0\";s:27:\"js_composer/js_composer.php\";s:5:\"5.4.5\";s:35:\"zozothemes-core/zozothemes-core.php\";s:5:\"1.0.0\";}s:8:\"response\";a:1:{s:27:\"js_composer/js_composer.php\";O:8:\"stdClass\":5:{s:4:\"slug\";s:11:\"js_composer\";s:11:\"new_version\";s:3:\"5.6\";s:3:\"url\";s:0:\"\";s:7:\"package\";b:0;s:4:\"name\";s:21:\"WPBakery Page Builder\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:0:{}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(9, 7, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(10, 7, '_edit_last', '1'),
(11, 7, '_edit_lock', '1541184965:1'),
(12, 7, '_wp_page_template', 'index.php'),
(13, 7, 'zozo_page_top_padding', '10px'),
(14, 7, 'zozo_page_bottom_padding', '10px'),
(15, 7, 'zozo_slider_position', 'default'),
(16, 7, 'zozo_revolutionslider', ''),
(17, 7, 'zozo_show_header', 'yes'),
(18, 7, 'zozo_show_header_top_bar', 'yes'),
(19, 7, 'zozo_show_header_sliding_bar', 'default'),
(20, 7, 'zozo_header_layout', 'default'),
(21, 7, 'zozo_header_type', 'default'),
(22, 7, 'zozo_header_toggle_position', 'default'),
(23, 7, 'zozo_header_transparency', 'default'),
(24, 7, 'zozo_header_skin', 'light'),
(25, 7, 'zozo_header_menu_skin', 'light'),
(26, 7, 'zozo_custom_nav_menu', 'default'),
(27, 7, 'zozo_custom_mobile_menu', 'default'),
(28, 7, 'zozo_header_bg_image', ''),
(29, 7, 'zozo_header_bg_image_attach_id', ''),
(30, 7, 'zozo_header_bg_color', ''),
(31, 7, 'zozo_header_bg_opacity', '0'),
(32, 7, 'zozo_header_bg_repeat', ''),
(33, 7, 'zozo_header_bg_attachment', ''),
(34, 7, 'zozo_header_bg_postion', ''),
(35, 7, 'zozo_header_bg_full', '0'),
(36, 7, 'zozo_show_footer_widgets', 'default'),
(37, 7, 'zozo_show_footer_menu', 'default'),
(38, 7, 'zozo_primary_sidebar', '0'),
(39, 7, 'zozo_secondary_sidebar', '0'),
(40, 7, 'zozo_hide_page_title_bar', 'yes'),
(41, 7, 'zozo_hide_page_title', 'yes'),
(42, 7, 'zozo_page_title_type', 'default'),
(43, 7, 'zozo_page_title_skin', 'default'),
(44, 7, 'zozo_page_title_align', 'default'),
(45, 7, 'zozo_display_breadcrumbs', 'default'),
(46, 7, 'zozo_show_page_slogan', 'yes'),
(47, 7, 'zozo_page_slogan', ''),
(48, 7, 'zozo_page_title_height', ''),
(49, 7, 'zozo_page_title_mobile_height', ''),
(50, 7, 'zozo_page_title_bar_title_color', ''),
(51, 7, 'zozo_page_title_bar_slogan_color', ''),
(52, 7, 'zozo_page_breadcrumbs_color', ''),
(53, 7, 'zozo_page_title_bar_border_color', ''),
(54, 7, 'zozo_page_title_bar_bg', ''),
(55, 7, 'zozo_page_title_bar_bg_attach_id', ''),
(56, 7, 'zozo_page_title_bar_bg_color', ''),
(57, 7, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(58, 7, 'zozo_page_title_bar_bg_position', 'left top'),
(59, 7, 'zozo_page_title_bar_bg_parallax', 'no'),
(60, 7, 'zozo_page_title_bar_bg_full', '0'),
(61, 7, 'zozo_page_title_video_bg', '0'),
(62, 7, 'zozo_page_title_video_id', ''),
(63, 7, 'zozo_page_bg_image', ''),
(64, 7, 'zozo_page_bg_image_attach_id', ''),
(65, 7, 'zozo_page_bg_repeat', ''),
(66, 7, 'zozo_page_bg_attachment', ''),
(67, 7, 'zozo_page_bg_position', ''),
(68, 7, 'zozo_page_bg_color', ''),
(69, 7, 'zozo_page_bg_opacity', '0'),
(70, 7, 'zozo_page_bg_full', '0'),
(71, 7, 'zozo_body_bg_image', ''),
(72, 7, 'zozo_body_bg_image_attach_id', ''),
(73, 7, 'zozo_body_bg_repeat', ''),
(74, 7, 'zozo_body_bg_attachment', ''),
(75, 7, 'zozo_body_bg_position', ''),
(76, 7, 'zozo_body_bg_color', ''),
(77, 7, 'zozo_body_bg_opacity', '0'),
(78, 7, 'zozo_body_bg_full', '0'),
(79, 7, 'zozo_section_header_status', 'show'),
(80, 7, 'zozo_section_title', ''),
(81, 7, 'zozo_section_slogan', ''),
(82, 7, 'zozo_section_padding_top', ''),
(83, 7, 'zozo_section_padding_bottom', ''),
(84, 7, 'zozo_section_header_padding', ''),
(85, 7, 'zozo_section_title_color', ''),
(86, 7, 'zozo_section_slogan_color', ''),
(87, 7, 'zozo_section_text_color', ''),
(88, 7, 'zozo_section_content_heading_color', ''),
(89, 7, 'zozo_section_bg_color', ''),
(90, 7, 'zozo_parallax_status', 'no'),
(91, 7, 'zozo_parallax_bg_image', ''),
(92, 7, 'zozo_parallax_bg_image_attach_id', ''),
(93, 7, 'zozo_parallax_bg_repeat', ''),
(94, 7, 'zozo_parallax_bg_attachment', ''),
(95, 7, 'zozo_parallax_bg_postion', ''),
(96, 7, 'zozo_parallax_bg_size', ''),
(97, 7, 'zozo_parallax_bg_overlay', 'no'),
(98, 7, 'zozo_overlay_pattern_status', 'no'),
(99, 7, 'zozo_section_overlay_color', ''),
(100, 7, 'zozo_overlay_color_opacity', '0'),
(101, 7, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(102, 7, 'zozo_parallax_additional_sections_order', ''),
(103, 7, '_wpb_vc_js_status', 'false'),
(104, 7, 'zozo_theme_layout', 'wide'),
(128, 1, '_edit_lock', '1541395640:1'),
(129, 13, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(130, 13, '_edit_last', '1'),
(131, 13, '_edit_lock', '1544527494:1'),
(132, 13, '_wp_page_template', 'g-callback.php'),
(133, 13, 'zozo_page_top_padding', ''),
(134, 13, 'zozo_page_bottom_padding', ''),
(135, 13, 'zozo_slider_position', 'default'),
(136, 13, 'zozo_revolutionslider', ''),
(137, 13, 'zozo_show_header', 'yes'),
(138, 13, 'zozo_show_header_top_bar', 'default'),
(139, 13, 'zozo_show_header_sliding_bar', 'default'),
(140, 13, 'zozo_header_layout', 'default'),
(141, 13, 'zozo_header_type', 'default'),
(142, 13, 'zozo_header_toggle_position', 'default'),
(143, 13, 'zozo_header_transparency', 'default'),
(144, 13, 'zozo_header_skin', 'default'),
(145, 13, 'zozo_header_menu_skin', 'default'),
(146, 13, 'zozo_custom_nav_menu', 'default'),
(147, 13, 'zozo_custom_mobile_menu', 'default'),
(148, 13, 'zozo_header_bg_image', ''),
(149, 13, 'zozo_header_bg_image_attach_id', ''),
(150, 13, 'zozo_header_bg_color', ''),
(151, 13, 'zozo_header_bg_opacity', '0'),
(152, 13, 'zozo_header_bg_repeat', ''),
(153, 13, 'zozo_header_bg_attachment', ''),
(154, 13, 'zozo_header_bg_postion', ''),
(155, 13, 'zozo_header_bg_full', '0'),
(156, 13, 'zozo_show_footer_widgets', 'default'),
(157, 13, 'zozo_show_footer_menu', 'default'),
(158, 13, 'zozo_primary_sidebar', '0'),
(159, 13, 'zozo_secondary_sidebar', '0'),
(160, 13, 'zozo_hide_page_title_bar', 'no'),
(161, 13, 'zozo_hide_page_title', 'no'),
(162, 13, 'zozo_page_title_type', 'default'),
(163, 13, 'zozo_page_title_skin', 'default'),
(164, 13, 'zozo_page_title_align', 'default'),
(165, 13, 'zozo_display_breadcrumbs', 'default'),
(166, 13, 'zozo_show_page_slogan', 'yes'),
(167, 13, 'zozo_page_slogan', ''),
(168, 13, 'zozo_page_title_height', ''),
(169, 13, 'zozo_page_title_mobile_height', ''),
(170, 13, 'zozo_page_title_bar_title_color', ''),
(171, 13, 'zozo_page_title_bar_slogan_color', ''),
(172, 13, 'zozo_page_breadcrumbs_color', ''),
(173, 13, 'zozo_page_title_bar_border_color', ''),
(174, 13, 'zozo_page_title_bar_bg', ''),
(175, 13, 'zozo_page_title_bar_bg_attach_id', ''),
(176, 13, 'zozo_page_title_bar_bg_color', ''),
(177, 13, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(178, 13, 'zozo_page_title_bar_bg_position', 'left top'),
(179, 13, 'zozo_page_title_bar_bg_parallax', 'no'),
(180, 13, 'zozo_page_title_bar_bg_full', '0'),
(181, 13, 'zozo_page_title_video_bg', '0'),
(182, 13, 'zozo_page_title_video_id', ''),
(183, 13, 'zozo_page_bg_image', ''),
(184, 13, 'zozo_page_bg_image_attach_id', ''),
(185, 13, 'zozo_page_bg_repeat', ''),
(186, 13, 'zozo_page_bg_attachment', ''),
(187, 13, 'zozo_page_bg_position', ''),
(188, 13, 'zozo_page_bg_color', ''),
(189, 13, 'zozo_page_bg_opacity', '0'),
(190, 13, 'zozo_page_bg_full', '0'),
(191, 13, 'zozo_body_bg_image', ''),
(192, 13, 'zozo_body_bg_image_attach_id', ''),
(193, 13, 'zozo_body_bg_repeat', ''),
(194, 13, 'zozo_body_bg_attachment', ''),
(195, 13, 'zozo_body_bg_position', ''),
(196, 13, 'zozo_body_bg_color', ''),
(197, 13, 'zozo_body_bg_opacity', '0'),
(198, 13, 'zozo_body_bg_full', '0'),
(199, 13, 'zozo_section_header_status', 'show'),
(200, 13, 'zozo_section_title', ''),
(201, 13, 'zozo_section_slogan', ''),
(202, 13, 'zozo_section_padding_top', ''),
(203, 13, 'zozo_section_padding_bottom', ''),
(204, 13, 'zozo_section_header_padding', ''),
(205, 13, 'zozo_section_title_color', ''),
(206, 13, 'zozo_section_slogan_color', ''),
(207, 13, 'zozo_section_text_color', ''),
(208, 13, 'zozo_section_content_heading_color', ''),
(209, 13, 'zozo_section_bg_color', ''),
(210, 13, 'zozo_parallax_status', 'no'),
(211, 13, 'zozo_parallax_bg_image', ''),
(212, 13, 'zozo_parallax_bg_image_attach_id', ''),
(213, 13, 'zozo_parallax_bg_repeat', ''),
(214, 13, 'zozo_parallax_bg_attachment', ''),
(215, 13, 'zozo_parallax_bg_postion', ''),
(216, 13, 'zozo_parallax_bg_size', ''),
(217, 13, 'zozo_parallax_bg_overlay', 'no'),
(218, 13, 'zozo_overlay_pattern_status', 'no'),
(219, 13, 'zozo_section_overlay_color', ''),
(220, 13, 'zozo_overlay_color_opacity', '0'),
(221, 13, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(222, 13, 'zozo_parallax_additional_sections_order', ''),
(223, 13, '_wpb_vc_js_status', 'false'),
(224, 15, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(225, 15, '_edit_last', '1'),
(226, 15, '_edit_lock', '1540872857:1'),
(227, 15, '_wp_page_template', 'login.php'),
(228, 15, 'zozo_page_top_padding', ''),
(229, 15, 'zozo_page_bottom_padding', ''),
(230, 15, 'zozo_slider_position', 'default'),
(231, 15, 'zozo_revolutionslider', ''),
(232, 15, 'zozo_show_header', 'yes'),
(233, 15, 'zozo_show_header_top_bar', 'default'),
(234, 15, 'zozo_show_header_sliding_bar', 'default'),
(235, 15, 'zozo_header_layout', 'default'),
(236, 15, 'zozo_header_type', 'default'),
(237, 15, 'zozo_header_toggle_position', 'default'),
(238, 15, 'zozo_header_transparency', 'default'),
(239, 15, 'zozo_header_skin', 'default'),
(240, 15, 'zozo_header_menu_skin', 'dark'),
(241, 15, 'zozo_custom_nav_menu', 'default'),
(242, 15, 'zozo_custom_mobile_menu', 'default'),
(243, 15, 'zozo_header_bg_image', ''),
(244, 15, 'zozo_header_bg_image_attach_id', ''),
(245, 15, 'zozo_header_bg_color', ''),
(246, 15, 'zozo_header_bg_opacity', '0'),
(247, 15, 'zozo_header_bg_repeat', ''),
(248, 15, 'zozo_header_bg_attachment', ''),
(249, 15, 'zozo_header_bg_postion', ''),
(250, 15, 'zozo_header_bg_full', '0'),
(251, 15, 'zozo_show_footer_widgets', 'default'),
(252, 15, 'zozo_show_footer_menu', 'default'),
(253, 15, 'zozo_primary_sidebar', '0'),
(254, 15, 'zozo_secondary_sidebar', '0'),
(255, 15, 'zozo_hide_page_title_bar', 'yes'),
(256, 15, 'zozo_hide_page_title', 'yes'),
(257, 15, 'zozo_page_title_type', 'default'),
(258, 15, 'zozo_page_title_skin', 'default'),
(259, 15, 'zozo_page_title_align', 'default'),
(260, 15, 'zozo_display_breadcrumbs', 'default'),
(261, 15, 'zozo_show_page_slogan', 'yes'),
(262, 15, 'zozo_page_slogan', ''),
(263, 15, 'zozo_page_title_height', ''),
(264, 15, 'zozo_page_title_mobile_height', ''),
(265, 15, 'zozo_page_title_bar_title_color', ''),
(266, 15, 'zozo_page_title_bar_slogan_color', ''),
(267, 15, 'zozo_page_breadcrumbs_color', ''),
(268, 15, 'zozo_page_title_bar_border_color', ''),
(269, 15, 'zozo_page_title_bar_bg', ''),
(270, 15, 'zozo_page_title_bar_bg_attach_id', ''),
(271, 15, 'zozo_page_title_bar_bg_color', ''),
(272, 15, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(273, 15, 'zozo_page_title_bar_bg_position', 'left top'),
(274, 15, 'zozo_page_title_bar_bg_parallax', 'no'),
(275, 15, 'zozo_page_title_bar_bg_full', '0'),
(276, 15, 'zozo_page_title_video_bg', '0'),
(277, 15, 'zozo_page_title_video_id', ''),
(278, 15, 'zozo_page_bg_image', ''),
(279, 15, 'zozo_page_bg_image_attach_id', ''),
(280, 15, 'zozo_page_bg_repeat', ''),
(281, 15, 'zozo_page_bg_attachment', ''),
(282, 15, 'zozo_page_bg_position', ''),
(283, 15, 'zozo_page_bg_color', ''),
(284, 15, 'zozo_page_bg_opacity', '0'),
(285, 15, 'zozo_page_bg_full', '0'),
(286, 15, 'zozo_body_bg_image', ''),
(287, 15, 'zozo_body_bg_image_attach_id', ''),
(288, 15, 'zozo_body_bg_repeat', ''),
(289, 15, 'zozo_body_bg_attachment', ''),
(290, 15, 'zozo_body_bg_position', ''),
(291, 15, 'zozo_body_bg_color', ''),
(292, 15, 'zozo_body_bg_opacity', '0'),
(293, 15, 'zozo_body_bg_full', '0'),
(294, 15, 'zozo_section_header_status', 'show'),
(295, 15, 'zozo_section_title', ''),
(296, 15, 'zozo_section_slogan', ''),
(297, 15, 'zozo_section_padding_top', ''),
(298, 15, 'zozo_section_padding_bottom', ''),
(299, 15, 'zozo_section_header_padding', ''),
(300, 15, 'zozo_section_title_color', ''),
(301, 15, 'zozo_section_slogan_color', ''),
(302, 15, 'zozo_section_text_color', ''),
(303, 15, 'zozo_section_content_heading_color', ''),
(304, 15, 'zozo_section_bg_color', ''),
(305, 15, 'zozo_parallax_status', 'no'),
(306, 15, 'zozo_parallax_bg_image', ''),
(307, 15, 'zozo_parallax_bg_image_attach_id', ''),
(308, 15, 'zozo_parallax_bg_repeat', ''),
(309, 15, 'zozo_parallax_bg_attachment', ''),
(310, 15, 'zozo_parallax_bg_postion', ''),
(311, 15, 'zozo_parallax_bg_size', ''),
(312, 15, 'zozo_parallax_bg_overlay', 'no'),
(313, 15, 'zozo_overlay_pattern_status', 'no'),
(314, 15, 'zozo_section_overlay_color', ''),
(315, 15, 'zozo_overlay_color_opacity', '0'),
(316, 15, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(317, 15, 'zozo_parallax_additional_sections_order', ''),
(318, 15, '_wpb_vc_js_status', 'false'),
(319, 17, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(320, 17, '_edit_last', '1'),
(321, 17, '_edit_lock', '1540873003:1'),
(322, 17, '_wp_page_template', 'profile.php'),
(323, 17, 'zozo_page_top_padding', ''),
(324, 17, 'zozo_page_bottom_padding', ''),
(325, 17, 'zozo_slider_position', 'default'),
(326, 17, 'zozo_revolutionslider', ''),
(327, 17, 'zozo_show_header', 'yes'),
(328, 17, 'zozo_show_header_top_bar', 'default'),
(329, 17, 'zozo_show_header_sliding_bar', 'default'),
(330, 17, 'zozo_header_layout', 'default'),
(331, 17, 'zozo_header_type', 'default'),
(332, 17, 'zozo_header_toggle_position', 'default'),
(333, 17, 'zozo_header_transparency', 'default'),
(334, 17, 'zozo_header_skin', 'default'),
(335, 17, 'zozo_header_menu_skin', 'dark'),
(336, 17, 'zozo_custom_nav_menu', 'default'),
(337, 17, 'zozo_custom_mobile_menu', 'default'),
(338, 17, 'zozo_header_bg_image', ''),
(339, 17, 'zozo_header_bg_image_attach_id', ''),
(340, 17, 'zozo_header_bg_color', ''),
(341, 17, 'zozo_header_bg_opacity', '0'),
(342, 17, 'zozo_header_bg_repeat', ''),
(343, 17, 'zozo_header_bg_attachment', ''),
(344, 17, 'zozo_header_bg_postion', ''),
(345, 17, 'zozo_header_bg_full', '0'),
(346, 17, 'zozo_show_footer_widgets', 'default'),
(347, 17, 'zozo_show_footer_menu', 'default'),
(348, 17, 'zozo_primary_sidebar', '0'),
(349, 17, 'zozo_secondary_sidebar', '0'),
(350, 17, 'zozo_hide_page_title_bar', 'yes'),
(351, 17, 'zozo_hide_page_title', 'yes'),
(352, 17, 'zozo_page_title_type', 'default'),
(353, 17, 'zozo_page_title_skin', 'default'),
(354, 17, 'zozo_page_title_align', 'default'),
(355, 17, 'zozo_display_breadcrumbs', 'default'),
(356, 17, 'zozo_show_page_slogan', 'yes'),
(357, 17, 'zozo_page_slogan', ''),
(358, 17, 'zozo_page_title_height', ''),
(359, 17, 'zozo_page_title_mobile_height', ''),
(360, 17, 'zozo_page_title_bar_title_color', ''),
(361, 17, 'zozo_page_title_bar_slogan_color', ''),
(362, 17, 'zozo_page_breadcrumbs_color', ''),
(363, 17, 'zozo_page_title_bar_border_color', ''),
(364, 17, 'zozo_page_title_bar_bg', ''),
(365, 17, 'zozo_page_title_bar_bg_attach_id', ''),
(366, 17, 'zozo_page_title_bar_bg_color', ''),
(367, 17, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(368, 17, 'zozo_page_title_bar_bg_position', 'left top'),
(369, 17, 'zozo_page_title_bar_bg_parallax', 'no'),
(370, 17, 'zozo_page_title_bar_bg_full', '0'),
(371, 17, 'zozo_page_title_video_bg', '0'),
(372, 17, 'zozo_page_title_video_id', ''),
(373, 17, 'zozo_page_bg_image', ''),
(374, 17, 'zozo_page_bg_image_attach_id', ''),
(375, 17, 'zozo_page_bg_repeat', ''),
(376, 17, 'zozo_page_bg_attachment', ''),
(377, 17, 'zozo_page_bg_position', ''),
(378, 17, 'zozo_page_bg_color', ''),
(379, 17, 'zozo_page_bg_opacity', '0'),
(380, 17, 'zozo_page_bg_full', '0'),
(381, 17, 'zozo_body_bg_image', ''),
(382, 17, 'zozo_body_bg_image_attach_id', ''),
(383, 17, 'zozo_body_bg_repeat', ''),
(384, 17, 'zozo_body_bg_attachment', ''),
(385, 17, 'zozo_body_bg_position', ''),
(386, 17, 'zozo_body_bg_color', ''),
(387, 17, 'zozo_body_bg_opacity', '0'),
(388, 17, 'zozo_body_bg_full', '0'),
(389, 17, 'zozo_section_header_status', 'show'),
(390, 17, 'zozo_section_title', ''),
(391, 17, 'zozo_section_slogan', ''),
(392, 17, 'zozo_section_padding_top', ''),
(393, 17, 'zozo_section_padding_bottom', ''),
(394, 17, 'zozo_section_header_padding', ''),
(395, 17, 'zozo_section_title_color', ''),
(396, 17, 'zozo_section_slogan_color', ''),
(397, 17, 'zozo_section_text_color', ''),
(398, 17, 'zozo_section_content_heading_color', ''),
(399, 17, 'zozo_section_bg_color', ''),
(400, 17, 'zozo_parallax_status', 'no'),
(401, 17, 'zozo_parallax_bg_image', ''),
(402, 17, 'zozo_parallax_bg_image_attach_id', ''),
(403, 17, 'zozo_parallax_bg_repeat', ''),
(404, 17, 'zozo_parallax_bg_attachment', ''),
(405, 17, 'zozo_parallax_bg_postion', ''),
(406, 17, 'zozo_parallax_bg_size', ''),
(407, 17, 'zozo_parallax_bg_overlay', 'no'),
(408, 17, 'zozo_overlay_pattern_status', 'no'),
(409, 17, 'zozo_section_overlay_color', ''),
(410, 17, 'zozo_overlay_color_opacity', '0'),
(411, 17, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(412, 17, 'zozo_parallax_additional_sections_order', ''),
(413, 17, '_wpb_vc_js_status', 'false'),
(414, 15, 'zozo_theme_layout', 'wide'),
(415, 17, 'zozo_theme_layout', 'wide'),
(577, 27, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(578, 27, '_edit_last', '1'),
(579, 27, '_wp_page_template', 'view-profile.php'),
(580, 27, 'zozo_page_top_padding', ''),
(581, 27, 'zozo_page_bottom_padding', ''),
(582, 27, 'zozo_slider_position', 'default'),
(583, 27, 'zozo_revolutionslider', ''),
(584, 27, 'zozo_show_header', 'yes'),
(585, 27, 'zozo_show_header_top_bar', 'default'),
(586, 27, 'zozo_show_header_sliding_bar', 'default'),
(587, 27, 'zozo_header_layout', 'default'),
(588, 27, 'zozo_header_type', 'default'),
(589, 27, 'zozo_header_toggle_position', 'default'),
(590, 27, 'zozo_header_transparency', 'default'),
(591, 27, 'zozo_header_skin', 'default'),
(592, 27, 'zozo_header_menu_skin', 'dark'),
(593, 27, 'zozo_custom_nav_menu', 'default'),
(594, 27, 'zozo_custom_mobile_menu', 'default'),
(595, 27, 'zozo_header_bg_image', ''),
(596, 27, 'zozo_header_bg_image_attach_id', ''),
(597, 27, 'zozo_header_bg_color', ''),
(598, 27, 'zozo_header_bg_opacity', '0'),
(599, 27, 'zozo_header_bg_repeat', ''),
(600, 27, 'zozo_header_bg_attachment', ''),
(601, 27, 'zozo_header_bg_postion', ''),
(602, 27, 'zozo_header_bg_full', '0'),
(603, 27, 'zozo_show_footer_widgets', 'default'),
(604, 27, 'zozo_show_footer_menu', 'default'),
(605, 27, 'zozo_primary_sidebar', '0'),
(606, 27, 'zozo_secondary_sidebar', '0'),
(607, 27, 'zozo_hide_page_title_bar', 'yes'),
(608, 27, 'zozo_hide_page_title', 'yes'),
(609, 27, 'zozo_page_title_type', 'default'),
(610, 27, 'zozo_page_title_skin', 'default'),
(611, 27, 'zozo_page_title_align', 'default'),
(612, 27, 'zozo_display_breadcrumbs', 'default'),
(613, 27, 'zozo_show_page_slogan', 'yes'),
(614, 27, 'zozo_page_slogan', ''),
(615, 27, 'zozo_page_title_height', ''),
(616, 27, 'zozo_page_title_mobile_height', ''),
(617, 27, 'zozo_page_title_bar_title_color', ''),
(618, 27, 'zozo_page_title_bar_slogan_color', ''),
(619, 27, 'zozo_page_breadcrumbs_color', ''),
(620, 27, 'zozo_page_title_bar_border_color', ''),
(621, 27, 'zozo_page_title_bar_bg', ''),
(622, 27, 'zozo_page_title_bar_bg_attach_id', ''),
(623, 27, 'zozo_page_title_bar_bg_color', ''),
(624, 27, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(625, 27, 'zozo_page_title_bar_bg_position', 'left top'),
(626, 27, 'zozo_page_title_bar_bg_parallax', 'no'),
(627, 27, 'zozo_page_title_bar_bg_full', '0'),
(628, 27, 'zozo_page_title_video_bg', '0'),
(629, 27, 'zozo_page_title_video_id', ''),
(630, 27, 'zozo_page_bg_image', ''),
(631, 27, 'zozo_page_bg_image_attach_id', ''),
(632, 27, 'zozo_page_bg_repeat', ''),
(633, 27, 'zozo_page_bg_attachment', ''),
(634, 27, 'zozo_page_bg_position', ''),
(635, 27, 'zozo_page_bg_color', ''),
(636, 27, 'zozo_page_bg_opacity', '0'),
(637, 27, 'zozo_page_bg_full', '0'),
(638, 27, 'zozo_body_bg_image', ''),
(639, 27, 'zozo_body_bg_image_attach_id', ''),
(640, 27, 'zozo_body_bg_repeat', ''),
(641, 27, 'zozo_body_bg_attachment', ''),
(642, 27, 'zozo_body_bg_position', ''),
(643, 27, 'zozo_body_bg_color', ''),
(644, 27, 'zozo_body_bg_opacity', '0'),
(645, 27, 'zozo_body_bg_full', '0'),
(646, 27, 'zozo_section_header_status', 'show'),
(647, 27, 'zozo_section_title', ''),
(648, 27, 'zozo_section_slogan', ''),
(649, 27, 'zozo_section_padding_top', ''),
(650, 27, 'zozo_section_padding_bottom', ''),
(651, 27, 'zozo_section_header_padding', ''),
(652, 27, 'zozo_section_title_color', ''),
(653, 27, 'zozo_section_slogan_color', ''),
(654, 27, 'zozo_section_text_color', ''),
(655, 27, 'zozo_section_content_heading_color', ''),
(656, 27, 'zozo_section_bg_color', ''),
(657, 27, 'zozo_parallax_status', 'no'),
(658, 27, 'zozo_parallax_bg_image', ''),
(659, 27, 'zozo_parallax_bg_image_attach_id', ''),
(660, 27, 'zozo_parallax_bg_repeat', ''),
(661, 27, 'zozo_parallax_bg_attachment', ''),
(662, 27, 'zozo_parallax_bg_postion', ''),
(663, 27, 'zozo_parallax_bg_size', ''),
(664, 27, 'zozo_parallax_bg_overlay', 'no'),
(665, 27, 'zozo_overlay_pattern_status', 'no'),
(666, 27, 'zozo_section_overlay_color', ''),
(667, 27, 'zozo_overlay_color_opacity', '0'),
(668, 27, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(669, 27, 'zozo_parallax_additional_sections_order', ''),
(670, 27, '_wpb_vc_js_status', 'false'),
(671, 27, '_edit_lock', '1540872857:1'),
(672, 27, 'zozo_theme_layout', 'wide'),
(675, 30, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(676, 30, '_menu_item_type', 'post_type'),
(677, 30, '_menu_item_menu_item_parent', '0'),
(678, 30, '_menu_item_object_id', '17'),
(679, 30, '_menu_item_object', 'page'),
(680, 30, '_menu_item_target', ''),
(681, 30, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(682, 30, '_menu_item_xfn', ''),
(683, 30, '_menu_item_url', ''),
(685, 30, '_menu_item_zozo_megamenu_menutype', 'page'),
(686, 30, '_menu_item_zozo_megamenu_status', ''),
(687, 30, '_menu_item_zozo_megamenu_fullwidth', ''),
(688, 30, '_menu_item_zozo_megamenu_columns', 'auto'),
(689, 30, '_menu_item_zozo_megamenu_title', ''),
(690, 30, '_menu_item_zozo_megamenu_link', ''),
(691, 30, '_menu_item_zozo_megamenu_widgetarea', '0'),
(692, 30, '_menu_item_zozo_megamenu_content', ''),
(693, 30, '_menu_item_zozo_megamenu_icon', ''),
(713, 32, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(714, 32, '_menu_item_type', 'post_type'),
(715, 32, '_menu_item_menu_item_parent', '0'),
(716, 32, '_menu_item_object_id', '7'),
(717, 32, '_menu_item_object', 'page'),
(718, 32, '_menu_item_target', ''),
(719, 32, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(720, 32, '_menu_item_xfn', ''),
(721, 32, '_menu_item_url', ''),
(723, 32, '_menu_item_zozo_megamenu_menutype', 'page'),
(724, 32, '_menu_item_zozo_megamenu_status', ''),
(725, 32, '_menu_item_zozo_megamenu_fullwidth', ''),
(726, 32, '_menu_item_zozo_megamenu_columns', 'auto'),
(727, 32, '_menu_item_zozo_megamenu_title', ''),
(728, 32, '_menu_item_zozo_megamenu_link', ''),
(729, 32, '_menu_item_zozo_megamenu_widgetarea', '0'),
(730, 32, '_menu_item_zozo_megamenu_content', ''),
(731, 32, '_menu_item_zozo_megamenu_icon', ''),
(732, 34, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(733, 34, '_edit_lock', '1540873003:1'),
(734, 34, '_edit_last', '1'),
(735, 34, '_wp_page_template', 'form-detail.php'),
(736, 34, 'zozo_page_top_padding', ''),
(737, 34, 'zozo_page_bottom_padding', ''),
(738, 34, 'zozo_slider_position', 'default'),
(739, 34, 'zozo_revolutionslider', ''),
(740, 34, 'zozo_show_header', 'yes'),
(741, 34, 'zozo_show_header_top_bar', 'default'),
(742, 34, 'zozo_show_header_sliding_bar', 'default'),
(743, 34, 'zozo_header_layout', 'default'),
(744, 34, 'zozo_header_type', 'default'),
(745, 34, 'zozo_header_toggle_position', 'default'),
(746, 34, 'zozo_header_transparency', 'default'),
(747, 34, 'zozo_header_skin', 'default'),
(748, 34, 'zozo_header_menu_skin', 'dark'),
(749, 34, 'zozo_custom_nav_menu', 'default'),
(750, 34, 'zozo_custom_mobile_menu', 'default'),
(751, 34, 'zozo_header_bg_image', ''),
(752, 34, 'zozo_header_bg_image_attach_id', ''),
(753, 34, 'zozo_header_bg_color', ''),
(754, 34, 'zozo_header_bg_opacity', '0'),
(755, 34, 'zozo_header_bg_repeat', ''),
(756, 34, 'zozo_header_bg_attachment', ''),
(757, 34, 'zozo_header_bg_postion', ''),
(758, 34, 'zozo_header_bg_full', '0'),
(759, 34, 'zozo_show_footer_widgets', 'default'),
(760, 34, 'zozo_show_footer_menu', 'default'),
(761, 34, 'zozo_primary_sidebar', '0'),
(762, 34, 'zozo_secondary_sidebar', '0'),
(763, 34, 'zozo_hide_page_title_bar', 'yes'),
(764, 34, 'zozo_hide_page_title', 'yes'),
(765, 34, 'zozo_page_title_type', 'default'),
(766, 34, 'zozo_page_title_skin', 'default'),
(767, 34, 'zozo_page_title_align', 'default'),
(768, 34, 'zozo_display_breadcrumbs', 'default'),
(769, 34, 'zozo_show_page_slogan', 'yes'),
(770, 34, 'zozo_page_slogan', ''),
(771, 34, 'zozo_page_title_height', ''),
(772, 34, 'zozo_page_title_mobile_height', ''),
(773, 34, 'zozo_page_title_bar_title_color', ''),
(774, 34, 'zozo_page_title_bar_slogan_color', ''),
(775, 34, 'zozo_page_breadcrumbs_color', ''),
(776, 34, 'zozo_page_title_bar_border_color', ''),
(777, 34, 'zozo_page_title_bar_bg', ''),
(778, 34, 'zozo_page_title_bar_bg_attach_id', ''),
(779, 34, 'zozo_page_title_bar_bg_color', ''),
(780, 34, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(781, 34, 'zozo_page_title_bar_bg_position', 'left top'),
(782, 34, 'zozo_page_title_bar_bg_parallax', 'no'),
(783, 34, 'zozo_page_title_bar_bg_full', '0'),
(784, 34, 'zozo_page_title_video_bg', '0'),
(785, 34, 'zozo_page_title_video_id', ''),
(786, 34, 'zozo_page_bg_image', ''),
(787, 34, 'zozo_page_bg_image_attach_id', ''),
(788, 34, 'zozo_page_bg_repeat', ''),
(789, 34, 'zozo_page_bg_attachment', ''),
(790, 34, 'zozo_page_bg_position', ''),
(791, 34, 'zozo_page_bg_color', ''),
(792, 34, 'zozo_page_bg_opacity', '0'),
(793, 34, 'zozo_page_bg_full', '0'),
(794, 34, 'zozo_body_bg_image', ''),
(795, 34, 'zozo_body_bg_image_attach_id', ''),
(796, 34, 'zozo_body_bg_repeat', ''),
(797, 34, 'zozo_body_bg_attachment', ''),
(798, 34, 'zozo_body_bg_position', ''),
(799, 34, 'zozo_body_bg_color', ''),
(800, 34, 'zozo_body_bg_opacity', '0'),
(801, 34, 'zozo_body_bg_full', '0'),
(802, 34, 'zozo_section_header_status', 'show'),
(803, 34, 'zozo_section_title', ''),
(804, 34, 'zozo_section_slogan', ''),
(805, 34, 'zozo_section_padding_top', ''),
(806, 34, 'zozo_section_padding_bottom', ''),
(807, 34, 'zozo_section_header_padding', ''),
(808, 34, 'zozo_section_title_color', ''),
(809, 34, 'zozo_section_slogan_color', ''),
(810, 34, 'zozo_section_text_color', ''),
(811, 34, 'zozo_section_content_heading_color', ''),
(812, 34, 'zozo_section_bg_color', ''),
(813, 34, 'zozo_parallax_status', 'no'),
(814, 34, 'zozo_parallax_bg_image', ''),
(815, 34, 'zozo_parallax_bg_image_attach_id', ''),
(816, 34, 'zozo_parallax_bg_repeat', ''),
(817, 34, 'zozo_parallax_bg_attachment', ''),
(818, 34, 'zozo_parallax_bg_postion', ''),
(819, 34, 'zozo_parallax_bg_size', ''),
(820, 34, 'zozo_parallax_bg_overlay', 'no'),
(821, 34, 'zozo_overlay_pattern_status', 'no'),
(822, 34, 'zozo_section_overlay_color', ''),
(823, 34, 'zozo_overlay_color_opacity', '0'),
(824, 34, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(825, 34, 'zozo_parallax_additional_sections_order', ''),
(826, 34, '_wpb_vc_js_status', 'false'),
(827, 34, 'zozo_theme_layout', 'wide'),
(830, 39, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(831, 39, '_edit_lock', '1540872926:1'),
(832, 39, '_edit_last', '1'),
(833, 39, '_wp_page_template', 'default'),
(834, 39, 'zozo_theme_layout', 'wide'),
(835, 39, 'zozo_page_top_padding', ''),
(836, 39, 'zozo_page_bottom_padding', ''),
(837, 39, 'zozo_slider_position', 'default'),
(838, 39, 'zozo_revolutionslider', ''),
(839, 39, 'zozo_show_header', 'yes'),
(840, 39, 'zozo_show_header_top_bar', 'default'),
(841, 39, 'zozo_show_header_sliding_bar', 'default'),
(842, 39, 'zozo_header_layout', 'default'),
(843, 39, 'zozo_header_type', 'default'),
(844, 39, 'zozo_header_toggle_position', 'left'),
(845, 39, 'zozo_header_transparency', 'default'),
(846, 39, 'zozo_header_skin', 'default'),
(847, 39, 'zozo_header_menu_skin', 'dark'),
(848, 39, 'zozo_custom_nav_menu', 'default'),
(849, 39, 'zozo_custom_mobile_menu', 'default'),
(850, 39, 'zozo_header_bg_image', ''),
(851, 39, 'zozo_header_bg_image_attach_id', ''),
(852, 39, 'zozo_header_bg_color', ''),
(853, 39, 'zozo_header_bg_opacity', '0'),
(854, 39, 'zozo_header_bg_repeat', ''),
(855, 39, 'zozo_header_bg_attachment', ''),
(856, 39, 'zozo_header_bg_postion', 'left center'),
(857, 39, 'zozo_header_bg_full', '0'),
(858, 39, 'zozo_show_footer_widgets', 'default'),
(859, 39, 'zozo_show_footer_menu', 'default'),
(860, 39, 'zozo_primary_sidebar', '0'),
(861, 39, 'zozo_secondary_sidebar', '0'),
(862, 39, 'zozo_hide_page_title_bar', 'yes'),
(863, 39, 'zozo_hide_page_title', 'yes'),
(864, 39, 'zozo_page_title_type', 'default'),
(865, 39, 'zozo_page_title_skin', 'default'),
(866, 39, 'zozo_page_title_align', 'default'),
(867, 39, 'zozo_display_breadcrumbs', 'default'),
(868, 39, 'zozo_show_page_slogan', 'yes'),
(869, 39, 'zozo_page_slogan', ''),
(870, 39, 'zozo_page_title_height', ''),
(871, 39, 'zozo_page_title_mobile_height', ''),
(872, 39, 'zozo_page_title_bar_title_color', ''),
(873, 39, 'zozo_page_title_bar_slogan_color', ''),
(874, 39, 'zozo_page_breadcrumbs_color', ''),
(875, 39, 'zozo_page_title_bar_border_color', ''),
(876, 39, 'zozo_page_title_bar_bg', ''),
(877, 39, 'zozo_page_title_bar_bg_attach_id', ''),
(878, 39, 'zozo_page_title_bar_bg_color', ''),
(879, 39, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(880, 39, 'zozo_page_title_bar_bg_position', 'left top'),
(881, 39, 'zozo_page_title_bar_bg_parallax', 'no'),
(882, 39, 'zozo_page_title_bar_bg_full', '0'),
(883, 39, 'zozo_page_title_video_bg', '0'),
(884, 39, 'zozo_page_title_video_id', ''),
(885, 39, 'zozo_page_bg_image', ''),
(886, 39, 'zozo_page_bg_image_attach_id', ''),
(887, 39, 'zozo_page_bg_repeat', ''),
(888, 39, 'zozo_page_bg_attachment', ''),
(889, 39, 'zozo_page_bg_position', ''),
(890, 39, 'zozo_page_bg_color', ''),
(891, 39, 'zozo_page_bg_opacity', '0'),
(892, 39, 'zozo_page_bg_full', '0'),
(893, 39, 'zozo_body_bg_image', ''),
(894, 39, 'zozo_body_bg_image_attach_id', ''),
(895, 39, 'zozo_body_bg_repeat', ''),
(896, 39, 'zozo_body_bg_attachment', ''),
(897, 39, 'zozo_body_bg_position', ''),
(898, 39, 'zozo_body_bg_color', ''),
(899, 39, 'zozo_body_bg_opacity', '0'),
(900, 39, 'zozo_body_bg_full', '0'),
(901, 39, 'zozo_section_header_status', 'show'),
(902, 39, 'zozo_section_title', ''),
(903, 39, 'zozo_section_slogan', ''),
(904, 39, 'zozo_section_padding_top', ''),
(905, 39, 'zozo_section_padding_bottom', ''),
(906, 39, 'zozo_section_header_padding', ''),
(907, 39, 'zozo_section_title_color', ''),
(908, 39, 'zozo_section_slogan_color', ''),
(909, 39, 'zozo_section_text_color', ''),
(910, 39, 'zozo_section_content_heading_color', ''),
(911, 39, 'zozo_section_bg_color', ''),
(912, 39, 'zozo_parallax_status', 'no'),
(913, 39, 'zozo_parallax_bg_image', ''),
(914, 39, 'zozo_parallax_bg_image_attach_id', ''),
(915, 39, 'zozo_parallax_bg_repeat', ''),
(916, 39, 'zozo_parallax_bg_attachment', ''),
(917, 39, 'zozo_parallax_bg_postion', ''),
(918, 39, 'zozo_parallax_bg_size', ''),
(919, 39, 'zozo_parallax_bg_overlay', 'no'),
(920, 39, 'zozo_overlay_pattern_status', 'no'),
(921, 39, 'zozo_section_overlay_color', ''),
(922, 39, 'zozo_overlay_color_opacity', '0'),
(923, 39, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(924, 39, 'zozo_parallax_additional_sections_order', ''),
(925, 39, '_wpb_vc_js_status', 'false'),
(926, 42, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(927, 42, '_menu_item_type', 'post_type'),
(928, 42, '_menu_item_menu_item_parent', '0'),
(929, 42, '_menu_item_object_id', '39'),
(930, 42, '_menu_item_object', 'page'),
(931, 42, '_menu_item_target', ''),
(932, 42, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(933, 42, '_menu_item_xfn', ''),
(934, 42, '_menu_item_url', ''),
(936, 42, '_menu_item_zozo_megamenu_menutype', 'page'),
(937, 42, '_menu_item_zozo_megamenu_status', ''),
(938, 42, '_menu_item_zozo_megamenu_fullwidth', ''),
(939, 42, '_menu_item_zozo_megamenu_columns', 'auto'),
(940, 42, '_menu_item_zozo_megamenu_title', ''),
(941, 42, '_menu_item_zozo_megamenu_link', ''),
(942, 42, '_menu_item_zozo_megamenu_widgetarea', '0'),
(943, 42, '_menu_item_zozo_megamenu_content', ''),
(944, 42, '_menu_item_zozo_megamenu_icon', ''),
(1065, 54, '_wp_attached_file', '2018/11/banner.jpg'),
(1066, 54, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1600;s:6:\"height\";i:1000;s:4:\"file\";s:18:\"2018/11/banner.jpg\";s:5:\"sizes\";a:12:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"banner-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"banner-300x188.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:188;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:18:\"banner-768x480.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:480;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:18:\"banner-600x600.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"blog-large\";a:4:{s:4:\"file\";s:19:\"banner-1170x500.jpg\";s:5:\"width\";i:1170;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"blog-medium\";a:4:{s:4:\"file\";s:18:\"banner-570x370.jpg\";s:5:\"width\";i:570;s:6:\"height\";i:370;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"blog-thumb\";a:4:{s:4:\"file\";s:16:\"banner-85x85.jpg\";s:5:\"width\";i:85;s:6:\"height\";i:85;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"theme-mid\";a:4:{s:4:\"file\";s:18:\"banner-500x320.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:4:\"team\";a:4:{s:4:\"file\";s:18:\"banner-500x500.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"portfolio-large\";a:4:{s:4:\"file\";s:19:\"banner-1000x695.jpg\";s:5:\"width\";i:1000;s:6:\"height\";i:695;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:16:\"portfolio-single\";a:4:{s:4:\"file\";s:19:\"banner-1300x500.jpg\";s:5:\"width\";i:1300;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"portfolio-mid\";a:4:{s:4:\"file\";s:18:\"banner-560x385.jpg\";s:5:\"width\";i:560;s:6:\"height\";i:385;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1067, 54, '_edit_lock', '1541089180:1'),
(1068, 55, '_wp_attached_file', '2018/11/ES.jpg'),
(1069, 55, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:3100;s:6:\"height\";i:2059;s:4:\"file\";s:14:\"2018/11/ES.jpg\";s:5:\"sizes\";a:12:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:14:\"ES-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:14:\"ES-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:14:\"ES-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:14:\"ES-600x600.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"blog-large\";a:4:{s:4:\"file\";s:15:\"ES-1170x500.jpg\";s:5:\"width\";i:1170;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"blog-medium\";a:4:{s:4:\"file\";s:14:\"ES-570x370.jpg\";s:5:\"width\";i:570;s:6:\"height\";i:370;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"blog-thumb\";a:4:{s:4:\"file\";s:12:\"ES-85x85.jpg\";s:5:\"width\";i:85;s:6:\"height\";i:85;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"theme-mid\";a:4:{s:4:\"file\";s:14:\"ES-500x320.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:4:\"team\";a:4:{s:4:\"file\";s:14:\"ES-500x500.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"portfolio-large\";a:4:{s:4:\"file\";s:15:\"ES-1000x695.jpg\";s:5:\"width\";i:1000;s:6:\"height\";i:695;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:16:\"portfolio-single\";a:4:{s:4:\"file\";s:15:\"ES-1300x500.jpg\";s:5:\"width\";i:1300;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"portfolio-mid\";a:4:{s:4:\"file\";s:14:\"ES-560x385.jpg\";s:5:\"width\";i:560;s:6:\"height\";i:385;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1070, 56, '_wp_attached_file', '2018/11/IS.jpg'),
(1071, 56, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:555;s:6:\"height\";i:300;s:4:\"file\";s:14:\"2018/11/IS.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:14:\"IS-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:14:\"IS-300x162.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:162;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"blog-thumb\";a:4:{s:4:\"file\";s:12:\"IS-85x85.jpg\";s:5:\"width\";i:85;s:6:\"height\";i:85;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"theme-mid\";a:4:{s:4:\"file\";s:14:\"IS-500x300.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:4:\"team\";a:4:{s:4:\"file\";s:14:\"IS-500x300.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1072, 57, '_wp_attached_file', '2018/11/JS.png'),
(1073, 57, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:225;s:6:\"height\";i:225;s:4:\"file\";s:14:\"2018/11/JS.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:14:\"JS-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:10:\"blog-thumb\";a:4:{s:4:\"file\";s:12:\"JS-85x85.png\";s:5:\"width\";i:85;s:6:\"height\";i:85;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1074, 56, '_edit_lock', '1541185200:1'),
(1075, 55, '_edit_lock', '1541185200:1'),
(1076, 57, '_edit_lock', '1541185201:1'),
(1078, 59, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(1079, 59, '_edit_lock', '1541332623:1'),
(1080, 59, '_edit_last', '1'),
(1081, 59, '_wp_page_template', 'result-filter.php'),
(1082, 59, 'zozo_theme_layout', 'wide'),
(1083, 59, 'zozo_page_top_padding', ''),
(1084, 59, 'zozo_page_bottom_padding', ''),
(1085, 59, 'zozo_slider_position', 'default'),
(1086, 59, 'zozo_revolutionslider', ''),
(1087, 59, 'zozo_show_header', 'yes'),
(1088, 59, 'zozo_show_header_top_bar', 'yes'),
(1089, 59, 'zozo_show_header_sliding_bar', 'default'),
(1090, 59, 'zozo_header_layout', 'default'),
(1091, 59, 'zozo_header_type', 'default'),
(1092, 59, 'zozo_header_toggle_position', 'default'),
(1093, 59, 'zozo_header_transparency', 'default'),
(1094, 59, 'zozo_header_skin', 'default'),
(1095, 59, 'zozo_header_menu_skin', 'light'),
(1096, 59, 'zozo_custom_nav_menu', 'default'),
(1097, 59, 'zozo_custom_mobile_menu', 'default'),
(1098, 59, 'zozo_header_bg_image', ''),
(1099, 59, 'zozo_header_bg_image_attach_id', ''),
(1100, 59, 'zozo_header_bg_color', ''),
(1101, 59, 'zozo_header_bg_opacity', '0'),
(1102, 59, 'zozo_header_bg_repeat', ''),
(1103, 59, 'zozo_header_bg_attachment', ''),
(1104, 59, 'zozo_header_bg_postion', ''),
(1105, 59, 'zozo_header_bg_full', '0'),
(1106, 59, 'zozo_show_footer_widgets', 'default'),
(1107, 59, 'zozo_show_footer_menu', 'default'),
(1108, 59, 'zozo_primary_sidebar', '0'),
(1109, 59, 'zozo_secondary_sidebar', '0'),
(1110, 59, 'zozo_hide_page_title_bar', 'yes'),
(1111, 59, 'zozo_hide_page_title', 'yes'),
(1112, 59, 'zozo_page_title_type', 'default'),
(1113, 59, 'zozo_page_title_skin', 'default'),
(1114, 59, 'zozo_page_title_align', 'default'),
(1115, 59, 'zozo_display_breadcrumbs', 'default'),
(1116, 59, 'zozo_show_page_slogan', 'yes'),
(1117, 59, 'zozo_page_slogan', ''),
(1118, 59, 'zozo_page_title_height', ''),
(1119, 59, 'zozo_page_title_mobile_height', ''),
(1120, 59, 'zozo_page_title_bar_title_color', ''),
(1121, 59, 'zozo_page_title_bar_slogan_color', ''),
(1122, 59, 'zozo_page_breadcrumbs_color', ''),
(1123, 59, 'zozo_page_title_bar_border_color', ''),
(1124, 59, 'zozo_page_title_bar_bg', ''),
(1125, 59, 'zozo_page_title_bar_bg_attach_id', ''),
(1126, 59, 'zozo_page_title_bar_bg_color', ''),
(1127, 59, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(1128, 59, 'zozo_page_title_bar_bg_position', 'left top'),
(1129, 59, 'zozo_page_title_bar_bg_parallax', 'no'),
(1130, 59, 'zozo_page_title_bar_bg_full', '0'),
(1131, 59, 'zozo_page_title_video_bg', '0'),
(1132, 59, 'zozo_page_title_video_id', ''),
(1133, 59, 'zozo_page_bg_image', ''),
(1134, 59, 'zozo_page_bg_image_attach_id', ''),
(1135, 59, 'zozo_page_bg_repeat', ''),
(1136, 59, 'zozo_page_bg_attachment', ''),
(1137, 59, 'zozo_page_bg_position', ''),
(1138, 59, 'zozo_page_bg_color', ''),
(1139, 59, 'zozo_page_bg_opacity', '0'),
(1140, 59, 'zozo_page_bg_full', '0'),
(1141, 59, 'zozo_body_bg_image', ''),
(1142, 59, 'zozo_body_bg_image_attach_id', ''),
(1143, 59, 'zozo_body_bg_repeat', ''),
(1144, 59, 'zozo_body_bg_attachment', ''),
(1145, 59, 'zozo_body_bg_position', ''),
(1146, 59, 'zozo_body_bg_color', ''),
(1147, 59, 'zozo_body_bg_opacity', '0'),
(1148, 59, 'zozo_body_bg_full', '0'),
(1149, 59, 'zozo_section_header_status', 'show'),
(1150, 59, 'zozo_section_title', ''),
(1151, 59, 'zozo_section_slogan', ''),
(1152, 59, 'zozo_section_padding_top', ''),
(1153, 59, 'zozo_section_padding_bottom', ''),
(1154, 59, 'zozo_section_header_padding', ''),
(1155, 59, 'zozo_section_title_color', ''),
(1156, 59, 'zozo_section_slogan_color', ''),
(1157, 59, 'zozo_section_text_color', ''),
(1158, 59, 'zozo_section_content_heading_color', ''),
(1159, 59, 'zozo_section_bg_color', ''),
(1160, 59, 'zozo_parallax_status', 'no'),
(1161, 59, 'zozo_parallax_bg_image', ''),
(1162, 59, 'zozo_parallax_bg_image_attach_id', ''),
(1163, 59, 'zozo_parallax_bg_repeat', ''),
(1164, 59, 'zozo_parallax_bg_attachment', ''),
(1165, 59, 'zozo_parallax_bg_postion', ''),
(1166, 59, 'zozo_parallax_bg_size', ''),
(1167, 59, 'zozo_parallax_bg_overlay', 'no'),
(1168, 59, 'zozo_overlay_pattern_status', 'no'),
(1169, 59, 'zozo_section_overlay_color', ''),
(1170, 59, 'zozo_overlay_color_opacity', '0'),
(1171, 59, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(1172, 59, 'zozo_parallax_additional_sections_order', ''),
(1173, 59, '_wpb_vc_js_status', 'false'),
(1182, 1, '_wp_trash_meta_status', 'publish'),
(1183, 1, '_wp_trash_meta_time', '1544028068'),
(1184, 1, '_wp_desired_post_slug', 'hello-world'),
(1185, 1, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(1186, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:\"1\";}'),
(1188, 66, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(1189, 66, '_edit_lock', '1544526967:1'),
(1190, 67, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(1191, 68, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(1192, 68, '_edit_lock', '1544527485:1'),
(1193, 69, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(1194, 70, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(1195, 71, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(1196, 72, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(1197, 72, '_edit_lock', '1544531172:1'),
(1198, 72, '_edit_last', '1'),
(1199, 72, '_wp_page_template', 'default'),
(1200, 72, 'zozo_page_top_padding', ''),
(1201, 72, 'zozo_page_bottom_padding', ''),
(1202, 72, 'zozo_slider_position', 'default'),
(1203, 72, 'zozo_revolutionslider', ''),
(1204, 72, 'zozo_show_header', 'yes'),
(1205, 72, 'zozo_show_header_top_bar', 'default'),
(1206, 72, 'zozo_show_header_sliding_bar', 'default'),
(1207, 72, 'zozo_header_layout', 'default'),
(1208, 72, 'zozo_header_type', 'default'),
(1209, 72, 'zozo_header_toggle_position', 'default'),
(1210, 72, 'zozo_header_transparency', 'default'),
(1211, 72, 'zozo_header_skin', 'default'),
(1212, 72, 'zozo_header_menu_skin', 'default'),
(1213, 72, 'zozo_custom_nav_menu', 'default'),
(1214, 72, 'zozo_custom_mobile_menu', 'default'),
(1215, 72, 'zozo_header_bg_image', ''),
(1216, 72, 'zozo_header_bg_image_attach_id', ''),
(1217, 72, 'zozo_header_bg_color', ''),
(1218, 72, 'zozo_header_bg_opacity', '0'),
(1219, 72, 'zozo_header_bg_repeat', ''),
(1220, 72, 'zozo_header_bg_attachment', ''),
(1221, 72, 'zozo_header_bg_postion', ''),
(1222, 72, 'zozo_header_bg_full', '0'),
(1223, 72, 'zozo_show_footer_widgets', 'default'),
(1224, 72, 'zozo_show_footer_menu', 'default'),
(1225, 72, 'zozo_primary_sidebar', '0'),
(1226, 72, 'zozo_secondary_sidebar', '0'),
(1227, 72, 'zozo_hide_page_title_bar', 'no'),
(1228, 72, 'zozo_hide_page_title', 'no'),
(1229, 72, 'zozo_page_title_type', 'default'),
(1230, 72, 'zozo_page_title_skin', 'default'),
(1231, 72, 'zozo_page_title_align', 'default'),
(1232, 72, 'zozo_display_breadcrumbs', 'default'),
(1233, 72, 'zozo_show_page_slogan', 'yes'),
(1234, 72, 'zozo_page_slogan', ''),
(1235, 72, 'zozo_page_title_height', ''),
(1236, 72, 'zozo_page_title_mobile_height', ''),
(1237, 72, 'zozo_page_title_bar_title_color', ''),
(1238, 72, 'zozo_page_title_bar_slogan_color', ''),
(1239, 72, 'zozo_page_breadcrumbs_color', ''),
(1240, 72, 'zozo_page_title_bar_border_color', ''),
(1241, 72, 'zozo_page_title_bar_bg', ''),
(1242, 72, 'zozo_page_title_bar_bg_attach_id', ''),
(1243, 72, 'zozo_page_title_bar_bg_color', ''),
(1244, 72, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(1245, 72, 'zozo_page_title_bar_bg_position', 'left top'),
(1246, 72, 'zozo_page_title_bar_bg_parallax', 'no'),
(1247, 72, 'zozo_page_title_bar_bg_full', '0'),
(1248, 72, 'zozo_page_title_video_bg', '0'),
(1249, 72, 'zozo_page_title_video_id', ''),
(1250, 72, 'zozo_page_bg_image', ''),
(1251, 72, 'zozo_page_bg_image_attach_id', ''),
(1252, 72, 'zozo_page_bg_repeat', ''),
(1253, 72, 'zozo_page_bg_attachment', ''),
(1254, 72, 'zozo_page_bg_position', ''),
(1255, 72, 'zozo_page_bg_color', ''),
(1256, 72, 'zozo_page_bg_opacity', '0'),
(1257, 72, 'zozo_page_bg_full', '0'),
(1258, 72, 'zozo_body_bg_image', ''),
(1259, 72, 'zozo_body_bg_image_attach_id', ''),
(1260, 72, 'zozo_body_bg_repeat', ''),
(1261, 72, 'zozo_body_bg_attachment', ''),
(1262, 72, 'zozo_body_bg_position', ''),
(1263, 72, 'zozo_body_bg_color', ''),
(1264, 72, 'zozo_body_bg_opacity', '0'),
(1265, 72, 'zozo_body_bg_full', '0'),
(1266, 72, 'zozo_section_header_status', 'show'),
(1267, 72, 'zozo_section_title', ''),
(1268, 72, 'zozo_section_slogan', ''),
(1269, 72, 'zozo_section_padding_top', ''),
(1270, 72, 'zozo_section_padding_bottom', ''),
(1271, 72, 'zozo_section_header_padding', ''),
(1272, 72, 'zozo_section_title_color', ''),
(1273, 72, 'zozo_section_slogan_color', ''),
(1274, 72, 'zozo_section_text_color', ''),
(1275, 72, 'zozo_section_content_heading_color', ''),
(1276, 72, 'zozo_section_bg_color', ''),
(1277, 72, 'zozo_parallax_status', 'no'),
(1278, 72, 'zozo_parallax_bg_image', ''),
(1279, 72, 'zozo_parallax_bg_image_attach_id', ''),
(1280, 72, 'zozo_parallax_bg_repeat', ''),
(1281, 72, 'zozo_parallax_bg_attachment', ''),
(1282, 72, 'zozo_parallax_bg_postion', ''),
(1283, 72, 'zozo_parallax_bg_size', ''),
(1284, 72, 'zozo_parallax_bg_overlay', 'no'),
(1285, 72, 'zozo_overlay_pattern_status', 'no'),
(1286, 72, 'zozo_section_overlay_color', ''),
(1287, 72, 'zozo_overlay_color_opacity', '0'),
(1288, 72, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(1289, 72, 'zozo_parallax_additional_sections_order', ''),
(1290, 72, '_wpb_vc_js_status', 'false'),
(1291, 72, '_wp_trash_meta_status', 'publish'),
(1292, 72, '_wp_trash_meta_time', '1544531319'),
(1293, 72, '_wp_desired_post_slug', 'dsdasd'),
(1294, 74, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(1295, 74, '_menu_item_type', 'post_type'),
(1296, 74, '_menu_item_menu_item_parent', '0'),
(1297, 74, '_menu_item_object_id', '39'),
(1298, 74, '_menu_item_object', 'page'),
(1299, 74, '_menu_item_target', ''),
(1300, 74, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1301, 74, '_menu_item_xfn', ''),
(1302, 74, '_menu_item_url', ''),
(1304, 74, '_menu_item_zozo_megamenu_menutype', 'page'),
(1305, 74, '_menu_item_zozo_megamenu_status', ''),
(1306, 74, '_menu_item_zozo_megamenu_fullwidth', ''),
(1307, 74, '_menu_item_zozo_megamenu_columns', 'auto'),
(1308, 74, '_menu_item_zozo_megamenu_title', ''),
(1309, 74, '_menu_item_zozo_megamenu_link', ''),
(1310, 74, '_menu_item_zozo_megamenu_widgetarea', '0'),
(1311, 74, '_menu_item_zozo_megamenu_content', ''),
(1312, 74, '_menu_item_zozo_megamenu_icon', ''),
(1313, 75, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(1314, 75, '_menu_item_type', 'post_type'),
(1315, 75, '_menu_item_menu_item_parent', '0'),
(1316, 75, '_menu_item_object_id', '7'),
(1317, 75, '_menu_item_object', 'page'),
(1318, 75, '_menu_item_target', ''),
(1319, 75, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1320, 75, '_menu_item_xfn', ''),
(1321, 75, '_menu_item_url', ''),
(1323, 75, '_menu_item_zozo_megamenu_menutype', 'page'),
(1324, 75, '_menu_item_zozo_megamenu_status', ''),
(1325, 75, '_menu_item_zozo_megamenu_fullwidth', ''),
(1326, 75, '_menu_item_zozo_megamenu_columns', 'auto'),
(1327, 75, '_menu_item_zozo_megamenu_title', ''),
(1328, 75, '_menu_item_zozo_megamenu_link', ''),
(1329, 75, '_menu_item_zozo_megamenu_widgetarea', '0'),
(1330, 75, '_menu_item_zozo_megamenu_content', ''),
(1331, 75, '_menu_item_zozo_megamenu_icon', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-10-13 14:08:58', '2018-10-13 14:08:58', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'trash', 'open', 'open', '', 'hello-world__trashed', '', '', '2018-12-05 16:41:08', '2018-12-05 16:41:08', '', 0, 'http://localhost/studentservice/?p=1', 0, 'post', '', 1),
(7, 1, '2018-10-13 14:20:22', '2018-10-13 14:20:22', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2018-10-30 04:06:24', '2018-10-30 04:06:24', '', 0, 'http://localhost/studentservice/?page_id=7', 0, 'page', '', 0),
(8, 1, '2018-10-13 14:20:22', '2018-10-13 14:20:22', '', 'Home', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2018-10-13 14:20:22', '2018-10-13 14:20:22', '', 7, 'http://localhost/studentservice/index.php/2018/10/13/7-revision-v1/', 0, 'revision', '', 0),
(13, 1, '2018-10-13 16:57:11', '2018-10-13 16:57:11', '', 'callback', '', 'publish', 'closed', 'closed', '', 'callback', '', '', '2018-10-13 16:57:11', '2018-10-13 16:57:11', '', 0, 'http://localhost/studentservice/?page_id=13', 0, 'page', '', 0),
(14, 1, '2018-10-13 16:57:11', '2018-10-13 16:57:11', '', 'callback', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2018-10-13 16:57:11', '2018-10-13 16:57:11', '', 13, 'http://localhost/studentservice/index.php/2018/10/13/13-revision-v1/', 0, 'revision', '', 0),
(15, 1, '2018-10-13 16:57:26', '2018-10-13 16:57:26', '', 'login', '', 'publish', 'closed', 'closed', '', 'login', '', '', '2018-10-30 04:16:36', '2018-10-30 04:16:36', '', 0, 'http://localhost/studentservice/?page_id=15', 0, 'page', '', 0),
(16, 1, '2018-10-13 16:57:26', '2018-10-13 16:57:26', '', 'login', '', 'inherit', 'closed', 'closed', '', '15-revision-v1', '', '', '2018-10-13 16:57:26', '2018-10-13 16:57:26', '', 15, 'http://localhost/studentservice/index.php/2018/10/13/15-revision-v1/', 0, 'revision', '', 0),
(17, 1, '2018-10-13 17:00:35', '2018-10-13 17:00:35', '', 'profile', '', 'publish', 'closed', 'closed', '', 'profile', '', '', '2018-10-30 04:16:12', '2018-10-30 04:16:12', '', 0, 'http://localhost/studentservice/?page_id=17', 0, 'page', '', 0),
(18, 1, '2018-10-13 17:00:35', '2018-10-13 17:00:35', '', 'profile', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2018-10-13 17:00:35', '2018-10-13 17:00:35', '', 17, 'http://localhost/studentservice/17-revision-v1/', 0, 'revision', '', 0),
(27, 1, '2018-10-24 01:14:22', '2018-10-24 01:14:22', '', 'user', '', 'publish', 'closed', 'closed', '', 'user', '', '', '2018-10-30 04:16:24', '2018-10-30 04:16:24', '', 0, 'http://localhost/studentservice/?page_id=27', 0, 'page', '', 0),
(28, 1, '2018-10-24 01:13:23', '2018-10-24 01:13:23', '', 'user-profile', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2018-10-24 01:13:23', '2018-10-24 01:13:23', '', 27, 'http://localhost/studentservice/27-revision-v1/', 0, 'revision', '', 0),
(30, 1, '2018-10-24 01:20:34', '2018-10-24 01:20:34', ' ', '', '', 'publish', 'closed', 'closed', '', '30', '', '', '2018-10-29 15:58:23', '2018-10-29 15:58:23', '', 0, 'http://localhost/studentservice/?p=30', 2, 'nav_menu_item', '', 0),
(32, 1, '2018-10-24 01:20:34', '2018-10-24 01:20:34', ' ', '', '', 'publish', 'closed', 'closed', '', '32', '', '', '2018-10-29 15:58:23', '2018-10-29 15:58:23', '', 0, 'http://localhost/studentservice/?p=32', 1, 'nav_menu_item', '', 0),
(33, 1, '2018-10-26 06:23:42', '2018-10-26 06:23:42', '', 'user', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2018-10-26 06:23:42', '2018-10-26 06:23:42', '', 27, 'http://localhost/studentservice/27-revision-v1/', 0, 'revision', '', 0),
(34, 1, '2018-10-26 06:23:57', '2018-10-26 06:23:57', '', 'Form Detail', '', 'publish', 'closed', 'closed', '', 'form-detail', '', '', '2018-10-30 04:16:00', '2018-10-30 04:16:00', '', 0, 'http://localhost/studentservice/?page_id=34', 0, 'page', '', 0),
(35, 1, '2018-10-26 06:23:57', '2018-10-26 06:23:57', '', 'form', '', 'inherit', 'closed', 'closed', '', '34-revision-v1', '', '', '2018-10-26 06:23:57', '2018-10-26 06:23:57', '', 34, 'http://localhost/studentservice/34-revision-v1/', 0, 'revision', '', 0),
(36, 1, '2018-10-26 07:02:59', '2018-10-26 07:02:59', '', 'Form Detail', '', 'inherit', 'closed', 'closed', '', '34-revision-v1', '', '', '2018-10-26 07:02:59', '2018-10-26 07:02:59', '', 34, 'http://localhost/studentservice/34-revision-v1/', 0, 'revision', '', 0),
(39, 1, '2018-10-29 15:53:44', '2018-10-29 15:53:44', '', 'Forum', '', 'publish', 'closed', 'closed', '', 'forum', '', '', '2018-10-30 04:15:22', '2018-10-30 04:15:22', '', 0, 'http://localhost/studentservice/?page_id=39', 0, 'page', '', 0),
(40, 1, '2018-10-29 15:53:44', '2018-10-29 15:53:44', '', 'Forum', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2018-10-29 15:53:44', '2018-10-29 15:53:44', '', 39, 'http://localhost/studentservice/39-revision-v1/', 0, 'revision', '', 0),
(41, 1, '2018-10-29 15:54:31', '2018-10-29 15:54:31', '', 'Forum', '', 'inherit', 'closed', 'closed', '', '39-autosave-v1', '', '', '2018-10-29 15:54:31', '2018-10-29 15:54:31', '', 39, 'http://localhost/studentservice/39-autosave-v1/', 0, 'revision', '', 0),
(42, 1, '2018-10-29 15:58:23', '2018-10-29 15:58:23', ' ', '', '', 'publish', 'closed', 'closed', '', '42', '', '', '2018-10-29 15:58:23', '2018-10-29 15:58:23', '', 0, 'http://localhost/studentservice/?p=42', 3, 'nav_menu_item', '', 0),
(49, 1, '2018-10-30 04:06:10', '2018-10-30 04:06:10', '', 'Home', '', 'inherit', 'closed', 'closed', '', '7-autosave-v1', '', '', '2018-10-30 04:06:10', '2018-10-30 04:06:10', '', 7, 'http://localhost/studentservice/7-autosave-v1/', 0, 'revision', '', 0),
(54, 1, '2018-11-01 11:39:14', '2018-11-01 11:39:14', '', 'banner', '', 'inherit', 'open', 'closed', '', 'banner', '', '', '2018-11-01 11:39:14', '2018-11-01 11:39:14', '', 0, 'http://localhost/studentservice/wp-content/uploads/2018/11/banner.jpg', 0, 'attachment', 'image/jpeg', 0),
(55, 1, '2018-11-02 18:53:09', '2018-11-02 18:53:09', '', 'ES', '', 'inherit', 'open', 'closed', '', 'es', '', '', '2018-11-02 18:53:09', '2018-11-02 18:53:09', '', 0, 'http://localhost/studentservice/wp-content/uploads/2018/11/ES.jpg', 0, 'attachment', 'image/jpeg', 0),
(56, 1, '2018-11-02 18:53:17', '2018-11-02 18:53:17', '', 'IS', '', 'inherit', 'open', 'closed', '', 'is', '', '', '2018-11-02 18:53:17', '2018-11-02 18:53:17', '', 0, 'http://localhost/studentservice/wp-content/uploads/2018/11/IS.jpg', 0, 'attachment', 'image/jpeg', 0),
(57, 1, '2018-11-02 18:53:22', '2018-11-02 18:53:22', '', 'JS', '', 'inherit', 'open', 'closed', '', 'js', '', '', '2018-11-02 18:53:22', '2018-11-02 18:53:22', '', 0, 'http://localhost/studentservice/wp-content/uploads/2018/11/JS.png', 0, 'attachment', 'image/png', 0),
(59, 1, '2018-11-03 02:58:51', '2018-11-03 02:58:51', '', 'search-form', '', 'publish', 'closed', 'closed', '', 'search-form', '', '', '2018-11-04 11:51:33', '2018-11-04 11:51:33', '', 0, 'http://localhost/studentservice/?page_id=59', 0, 'page', '', 0),
(60, 1, '2018-11-03 02:58:51', '2018-11-03 02:58:51', '', 'search-form', '', 'inherit', 'closed', 'closed', '', '59-revision-v1', '', '', '2018-11-03 02:58:51', '2018-11-03 02:58:51', '', 59, 'http://localhost/studentservice/59-revision-v1/', 0, 'revision', '', 0),
(64, 1, '2018-12-05 16:41:08', '2018-12-05 16:41:08', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2018-12-05 16:41:08', '2018-12-05 16:41:08', '', 1, 'http://localhost/studentservice/1-revision-v1/', 0, 'revision', '', 0),
(66, 1, '2018-12-11 11:15:50', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-12-11 11:15:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/studentservice/?p=66', 0, 'post', '', 0),
(67, 1, '2018-12-11 11:22:56', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-12-11 11:22:56', '0000-00-00 00:00:00', '', 0, 'http://localhost/studentservice/?p=67', 0, 'post', '', 0),
(68, 1, '2018-12-11 11:23:43', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-12-11 11:23:43', '0000-00-00 00:00:00', '', 0, 'http://localhost/studentservice/?p=68', 0, 'post', '', 0),
(69, 1, '2018-12-11 11:24:26', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-12-11 11:24:26', '0000-00-00 00:00:00', '', 0, 'http://localhost/studentservice/?p=69', 0, 'post', '', 0),
(70, 1, '2018-12-11 11:27:17', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-12-11 11:27:17', '0000-00-00 00:00:00', '', 0, 'http://localhost/studentservice/?page_id=70', 0, 'page', '', 0),
(71, 1, '2018-12-11 11:27:25', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-12-11 11:27:25', '0000-00-00 00:00:00', '', 0, 'http://localhost/studentservice/?page_id=71', 0, 'page', '', 0),
(72, 1, '2018-12-11 12:28:26', '2018-12-11 12:28:26', 'adsdadsa', 'dsdasd', '', 'trash', 'closed', 'closed', '', 'dsdasd__trashed', '', '', '2018-12-11 12:28:39', '2018-12-11 12:28:39', '', 0, 'http://localhost/studentservice/?page_id=72', 0, 'page', '', 0),
(73, 1, '2018-12-11 12:28:26', '2018-12-11 12:28:26', 'adsdadsa', 'dsdasd', '', 'inherit', 'closed', 'closed', '', '72-revision-v1', '', '', '2018-12-11 12:28:26', '2018-12-11 12:28:26', '', 72, 'http://localhost/studentservice/72-revision-v1/', 0, 'revision', '', 0),
(74, 1, '2018-12-15 12:22:48', '2018-12-15 12:22:48', ' ', '', '', 'publish', 'closed', 'closed', '', '74', '', '', '2018-12-15 12:22:48', '2018-12-15 12:22:48', '', 0, 'http://localhost/studentservice/?p=74', 2, 'nav_menu_item', '', 0),
(75, 1, '2018-12-15 12:22:48', '2018-12-15 12:22:48', ' ', '', '', 'publish', 'closed', 'closed', '', '75', '', '', '2018-12-15 12:22:48', '2018-12-15 12:22:48', '', 0, 'http://localhost/studentservice/?p=75', 1, 'nav_menu_item', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_request`
--

CREATE TABLE `wp_request` (
  `ID` bigint(20) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `request` int(1) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `time_request` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_request`
--

INSERT INTO `wp_request` (`ID`, `form_id`, `member_id`, `request`, `message`, `time_request`) VALUES
(59, 131, 105, 0, '', '2018-12-10 14:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `wp_semester`
--

CREATE TABLE `wp_semester` (
  `ID` bigint(20) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_semester`
--

INSERT INTO `wp_semester` (`ID`, `name`, `start`, `end`, `status`) VALUES
(1, 'FALL 2018', '2018-09-07', '2018-12-25', 1),
(2, 'SPRING 2019', '2019-01-01', '2019-03-25', 0),
(3, 'SUMMER 2019', '2019-04-01', '2019-08-25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_semester_level`
--

CREATE TABLE `wp_semester_level` (
  `ID` int(11) NOT NULL,
  `level` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_semester_level`
--

INSERT INTO `wp_semester_level` (`ID`, `level`) VALUES
(1, '8_A'),
(2, '8_B'),
(3, '8_C'),
(4, '9_A'),
(5, '9_B'),
(6, '9_C'),
(7, '10_A'),
(8, '10_B'),
(9, '10_C'),
(10, '11_A'),
(11, '11_B'),
(12, '11_C'),
(13, '12_A'),
(14, '12_B'),
(15, '12_C'),
(16, '13_A'),
(17, '13_B'),
(18, '13_C'),
(19, '14_A'),
(20, '14_B'),
(21, '14_C');

-- --------------------------------------------------------

--
-- Table structure for table `wp_skill_major`
--

CREATE TABLE `wp_skill_major` (
  `ID` bigint(20) NOT NULL,
  `major_id` bigint(20) NOT NULL,
  `subject_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_skill_major`
--

INSERT INTO `wp_skill_major` (`ID`, `major_id`, `subject_code`, `name`) VALUES
(1, 1, 'PM', 'Project Manager'),
(2, 1, 'QA', 'Quantity Assurance'),
(3, 1, 'DEV', 'Developer'),
(4, 1, 'DOC', 'Document writer'),
(5, 2, 'PM', 'Project Manager'),
(6, 2, 'QA', 'Quantity Assurance'),
(7, 2, 'DEV', 'Developer'),
(8, 2, 'DOC', 'Document writer'),
(9, 3, 'PM', 'Project Manager'),
(10, 3, 'QA', 'Quantity Assurance'),
(11, 3, 'DEV', 'Developer'),
(12, 3, 'DOC', 'Document writer'),
(13, 4, 'PM', 'Project Manager'),
(14, 4, 'QA', 'Quantity Assurance'),
(15, 4, 'DEV', 'Developer'),
(16, 4, 'DOC', 'Document writer');

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'My_menu', 'my_menu', 0),
(3, 'mobile version', 'mobile-version', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(30, 3, 0),
(32, 3, 0),
(42, 3, 0),
(74, 2, 0),
(75, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'nav_menu', '', 0, 2),
(3, 3, 'nav_menu', '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy,vc_pointers_backend_editor,theme_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'wp_user-settings', 'editor=tinymce&post_dfw=off&mfold=o'),
(18, 1, 'wp_user-settings-time', '1544526905'),
(19, 1, 'wp_dashboard_quick_press_last_post_id', '65'),
(20, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(21, 1, 'metaboxhidden_nav-menus', 'a:11:{i:0;s:28:\"add-post-type-zozo_portfolio\";i:1;s:27:\"add-post-type-zozo_services\";i:2;s:30:\"add-post-type-zozo_testimonial\";i:3;s:30:\"add-post-type-zozo_team_member\";i:4;s:12:\"add-post_tag\";i:5;s:15:\"add-post_format\";i:6;s:24:\"add-portfolio_categories\";i:7;s:18:\"add-portfolio_tags\";i:8;s:22:\"add-service_categories\";i:9;s:26:\"add-testimonial_categories\";i:10;s:19:\"add-team_categories\";}'),
(40, 1, 'nav_menu_recently_edited', '2'),
(311, 1, 'wp_media_library_mode', 'list'),
(312, 122, 'nickname', 'huylvse03982'),
(313, 122, 'first_name', ''),
(314, 122, 'last_name', ''),
(315, 122, 'description', ''),
(316, 122, 'rich_editing', 'true'),
(317, 122, 'syntax_highlighting', 'true'),
(318, 122, 'comment_shortcuts', 'false'),
(319, 122, 'admin_color', 'fresh'),
(320, 122, 'use_ssl', '0'),
(321, 122, 'show_admin_bar_front', 'true'),
(322, 122, 'locale', ''),
(323, 122, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(324, 122, 'wp_user_level', '0'),
(325, 122, 'session_tokens', 'a:4:{s:64:\"2d91948cbe98b70d79282a7481237786bb4e9d6ecc9f69561b44add7b2d780e1\";a:4:{s:10:\"expiration\";i:1543940539;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36\";s:5:\"login\";i:1542730939;}s:64:\"30a6368bb433a5b5dfb906c9faf924e1fce95fbc612fa5e6a49eb092988ff73c\";a:4:{s:10:\"expiration\";i:1544067939;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36\";s:5:\"login\";i:1542858339;}s:64:\"f29f227528c777fbd57a0ef60c595032ee5c5ac162ec69f488cfccac71795580\";a:4:{s:10:\"expiration\";i:1544878137;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1543668537;}s:64:\"0865d694de3d6ac7f0cdf78a0279587b797200ce9e667bea03ba48b86cd1a4ff\";a:4:{s:10:\"expiration\";i:1545146730;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1543937130;}}'),
(326, 123, 'nickname', 'trangntksb02397'),
(327, 123, 'first_name', ''),
(328, 123, 'last_name', ''),
(329, 123, 'description', ''),
(330, 123, 'rich_editing', 'true'),
(331, 123, 'syntax_highlighting', 'true'),
(332, 123, 'comment_shortcuts', 'false'),
(333, 123, 'admin_color', 'fresh'),
(334, 123, 'use_ssl', '0'),
(335, 123, 'show_admin_bar_front', 'true'),
(336, 123, 'locale', ''),
(337, 123, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(338, 123, 'wp_user_level', '0'),
(342, 1, 'tgmpa_dismissed_notice_tgmpa', '1'),
(345, 123, 'session_tokens', 'a:1:{s:64:\"aee393d95862afce9f0fce68a84bee4fbbbd4275fe61fb7305f9a84def60a97a\";a:4:{s:10:\"expiration\";i:1545036320;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1543826720;}}'),
(347, 115, 'nickname', 'trangntksb02397'),
(348, 115, 'first_name', ''),
(349, 115, 'last_name', ''),
(350, 115, 'description', ''),
(351, 115, 'rich_editing', 'true'),
(352, 115, 'syntax_highlighting', 'true'),
(353, 115, 'comment_shortcuts', 'false'),
(354, 115, 'admin_color', 'fresh'),
(355, 115, 'use_ssl', '0'),
(356, 115, 'show_admin_bar_front', 'true'),
(357, 115, 'locale', ''),
(358, 115, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(359, 115, 'wp_user_level', '0'),
(361, 116, 'nickname', 'huylvse03982'),
(362, 116, 'first_name', ''),
(363, 116, 'last_name', ''),
(364, 116, 'description', ''),
(365, 116, 'rich_editing', 'true'),
(366, 116, 'syntax_highlighting', 'true'),
(367, 116, 'comment_shortcuts', 'false'),
(368, 116, 'admin_color', 'fresh'),
(369, 116, 'use_ssl', '0'),
(370, 116, 'show_admin_bar_front', 'true'),
(371, 116, 'locale', ''),
(372, 116, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(373, 116, 'wp_user_level', '0'),
(375, 116, 'session_tokens', 'a:11:{s:64:\"dea4eda27875d64d429880dccea8be8af8c8e4ccc9281af42e870152befe1b6a\";a:4:{s:10:\"expiration\";i:1545205689;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1543996089;}s:64:\"26b6a2ee6a4194365fbc05ab4e2460503dcecdacbe7d8404bbd6cda068926204\";a:4:{s:10:\"expiration\";i:1545273320;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544063720;}s:64:\"96d2383393950046f32c870d7fc4656aa22e5392f2b2a777713f16d6b7c880bd\";a:4:{s:10:\"expiration\";i:1545657669;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544448069;}s:64:\"92da712851073e1ea573e357c46900ecd231eaa7ab776230e48faed26382eca7\";a:4:{s:10:\"expiration\";i:1545657694;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544448094;}s:64:\"a74035a9026a51432d5385f3404cc4b57c1a124546c0fb57d1a5f32b5389bdb4\";a:4:{s:10:\"expiration\";i:1545763322;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544553722;}s:64:\"6833cd25927efc961742537f5b4d7cd0d71b7dbd8ad9354bcdfb2ac329a7d1cc\";a:4:{s:10:\"expiration\";i:1545765462;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544555862;}s:64:\"5ac0ea79813764cbcf1f9cf30df366d988915e22d6d6e1737f410afe2acacc8f\";a:4:{s:10:\"expiration\";i:1545795142;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544585542;}s:64:\"fc28830e76fb18d829513ae440a4d116f7d19e8e02f6017e6defc69777f51768\";a:4:{s:10:\"expiration\";i:1546177860;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544968260;}s:64:\"53822c4c17b408d672014dacc6a78464d87b8062301130bf21f65a8d18f12d60\";a:4:{s:10:\"expiration\";i:1546178519;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544968919;}s:64:\"d884039ab205ed946f2850a8a24fdcc03fd0f709f93a1c4a0c45cfa32eba96ae\";a:4:{s:10:\"expiration\";i:1546277378;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1545067778;}s:64:\"6a9cdedee2bc4531c5a589410d840997379e3ea62c582cb7e8153ae4e7c51fe5\";a:4:{s:10:\"expiration\";i:1546278906;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1545069306;}}'),
(385, 105, 'session_tokens', 'a:4:{s:64:\"6db1e9a29a243e7c418d65648b6b0c756309b2d5a4c2e817b8bc616f3364639f\";a:4:{s:10:\"expiration\";i:1545145779;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:65.0) Gecko/20100101 Firefox/65.0\";s:5:\"login\";i:1544972979;}s:64:\"5e5d5ec85feb8053cb725eb4251ba0240fa051b27c394479bd4c7899c118afc1\";a:4:{s:10:\"expiration\";i:1545212048;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:65.0) Gecko/20100101 Firefox/65.0\";s:5:\"login\";i:1545039248;}s:64:\"4c50fb2bc3e57d1b73cad07ebcf20213e969a6d37d0c357ef6dd545329ab8733\";a:4:{s:10:\"expiration\";i:1545215166;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:65.0) Gecko/20100101 Firefox/65.0\";s:5:\"login\";i:1545042366;}s:64:\"5e5588751de344c30ff8bde2eaf0ac7cc7afbbb25b4f19050802267cd3b18081\";a:4:{s:10:\"expiration\";i:1545243427;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1545070627;}}'),
(386, 115, 'session_tokens', 'a:14:{s:64:\"ddb3431ec5a37a6e58cf23208c797c188855ee43d7d518c150db7ecc7bc6c642\";a:4:{s:10:\"expiration\";i:1545655486;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544445886;}s:64:\"3d0c826ed0781e51cd2fad1e386f8eb42cdf39091356bb2b9e0c2902177fbaee\";a:4:{s:10:\"expiration\";i:1545657730;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544448130;}s:64:\"5f650e2efebfd9f4185e04ebf5229defcab046c0f50f5e2adef01655ae5bafb0\";a:4:{s:10:\"expiration\";i:1545762569;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544552969;}s:64:\"1d1e5c1979e2841e6b3a048014af061aaafa6dbc77ef5e5d70402f60276e962f\";a:4:{s:10:\"expiration\";i:1545765905;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544556305;}s:64:\"d4c0a0e6f1a98b976aa78f98543581a4f998998fa3acfdd0dfb5465f7bf4aad6\";a:4:{s:10:\"expiration\";i:1545823099;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544613499;}s:64:\"4dfd34981ddbdba9d90485d71edc985e203330e3b5334530889825a0145cfd03\";a:4:{s:10:\"expiration\";i:1545928459;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544718859;}s:64:\"20ccfd220c1dd978f7f47ea7069214b960281cd373598bf68e37f22b2e62f312\";a:4:{s:10:\"expiration\";i:1546161027;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544951427;}s:64:\"15c01d12b9f76a2dd254407e76d3b13cc2ee3d277034dc735b1fbe77597baf16\";a:4:{s:10:\"expiration\";i:1546177666;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544968066;}s:64:\"ee086281d59c2bc2e1b71d41de3758b27420d069e7f07adf402767a19dbb4102\";a:4:{s:10:\"expiration\";i:1546179007;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544969407;}s:64:\"b86a75f7c7a3481c1ea50105c3737dd1c013efa562094855ab4670ac4f4f91f2\";a:4:{s:10:\"expiration\";i:1546191970;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1544982370;}s:64:\"9e96a01baa82cd6c8577ba7e2811591a7e514cdf07b045e2bbfd7d2814002980\";a:4:{s:10:\"expiration\";i:1546232828;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1545023228;}s:64:\"0505947c2f80cec0589c5000a0a39f6faa0897ac3615665d9c76bb8aafe81a67\";a:4:{s:10:\"expiration\";i:1546262628;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1545053028;}s:64:\"fb1bfc7db5ba352f8bf458aa307e61b05846078d492ee9c6aedb1ac6b238cb9a\";a:4:{s:10:\"expiration\";i:1546276868;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1545067268;}s:64:\"73cbe72974e457d3f6a54a4dcb8646000ccec594bd06566eb10ec0e7cac2a61b\";a:4:{s:10:\"expiration\";i:1546287094;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1545077494;}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermetaData`
--

CREATE TABLE `wp_usermetaData` (
  `ID` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_usermetaData`
--

INSERT INTO `wp_usermetaData` (`ID`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 3, 'username', 'doan my duyen'),
(2, 3, 'gender', 'female'),
(3, 3, 'address', '253 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(4, 3, 'phone', '0026561107'),
(5, 3, 'role', '1'),
(6, 3, 'major', 'Graphic Design'),
(7, 3, 'mail', 'duyendmia03554@fpt.edu.vn'),
(8, 3, 'biography', ''),
(9, 4, 'username', 'hoang dieu thuy'),
(10, 4, 'gender', 'female'),
(11, 4, 'address', '932 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(12, 4, 'phone', '7507313401'),
(13, 4, 'role', '1'),
(14, 4, 'major', 'Graphic Design'),
(15, 4, 'mail', 'thuyhdia03555@fpt.edu.vn'),
(16, 4, 'biography', ''),
(17, 5, 'username', 'ngu kieu anh'),
(18, 5, 'gender', 'female'),
(19, 5, 'address', '160 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(20, 5, 'phone', '0868943181'),
(21, 5, 'role', '1'),
(22, 5, 'major', 'Computer Science'),
(23, 5, 'mail', 'anhnkia03556@fpt.edu.vn'),
(24, 5, 'biography', ''),
(25, 6, 'username', 'ho yen my'),
(26, 6, 'gender', 'female'),
(27, 6, 'address', '608 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(28, 6, 'phone', '9817470598'),
(29, 6, 'role', '1'),
(30, 6, 'major', 'Computer Science'),
(31, 6, 'mail', 'myhyia03557@fpt.edu.vn'),
(32, 6, 'biography', ''),
(33, 7, 'username', 'ho thi xuan'),
(34, 7, 'gender', 'male'),
(35, 7, 'address', '766 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(36, 7, 'phone', '3650178282'),
(37, 7, 'role', '1'),
(38, 7, 'major', 'Computer Science'),
(39, 7, 'mail', 'xuanhtha03558@fpt.edu.vn'),
(40, 7, 'biography', ''),
(41, 8, 'username', 'pho to quyen'),
(42, 8, 'gender', 'female'),
(43, 8, 'address', '373  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(44, 8, 'phone', '6854202726'),
(45, 8, 'role', '1'),
(46, 8, 'major', 'Computer Science'),
(47, 8, 'mail', 'quyenptia03559@fpt.edu.vn'),
(48, 8, 'biography', ''),
(49, 9, 'username', 'nguyen thuy oanh'),
(50, 9, 'gender', 'male'),
(51, 9, 'address', '705 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(52, 9, 'phone', '2706835204'),
(53, 9, 'role', '1'),
(54, 9, 'major', 'Computer Science'),
(55, 9, 'mail', 'oanhntsb03560@fpt.edu.vn'),
(56, 9, 'biography', ''),
(57, 10, 'username', 'huynh thuy uyen'),
(58, 10, 'gender', 'female'),
(59, 10, 'address', '411 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(60, 10, 'phone', '5245454001'),
(61, 10, 'role', '1'),
(62, 10, 'major', 'Computer Science'),
(63, 10, 'mail', 'uyenhtse03561@fpt.edu.vn'),
(64, 10, 'biography', ''),
(65, 11, 'username', 'dao minh xuan'),
(66, 11, 'gender', 'male'),
(67, 11, 'address', '238  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(68, 11, 'phone', '9285922651'),
(69, 11, 'role', '1'),
(70, 11, 'major', 'Computer Science'),
(71, 11, 'mail', 'xuandmha03562@fpt.edu.vn'),
(72, 11, 'biography', ''),
(73, 12, 'username', 'pham khanh thuy'),
(74, 12, 'gender', 'male'),
(75, 12, 'address', '164 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(76, 12, 'phone', '0982047543'),
(77, 12, 'role', '1'),
(78, 12, 'major', 'Computer Science'),
(79, 12, 'mail', 'thuypkha03563@fpt.edu.vn'),
(80, 12, 'biography', ''),
(81, 13, 'username', 'luc thai duong'),
(82, 13, 'gender', 'male'),
(83, 13, 'address', '444 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(84, 13, 'phone', '7057751726'),
(85, 13, 'role', '1'),
(86, 13, 'major', 'Computer Science'),
(87, 13, 'mail', 'duongltse03564@fpt.edu.vn'),
(88, 13, 'biography', ''),
(89, 14, 'username', 'vo duc an'),
(90, 14, 'gender', 'female'),
(91, 14, 'address', '216 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(92, 14, 'phone', '7979934609'),
(93, 14, 'role', '1'),
(94, 14, 'major', 'Computer Science'),
(95, 14, 'mail', 'anvdse03565@fpt.edu.vn'),
(96, 14, 'biography', ''),
(97, 15, 'username', 'vu tuong lan'),
(98, 15, 'gender', 'female'),
(99, 15, 'address', '23 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(100, 15, 'phone', '0187569412'),
(101, 15, 'role', '1'),
(102, 15, 'major', 'Finance'),
(103, 15, 'mail', 'lanvtha03566@fpt.edu.vn'),
(104, 15, 'biography', ''),
(105, 16, 'username', 'mai son quan'),
(106, 16, 'gender', 'male'),
(107, 16, 'address', '816 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(108, 16, 'phone', '5770903746'),
(109, 16, 'role', '1'),
(110, 16, 'major', 'Finance'),
(111, 16, 'mail', 'quanmsia03567@fpt.edu.vn'),
(112, 16, 'biography', ''),
(113, 17, 'username', 'pho nam phuong'),
(114, 17, 'gender', 'male'),
(115, 17, 'address', '255 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(116, 17, 'phone', '1581187536'),
(117, 17, 'role', '1'),
(118, 17, 'major', 'Finance'),
(119, 17, 'mail', 'phuongpnia03568@fpt.edu.vn'),
(120, 17, 'biography', ''),
(121, 18, 'username', 'banh hung dung'),
(122, 18, 'gender', 'male'),
(123, 18, 'address', '17 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(124, 18, 'phone', '0757714414'),
(125, 18, 'role', '1'),
(126, 18, 'major', 'Finance'),
(127, 18, 'mail', 'dungbhse03569@fpt.edu.vn'),
(128, 18, 'biography', ''),
(129, 19, 'username', 'thach thanh loi'),
(130, 19, 'gender', 'female'),
(131, 19, 'address', '482 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(132, 19, 'phone', '3195907357'),
(133, 19, 'role', '1'),
(134, 19, 'major', 'Finance'),
(135, 19, 'mail', 'loittia03570@fpt.edu.vn'),
(136, 19, 'biography', ''),
(137, 20, 'username', 'nguyen quang thang'),
(138, 20, 'gender', 'male'),
(139, 20, 'address', '777 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(140, 20, 'phone', '4306091332'),
(141, 20, 'role', '1'),
(142, 20, 'major', 'Finance'),
(143, 20, 'mail', 'thangnqsb03571@fpt.edu.vn'),
(144, 20, 'biography', ''),
(145, 21, 'username', 'luc thien duc'),
(146, 21, 'gender', 'male'),
(147, 21, 'address', '321 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(148, 21, 'phone', '2243525960'),
(149, 21, 'role', '1'),
(150, 21, 'major', 'Finance'),
(151, 21, 'mail', 'ducltia03572@fpt.edu.vn'),
(152, 21, 'biography', ''),
(153, 22, 'username', 'ta duong anh'),
(154, 22, 'gender', 'male'),
(155, 22, 'address', '48  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(156, 22, 'phone', '2111217945'),
(157, 22, 'role', '1'),
(158, 22, 'major', 'Finance'),
(159, 22, 'mail', 'anhtdia03573@fpt.edu.vn'),
(160, 22, 'biography', ''),
(161, 23, 'username', 'tran mai nhi'),
(162, 23, 'gender', 'male'),
(163, 23, 'address', '471  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(164, 23, 'phone', '8112606429'),
(165, 23, 'role', '1'),
(166, 23, 'major', 'Information Assurance'),
(167, 23, 'mail', 'nhitmsb03574@fpt.edu.vn'),
(168, 23, 'biography', ''),
(169, 24, 'username', 'vuu nguyet anh'),
(170, 24, 'gender', 'female'),
(171, 24, 'address', '345 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(172, 24, 'phone', '3724281812'),
(173, 24, 'role', '1'),
(174, 24, 'major', 'Information Assurance'),
(175, 24, 'mail', 'anhvnia03575@fpt.edu.vn'),
(176, 24, 'biography', ''),
(177, 25, 'username', 'le le quynh'),
(178, 25, 'gender', 'male'),
(179, 25, 'address', '698 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(180, 25, 'phone', '7977767403'),
(181, 25, 'role', '1'),
(182, 25, 'major', 'Information Assurance'),
(183, 25, 'mail', 'quynhllsb03576@fpt.edu.vn'),
(184, 25, 'biography', ''),
(185, 26, 'username', 'phung hanh dung'),
(186, 26, 'gender', 'female'),
(187, 26, 'address', '361 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(188, 26, 'phone', '8503537236'),
(189, 26, 'role', '1'),
(190, 26, 'major', 'Information Assurance'),
(191, 26, 'mail', 'dungphia03577@fpt.edu.vn'),
(192, 26, 'biography', ''),
(193, 27, 'username', 'hoang trang anh'),
(194, 27, 'gender', 'female'),
(195, 27, 'address', '69 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(196, 27, 'phone', '0368354470'),
(197, 27, 'role', '1'),
(198, 27, 'major', 'Information Assurance'),
(199, 27, 'mail', 'anhhtha03578@fpt.edu.vn'),
(200, 27, 'biography', ''),
(201, 28, 'username', 'chu thuc quyen'),
(202, 28, 'gender', 'female'),
(203, 28, 'address', '257 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(204, 28, 'phone', '7664791291'),
(205, 28, 'role', '1'),
(206, 28, 'major', 'Information Assurance'),
(207, 28, 'mail', 'quyenctha03579@fpt.edu.vn'),
(208, 28, 'biography', ''),
(209, 29, 'username', 'tram hoa lien'),
(210, 29, 'gender', 'female'),
(211, 29, 'address', '268 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(212, 29, 'phone', '0317607351'),
(213, 29, 'role', '1'),
(214, 29, 'major', 'Information Assurance'),
(215, 29, 'mail', 'lienthse03580@fpt.edu.vn'),
(216, 29, 'biography', ''),
(217, 30, 'username', 'ma giang ngoc'),
(218, 30, 'gender', 'male'),
(219, 30, 'address', '486 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(220, 30, 'phone', '7596173910'),
(221, 30, 'role', '1'),
(222, 30, 'major', 'Information Assurance'),
(223, 30, 'mail', 'ngocmgsb03581@fpt.edu.vn'),
(224, 30, 'biography', ''),
(225, 31, 'username', 'ngo thu minh'),
(226, 31, 'gender', 'male'),
(227, 31, 'address', '915  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(228, 31, 'phone', '2827759713'),
(229, 31, 'role', '1'),
(230, 31, 'major', 'Japanese Software'),
(231, 31, 'mail', 'minhntsb03582@fpt.edu.vn'),
(232, 31, 'biography', ''),
(233, 32, 'username', 'bui thuy ngan'),
(234, 32, 'gender', 'female'),
(235, 32, 'address', '210 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(236, 32, 'phone', '5836259796'),
(237, 32, 'role', '1'),
(238, 32, 'major', 'Japanese Software'),
(239, 32, 'mail', 'nganbtse03583@fpt.edu.vn'),
(240, 32, 'biography', ''),
(241, 33, 'username', 'luu hai long'),
(242, 33, 'gender', 'female'),
(243, 33, 'address', '97 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(244, 33, 'phone', '8044278460'),
(245, 33, 'role', '1'),
(246, 33, 'major', 'Japanese Software'),
(247, 33, 'mail', 'longlhia03584@fpt.edu.vn'),
(248, 33, 'biography', ''),
(249, 34, 'username', 'trieu viet cuong'),
(250, 34, 'gender', 'female'),
(251, 34, 'address', '20  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(252, 34, 'phone', '3509943513'),
(253, 34, 'role', '1'),
(254, 34, 'major', 'Japanese Software'),
(255, 34, 'mail', 'cuongtvse03585@fpt.edu.vn'),
(256, 34, 'biography', ''),
(257, 35, 'username', 'phan thanh doan'),
(258, 35, 'gender', 'female'),
(259, 35, 'address', '385 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(260, 35, 'phone', '2010205817'),
(261, 35, 'role', '1'),
(262, 35, 'major', 'Japanese Software'),
(263, 35, 'mail', 'doanptia03586@fpt.edu.vn'),
(264, 35, 'biography', ''),
(265, 36, 'username', 'dang tung anh'),
(266, 36, 'gender', 'male'),
(267, 36, 'address', '455 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(268, 36, 'phone', '7324670981'),
(269, 36, 'role', '1'),
(270, 36, 'major', 'Japanese Software'),
(271, 36, 'mail', 'anhdtha03587@fpt.edu.vn'),
(272, 36, 'biography', ''),
(273, 37, 'username', 'dang chi vinh'),
(274, 37, 'gender', 'male'),
(275, 37, 'address', '320 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(276, 37, 'phone', '0254883385'),
(277, 37, 'role', '1'),
(278, 37, 'major', 'Japanese Software'),
(279, 37, 'mail', 'vinhdcse03588@fpt.edu.vn'),
(280, 37, 'biography', ''),
(281, 38, 'username', 'nguyen quang danh'),
(282, 38, 'gender', 'female'),
(283, 38, 'address', '746 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(284, 38, 'phone', '7152122397'),
(285, 38, 'role', '1'),
(286, 38, 'major', 'Japanese Software'),
(287, 38, 'mail', 'danhnqha03589@fpt.edu.vn'),
(288, 38, 'biography', ''),
(289, 39, 'username', 'ly xuan khoa'),
(290, 39, 'gender', 'female'),
(291, 39, 'address', '88 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(292, 39, 'phone', '6959926531'),
(293, 39, 'role', '1'),
(294, 39, 'major', 'Marketing'),
(295, 39, 'mail', 'khoalxse03590@fpt.edu.vn'),
(296, 39, 'biography', ''),
(297, 40, 'username', 'bui ba phuoc'),
(298, 40, 'gender', 'female'),
(299, 40, 'address', '947 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(300, 40, 'phone', '5078610217'),
(301, 40, 'role', '1'),
(302, 40, 'major', 'Marketing'),
(303, 40, 'mail', 'phuocbbia03591@fpt.edu.vn'),
(304, 40, 'biography', ''),
(305, 41, 'username', 'banh thuy vi'),
(306, 41, 'gender', 'male'),
(307, 41, 'address', '556 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(308, 41, 'phone', '3670097656'),
(309, 41, 'role', '1'),
(310, 41, 'major', 'Marketing'),
(311, 41, 'mail', 'vibtia03592@fpt.edu.vn'),
(312, 41, 'biography', ''),
(313, 42, 'username', 'uat dieu linh'),
(314, 42, 'gender', 'male'),
(315, 42, 'address', '885  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(316, 42, 'phone', '3940188870'),
(317, 42, 'role', '1'),
(318, 42, 'major', 'Marketing'),
(319, 42, 'mail', 'linhudse03593@fpt.edu.vn'),
(320, 42, 'biography', ''),
(321, 43, 'username', 'dang ban mai'),
(322, 43, 'gender', 'male'),
(323, 43, 'address', '627 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(324, 43, 'phone', '6562418399'),
(325, 43, 'role', '1'),
(326, 43, 'major', 'Marketing'),
(327, 43, 'mail', 'maidbsb03594@fpt.edu.vn'),
(328, 43, 'biography', ''),
(329, 44, 'username', 'doan ai thi'),
(330, 44, 'gender', 'male'),
(331, 44, 'address', '68 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(332, 44, 'phone', '6625899862'),
(333, 44, 'role', '1'),
(334, 44, 'major', 'Marketing'),
(335, 44, 'mail', 'thidase03595@fpt.edu.vn'),
(336, 44, 'biography', ''),
(337, 45, 'username', 'dang bao lan'),
(338, 45, 'gender', 'female'),
(339, 45, 'address', '84 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(340, 45, 'phone', '6651576462'),
(341, 45, 'role', '1'),
(342, 45, 'major', 'Marketing'),
(343, 45, 'mail', 'landbia03596@fpt.edu.vn'),
(344, 45, 'biography', ''),
(345, 46, 'username', 'nghiem yen oanh'),
(346, 46, 'gender', 'female'),
(347, 46, 'address', '368 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(348, 46, 'phone', '4291342462'),
(349, 46, 'role', '1'),
(350, 46, 'major', 'Marketing'),
(351, 46, 'mail', 'oanhnyia03597@fpt.edu.vn'),
(352, 46, 'biography', ''),
(353, 47, 'username', 'quyen huong tien'),
(354, 47, 'gender', 'female'),
(355, 47, 'address', '903 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(356, 47, 'phone', '4574530857'),
(357, 47, 'role', '1'),
(358, 47, 'major', 'Marketing'),
(359, 47, 'mail', 'tienqhha03598@fpt.edu.vn'),
(360, 47, 'biography', ''),
(361, 48, 'username', 'hoang diem thao'),
(362, 48, 'gender', 'male'),
(363, 48, 'address', '931 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(364, 48, 'phone', '4594281016'),
(365, 48, 'role', '1'),
(366, 48, 'major', 'Marketing'),
(367, 48, 'mail', 'thaohdha03599@fpt.edu.vn'),
(368, 48, 'biography', ''),
(369, 49, 'username', 'ngo tu nguyet'),
(370, 49, 'gender', 'male'),
(371, 49, 'address', '408 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(372, 49, 'phone', '9116568521'),
(373, 49, 'role', '1'),
(374, 49, 'major', 'Marketing'),
(375, 49, 'mail', 'nguyetntha03600@fpt.edu.vn'),
(376, 49, 'biography', ''),
(377, 50, 'username', 'mach quynh thanh'),
(378, 50, 'gender', 'female'),
(379, 50, 'address', '747 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(380, 50, 'phone', '0918760734'),
(381, 50, 'role', '1'),
(382, 50, 'major', 'Marketing'),
(383, 50, 'mail', 'thanhmqha03601@fpt.edu.vn'),
(384, 50, 'biography', ''),
(385, 51, 'username', 'vinh quang vu'),
(386, 51, 'gender', 'female'),
(387, 51, 'address', '109  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(388, 51, 'phone', '6774492993'),
(389, 51, 'role', '1'),
(390, 51, 'major', 'Marketing'),
(391, 51, 'mail', 'vuvqia03602@fpt.edu.vn'),
(392, 51, 'biography', ''),
(393, 52, 'username', 'vu manh quynh'),
(394, 52, 'gender', 'male'),
(395, 52, 'address', '448 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(396, 52, 'phone', '8101575608'),
(397, 52, 'role', '1'),
(398, 52, 'major', 'Marketing'),
(399, 52, 'mail', 'quynhvmha03603@fpt.edu.vn'),
(400, 52, 'biography', ''),
(401, 53, 'username', 'le vu uy'),
(402, 53, 'gender', 'male'),
(403, 53, 'address', '47 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(404, 53, 'phone', '0945313256'),
(405, 53, 'role', '1'),
(406, 53, 'major', 'Marketing'),
(407, 53, 'mail', 'uylvsb03604@fpt.edu.vn'),
(408, 53, 'biography', ''),
(409, 54, 'username', 'chu tuong lam'),
(410, 54, 'gender', 'male'),
(411, 54, 'address', '134 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(412, 54, 'phone', '1888466789'),
(413, 54, 'role', '1'),
(414, 54, 'major', 'Information System'),
(415, 54, 'mail', 'lamctse03605@fpt.edu.vn'),
(416, 54, 'biography', ''),
(417, 55, 'username', 'huynh quang dung'),
(418, 55, 'gender', 'female'),
(419, 55, 'address', '761  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(420, 55, 'phone', '4534442796'),
(421, 55, 'role', '1'),
(422, 55, 'major', 'Information System'),
(423, 55, 'mail', 'dunghqia03606@fpt.edu.vn'),
(424, 55, 'biography', ''),
(425, 56, 'username', 'chau hung dao'),
(426, 56, 'gender', 'female'),
(427, 56, 'address', '17  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(428, 56, 'phone', '0087886851'),
(429, 56, 'role', '1'),
(430, 56, 'major', 'Information System'),
(431, 56, 'mail', 'daochse03607@fpt.edu.vn'),
(432, 56, 'biography', ''),
(433, 57, 'username', 'le quang huy'),
(434, 57, 'gender', 'male'),
(435, 57, 'address', '721 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(436, 57, 'phone', '1698898242'),
(437, 57, 'role', '1'),
(438, 57, 'major', 'Information System'),
(439, 57, 'mail', 'huylqia03608@fpt.edu.vn'),
(440, 57, 'biography', ''),
(441, 58, 'username', 'quang huu bao'),
(442, 58, 'gender', 'male'),
(443, 58, 'address', '86 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(444, 58, 'phone', '7788492324'),
(445, 58, 'role', '1'),
(446, 58, 'major', 'Information System'),
(447, 58, 'mail', 'baoqhse03609@fpt.edu.vn'),
(448, 58, 'biography', ''),
(449, 59, 'username', 'ly minh dat'),
(450, 59, 'gender', 'male'),
(451, 59, 'address', '771 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(452, 59, 'phone', '4431759247'),
(453, 59, 'role', '1'),
(454, 59, 'major', 'Information System'),
(455, 59, 'mail', 'datlmha03610@fpt.edu.vn'),
(456, 59, 'biography', ''),
(457, 60, 'username', 'vu viet son'),
(458, 60, 'gender', 'male'),
(459, 60, 'address', '333 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(460, 60, 'phone', '2032724175'),
(461, 60, 'role', '1'),
(462, 60, 'major', 'Information System'),
(463, 60, 'mail', 'sonvvse03611@fpt.edu.vn'),
(464, 60, 'biography', ''),
(465, 61, 'username', 'ly xuan thuy'),
(466, 61, 'gender', 'female'),
(467, 61, 'address', '739 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(468, 61, 'phone', '7946096822'),
(469, 61, 'role', '1'),
(470, 61, 'major', 'Information System'),
(471, 61, 'mail', 'thuylxia03612@fpt.edu.vn'),
(472, 61, 'biography', ''),
(473, 62, 'username', 'vuong thuc dao'),
(474, 62, 'gender', 'male'),
(475, 62, 'address', '168 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(476, 62, 'phone', '2569508160'),
(477, 62, 'role', '1'),
(478, 62, 'major', 'Information System'),
(479, 62, 'mail', 'daovtsb03613@fpt.edu.vn'),
(480, 62, 'biography', ''),
(481, 63, 'username', 'than bao quyen'),
(482, 63, 'gender', 'female'),
(483, 63, 'address', '145 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(484, 63, 'phone', '0391709479'),
(485, 63, 'role', '1'),
(486, 63, 'major', 'Information System'),
(487, 63, 'mail', 'quyentbia03614@fpt.edu.vn'),
(488, 63, 'biography', ''),
(489, 64, 'username', 'than tam nhu'),
(490, 64, 'gender', 'female'),
(491, 64, 'address', '540 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(492, 64, 'phone', '9571698034'),
(493, 64, 'role', '1'),
(494, 64, 'major', 'Information System'),
(495, 64, 'mail', 'nhuttia03615@fpt.edu.vn'),
(496, 64, 'biography', ''),
(497, 65, 'username', 'bui mai loan'),
(498, 65, 'gender', 'male'),
(499, 65, 'address', '436  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(500, 65, 'phone', '7741337993'),
(501, 65, 'role', '1'),
(502, 65, 'major', 'Information System'),
(503, 65, 'mail', 'loanbmha03616@fpt.edu.vn'),
(504, 65, 'biography', ''),
(505, 66, 'username', 'ho anh tho'),
(506, 66, 'gender', 'female'),
(507, 66, 'address', '162 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(508, 66, 'phone', '1507934772'),
(509, 66, 'role', '1'),
(510, 66, 'major', 'Information System'),
(511, 66, 'mail', 'thohasb03617@fpt.edu.vn'),
(512, 66, 'biography', ''),
(513, 67, 'username', 'huynh mong nguyet'),
(514, 67, 'gender', 'male'),
(515, 67, 'address', '901 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(516, 67, 'phone', '9120654492'),
(517, 67, 'role', '1'),
(518, 67, 'major', 'Information System'),
(519, 67, 'mail', 'nguyethmia03618@fpt.edu.vn'),
(520, 67, 'biography', ''),
(521, 68, 'username', 'quang tu anh'),
(522, 68, 'gender', 'male'),
(523, 68, 'address', '494 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(524, 68, 'phone', '4077457514'),
(525, 68, 'role', '1'),
(526, 68, 'major', 'Information System'),
(527, 68, 'mail', 'anhqtsb03619@fpt.edu.vn'),
(528, 68, 'biography', ''),
(529, 69, 'username', 'nguyen bich lien'),
(530, 69, 'gender', 'female'),
(531, 69, 'address', '662 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(532, 69, 'phone', '4162038480'),
(533, 69, 'role', '1'),
(534, 69, 'major', 'Information System'),
(535, 69, 'mail', 'liennbia03620@fpt.edu.vn'),
(536, 69, 'biography', ''),
(537, 70, 'username', 'duong hiep vu'),
(538, 70, 'gender', 'male'),
(539, 70, 'address', '433 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(540, 70, 'phone', '7585562378'),
(541, 70, 'role', '1'),
(542, 70, 'major', 'Information System'),
(543, 70, 'mail', 'vudhse03621@fpt.edu.vn'),
(544, 70, 'biography', ''),
(545, 71, 'username', 'trang quang minh'),
(546, 71, 'gender', 'male'),
(547, 71, 'address', '841 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(548, 71, 'phone', '1928338760'),
(549, 71, 'role', '1'),
(550, 71, 'major', 'Information System'),
(551, 71, 'mail', 'minhtqia03622@fpt.edu.vn'),
(552, 71, 'biography', ''),
(553, 72, 'username', 'vinh kim phu'),
(554, 72, 'gender', 'female'),
(555, 72, 'address', '953  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(556, 72, 'phone', '2885302409'),
(557, 72, 'role', '1'),
(558, 72, 'major', 'Information System'),
(559, 72, 'mail', 'phuvkia03623@fpt.edu.vn'),
(560, 72, 'biography', ''),
(561, 73, 'username', 'do ngoc dung'),
(562, 73, 'gender', 'female'),
(563, 73, 'address', '968 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(564, 73, 'phone', '1894999053'),
(565, 73, 'role', '1'),
(566, 73, 'major', 'Information System'),
(567, 73, 'mail', 'dungdnse03624@fpt.edu.vn'),
(568, 73, 'biography', ''),
(569, 74, 'username', 'nguyen anh tai'),
(570, 74, 'gender', 'female'),
(571, 74, 'address', '689 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(572, 74, 'phone', '5787427678'),
(573, 74, 'role', '1'),
(574, 74, 'major', 'Information System'),
(575, 74, 'mail', 'tainase03625@fpt.edu.vn'),
(576, 74, 'biography', ''),
(577, 75, 'username', 'ngo trung anh'),
(578, 75, 'gender', 'female'),
(579, 75, 'address', '210 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(580, 75, 'phone', '5609260519'),
(581, 75, 'role', '1'),
(582, 75, 'major', 'Information System'),
(583, 75, 'mail', 'anhntha03626@fpt.edu.vn'),
(584, 75, 'biography', ''),
(585, 76, 'username', 'nguyen hung ngoc'),
(586, 76, 'gender', 'female'),
(587, 76, 'address', '96 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(588, 76, 'phone', '7528936562'),
(589, 76, 'role', '1'),
(590, 76, 'major', 'Information System'),
(591, 76, 'mail', 'ngocnhse03627@fpt.edu.vn'),
(592, 76, 'biography', ''),
(593, 77, 'username', 'nguyen phuong nam'),
(594, 77, 'gender', 'female'),
(595, 77, 'address', '65 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(596, 77, 'phone', '1493512101'),
(597, 77, 'role', '1'),
(598, 77, 'major', 'Information System'),
(599, 77, 'mail', 'namnpia03628@fpt.edu.vn'),
(600, 77, 'biography', ''),
(601, 78, 'username', 'kieu huu luong'),
(602, 78, 'gender', 'female'),
(603, 78, 'address', '477  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(604, 78, 'phone', '8135182650'),
(605, 78, 'role', '1'),
(606, 78, 'major', 'Information System'),
(607, 78, 'mail', 'luongkhsb03629@fpt.edu.vn'),
(608, 78, 'biography', ''),
(609, 79, 'username', 'chau huu minh'),
(610, 79, 'gender', 'male'),
(611, 79, 'address', '840  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(612, 79, 'phone', '1705574508'),
(613, 79, 'role', '1'),
(614, 79, 'major', 'Information System'),
(615, 79, 'mail', 'minhchia03630@fpt.edu.vn'),
(616, 79, 'biography', ''),
(617, 80, 'username', 'bui minh thao'),
(618, 80, 'gender', 'female'),
(619, 80, 'address', '153 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(620, 80, 'phone', '9996432756'),
(621, 80, 'role', '1'),
(622, 80, 'major', 'Information System'),
(623, 80, 'mail', 'thaobmia03631@fpt.edu.vn'),
(624, 80, 'biography', ''),
(625, 81, 'username', 'tram thien thanh'),
(626, 81, 'gender', 'female'),
(627, 81, 'address', '931 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(628, 81, 'phone', '8625236447'),
(629, 81, 'role', '1'),
(630, 81, 'major', 'Information System'),
(631, 81, 'mail', 'thanhttia03632@fpt.edu.vn'),
(632, 81, 'biography', ''),
(633, 82, 'username', 'hoang thuy kieu'),
(634, 82, 'gender', 'female'),
(635, 82, 'address', '500 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(636, 82, 'phone', '5636790184'),
(637, 82, 'role', '1'),
(638, 82, 'major', 'Information System'),
(639, 82, 'mail', 'kieuhtia03633@fpt.edu.vn'),
(640, 82, 'biography', ''),
(641, 83, 'username', 'ly kim tuyen'),
(642, 83, 'gender', 'female'),
(643, 83, 'address', '795 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(644, 83, 'phone', '2883853632'),
(645, 83, 'role', '1'),
(646, 83, 'major', 'Information System'),
(647, 83, 'mail', 'tuyenlksb03634@fpt.edu.vn'),
(648, 83, 'biography', ''),
(649, 84, 'username', 'cao uyen my'),
(650, 84, 'gender', 'male'),
(651, 84, 'address', '229  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(652, 84, 'phone', '4704674538'),
(653, 84, 'role', '1'),
(654, 84, 'major', 'Information System'),
(655, 84, 'mail', 'mycuha03635@fpt.edu.vn'),
(656, 84, 'biography', ''),
(657, 85, 'username', 'dao tinh nhi'),
(658, 85, 'gender', 'male'),
(659, 85, 'address', '808 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(660, 85, 'phone', '7844930068'),
(661, 85, 'role', '1'),
(662, 85, 'major', 'Information System'),
(663, 85, 'mail', 'nhidtsb03636@fpt.edu.vn'),
(664, 85, 'biography', ''),
(665, 86, 'username', 'bui ngan truc'),
(666, 86, 'gender', 'male'),
(667, 86, 'address', '700 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(668, 86, 'phone', '0292747064'),
(669, 86, 'role', '1'),
(670, 86, 'major', 'Information System'),
(671, 86, 'mail', 'trucbnha03637@fpt.edu.vn'),
(672, 86, 'biography', ''),
(673, 87, 'username', 'nguyen bich nga'),
(674, 87, 'gender', 'female'),
(675, 87, 'address', '731  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(676, 87, 'phone', '9228338181'),
(677, 87, 'role', '1'),
(678, 87, 'major', 'Information System'),
(679, 87, 'mail', 'nganbsb03638@fpt.edu.vn'),
(680, 87, 'biography', ''),
(681, 88, 'username', 'nguyen my phuong'),
(682, 88, 'gender', 'male'),
(683, 88, 'address', '552 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(684, 88, 'phone', '1630932730'),
(685, 88, 'role', '1'),
(686, 88, 'major', 'Information System'),
(687, 88, 'mail', 'phuongnmsb03639@fpt.edu.vn'),
(688, 88, 'biography', ''),
(689, 89, 'username', 'ho nguyet anh'),
(690, 89, 'gender', 'male'),
(691, 89, 'address', '54 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(692, 89, 'phone', '5355532082'),
(693, 89, 'role', '1'),
(694, 89, 'major', 'Information System'),
(695, 89, 'mail', 'anhhnsb03640@fpt.edu.vn'),
(696, 89, 'biography', ''),
(697, 90, 'username', 'nguyen thai minh'),
(698, 90, 'gender', 'female'),
(699, 90, 'address', '379 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(700, 90, 'phone', '6240056675'),
(701, 90, 'role', '1'),
(702, 90, 'major', 'Information System'),
(703, 90, 'mail', 'minhntia03641@fpt.edu.vn'),
(704, 90, 'biography', ''),
(705, 91, 'username', 'nguyen dai hanh'),
(706, 91, 'gender', 'female'),
(707, 91, 'address', '722 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(708, 91, 'phone', '3673105430'),
(709, 91, 'role', '1'),
(710, 91, 'major', 'Information System'),
(711, 91, 'mail', 'hanhndsb03642@fpt.edu.vn'),
(712, 91, 'biography', ''),
(713, 92, 'username', 'ho chieu minh'),
(714, 92, 'gender', 'male'),
(715, 92, 'address', '698 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(716, 92, 'phone', '7676445909'),
(717, 92, 'role', '1'),
(718, 92, 'major', 'Information System'),
(719, 92, 'mail', 'minhhcia03643@fpt.edu.vn'),
(720, 92, 'biography', ''),
(721, 93, 'username', 'dang anh quan'),
(722, 93, 'gender', 'male'),
(723, 93, 'address', '618 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(724, 93, 'phone', '5888327127'),
(725, 93, 'role', '1'),
(726, 93, 'major', 'Information System'),
(727, 93, 'mail', 'quandase03644@fpt.edu.vn'),
(728, 93, 'biography', ''),
(729, 94, 'username', 'duong xuan hieu'),
(730, 94, 'gender', 'male'),
(731, 94, 'address', '275 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(732, 94, 'phone', '6450807879'),
(733, 94, 'role', '1'),
(734, 94, 'major', 'Information System'),
(735, 94, 'mail', 'hieudxsb03645@fpt.edu.vn'),
(736, 94, 'biography', ''),
(737, 95, 'username', 'duu duy quang'),
(738, 95, 'gender', 'male'),
(739, 95, 'address', '472 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(740, 95, 'phone', '0366377354'),
(741, 95, 'role', '1'),
(742, 95, 'major', 'Information System'),
(743, 95, 'mail', 'quangddha03646@fpt.edu.vn'),
(744, 95, 'biography', ''),
(745, 96, 'username', 'quyen tan thanh'),
(746, 96, 'gender', 'female'),
(747, 96, 'address', '421  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(748, 96, 'phone', '0795075684'),
(749, 96, 'role', '1'),
(750, 96, 'major', 'Information System'),
(751, 96, 'mail', 'thanhqtha03647@fpt.edu.vn'),
(752, 96, 'biography', ''),
(753, 97, 'username', 'an quang ha'),
(754, 97, 'gender', 'female'),
(755, 97, 'address', '787 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(756, 97, 'phone', '7737402027'),
(757, 97, 'role', '1'),
(758, 97, 'major', 'Information System'),
(759, 97, 'mail', 'haaqse03648@fpt.edu.vn'),
(760, 97, 'biography', ''),
(761, 98, 'username', 'quach duc khang'),
(762, 98, 'gender', 'female'),
(763, 98, 'address', '164 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(764, 98, 'phone', '4805228305'),
(765, 98, 'role', '1'),
(766, 98, 'major', 'Information System'),
(767, 98, 'mail', 'khangqdse03649@fpt.edu.vn'),
(768, 98, 'biography', ''),
(769, 99, 'username', 'ta bao chau'),
(770, 99, 'gender', 'female'),
(771, 99, 'address', '554 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(772, 99, 'phone', '8909462648'),
(773, 99, 'role', '1'),
(774, 99, 'major', 'Information System'),
(775, 99, 'mail', 'chautbha03650@fpt.edu.vn'),
(776, 99, 'biography', ''),
(777, 100, 'username', 'bui hue an'),
(778, 100, 'gender', 'male'),
(779, 100, 'address', '414 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(780, 100, 'phone', '8948324454'),
(781, 100, 'role', '1'),
(782, 100, 'major', 'Information System'),
(783, 100, 'mail', 'anbhia03651@fpt.edu.vn'),
(784, 100, 'biography', ''),
(785, 101, 'username', 'phi kim thuy'),
(786, 101, 'gender', 'female'),
(787, 101, 'address', '787  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(788, 101, 'phone', '2139245480'),
(789, 101, 'role', '1'),
(790, 101, 'major', 'Information System'),
(791, 101, 'mail', 'thuypkse03652@fpt.edu.vn'),
(792, 101, 'biography', ''),
(793, 102, 'username', 'vinh thuc van'),
(794, 102, 'gender', 'female'),
(795, 102, 'address', '886 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(796, 102, 'phone', '9371615289'),
(797, 102, 'role', '1'),
(798, 102, 'major', 'Information System'),
(799, 102, 'mail', 'vanvtse03653@fpt.edu.vn'),
(800, 102, 'biography', ''),
(801, 103, 'username', 'tong duy hieu'),
(802, 103, 'gender', 'male'),
(803, 103, 'address', '860  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(804, 103, 'phone', '3971571600'),
(805, 103, 'role', '1'),
(806, 103, 'major', 'Information System'),
(807, 103, 'mail', 'hieutdsb03654@fpt.edu.vn'),
(808, 103, 'biography', ''),
(809, 104, 'username', 'dam thanh khiem'),
(810, 104, 'gender', 'male'),
(811, 104, 'address', '671 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(812, 104, 'phone', '1297079352'),
(813, 104, 'role', '1'),
(814, 104, 'major', 'Information System'),
(815, 104, 'mail', 'khiemdtse03655@fpt.edu.vn'),
(816, 104, 'biography', ''),
(817, 105, 'username', 'dao trong duy'),
(818, 105, 'gender', 'male'),
(819, 105, 'address', '469 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(820, 105, 'phone', ''),
(821, 105, 'role', '0'),
(822, 105, 'major', 'Information System'),
(823, 105, 'mail', 'duydt@fpt.edu.vn'),
(824, 105, 'biography', ''),
(825, 106, 'username', 'phan truong lam'),
(826, 106, 'gender', 'male'),
(827, 106, 'address', '903 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(828, 106, 'phone', '8667872272'),
(829, 106, 'role', '0'),
(830, 106, 'major', ''),
(831, 106, 'mail', 'lampt@fpt.edu.vn'),
(832, 106, 'biography', ''),
(833, 107, 'username', 'phan dang cau'),
(834, 107, 'gender', 'male'),
(835, 107, 'address', '425 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(836, 107, 'phone', '5860801074'),
(837, 107, 'role', '0'),
(838, 107, 'major', ''),
(839, 107, 'mail', 'caupd@fpt.edu.vn'),
(840, 107, 'biography', ''),
(841, 108, 'username', 'tran quy ban'),
(842, 108, 'gender', 'male'),
(843, 108, 'address', '267 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(844, 108, 'phone', '7754409916'),
(845, 108, 'role', '0'),
(846, 108, 'major', ''),
(847, 108, 'mail', 'bantq3@fpt.edu.vn'),
(848, 108, 'biography', ''),
(849, 109, 'username', 'luong trung kien'),
(850, 109, 'gender', 'male'),
(851, 109, 'address', '991  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(852, 109, 'phone', '2560237964'),
(853, 109, 'role', '0'),
(854, 109, 'major', ''),
(855, 109, 'mail', 'kienlt@fpt.edu.vn'),
(856, 109, 'biography', ''),
(857, 110, 'username', 'tran binh duong'),
(858, 110, 'gender', 'male'),
(859, 110, 'address', '877 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(860, 110, 'phone', '1828328743'),
(861, 110, 'role', '0'),
(862, 110, 'major', ''),
(863, 110, 'mail', 'duongtb@fpt.edu.vn'),
(864, 110, 'biography', ''),
(865, 111, 'username', 'pham ngoc anh'),
(866, 111, 'gender', 'male'),
(867, 111, 'address', '75 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(868, 111, 'phone', '3484238711'),
(869, 111, 'role', '0'),
(870, 111, 'major', ''),
(871, 111, 'mail', 'anhpn@fpt.edu.vn'),
(872, 111, 'biography', ''),
(873, 112, 'username', 'phung duy khuong'),
(874, 112, 'gender', 'male'),
(875, 112, 'address', '325 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(876, 112, 'phone', '2000287976'),
(877, 112, 'role', '0'),
(878, 112, 'major', ''),
(879, 112, 'mail', 'khuongpd@fpt.edu.vn'),
(880, 112, 'biography', ''),
(881, 113, 'username', 'tran dinh tri'),
(882, 113, 'gender', 'male'),
(883, 113, 'address', '708 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(884, 113, 'phone', '9309114843'),
(885, 113, 'role', '0'),
(886, 113, 'major', ''),
(887, 113, 'mail', 'tritd@fpt.edu.vn'),
(888, 113, 'biography', ''),
(889, 114, 'username', 'nguyet tat trung'),
(890, 114, 'gender', 'male'),
(891, 114, 'address', '881 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(892, 114, 'phone', '6292104345'),
(893, 114, 'role', '0'),
(894, 114, 'major', ''),
(895, 114, 'mail', 'trungnt@fpt.edu.vn'),
(896, 114, 'biography', ''),
(897, 115, 'username', '(K12_HN) Nguyen Thi Kieu Trang'),
(898, 115, 'gender', 'Male'),
(899, 115, 'address', ''),
(900, 115, 'phone', '12_B'),
(901, 115, 'role', '1'),
(902, 115, 'major', ''),
(903, 115, 'email', 'trangntksb02397@fpt.edu.vn'),
(904, 115, 'biography', ''),
(905, 116, 'username', 'Asume Sama'),
(906, 116, 'gender', 'Male'),
(907, 116, 'address', 'Trường ĐH FPT,khu công nghệ cao, Thạch Thất , Hà Nội'),
(908, 116, 'phone', '10_C'),
(909, 116, 'role', '1'),
(910, 116, 'major', 'Information System'),
(911, 116, 'email', 'huylvse03982@fpt.edu.vn'),
(912, 116, 'biography', 'Hello every body. I\'m Huy come from Viet Nam'),
(913, 0, 'username', '(K12_HN) Nguyen Thi Kieu Trang'),
(914, 0, 'gender', ''),
(915, 0, 'address', ''),
(916, 0, 'phone', ''),
(917, 0, 'role', '0'),
(918, 0, 'major', ''),
(919, 0, 'biography', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BBScbWYKpRa3KsQm1ZUIdRdW8K5pjQ/', 'admin', 'admin@gmail.com', '', '2018-10-13 14:08:58', '', 0, 'admin'),
(3, 'duyendmia03554', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'duyendmia03554', 'duyendmia03554@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'duyendmia03554'),
(4, 'thuyhdia03555', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thuyhdia03555', 'thuyhdia03555@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thuyhdia03555'),
(5, 'anhnkia03556', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhnkia03556', 'anhnkia03556@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhnkia03556'),
(6, 'myhyia03557', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'myhyia03557', 'myhyia03557@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'myhyia03557'),
(7, 'xuanhtha03558', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'xuanhtha03558', 'xuanhtha03558@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'xuanhtha03558'),
(8, 'quyenptia03559', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quyenptia03559', 'quyenptia03559@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quyenptia03559'),
(9, 'oanhntsb03560', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'oanhntsb03560', 'oanhntsb03560@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'oanhntsb03560'),
(10, 'uyenhtse03561', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'uyenhtse03561', 'uyenhtse03561@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'uyenhtse03561'),
(11, 'xuandmha03562', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'xuandmha03562', 'xuandmha03562@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'xuandmha03562'),
(12, 'thuypkha03563', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thuypkha03563', 'thuypkha03563@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thuypkha03563'),
(13, 'duongltse03564', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'duongltse03564', 'duongltse03564@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'duongltse03564'),
(14, 'anvdse03565', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anvdse03565', 'anvdse03565@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anvdse03565'),
(15, 'lanvtha03566', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'lanvtha03566', 'lanvtha03566@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'lanvtha03566'),
(16, 'quanmsia03567', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quanmsia03567', 'quanmsia03567@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quanmsia03567'),
(17, 'phuongpnia03568', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'phuongpnia03568', 'phuongpnia03568@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'phuongpnia03568'),
(18, 'dungbhse03569', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'dungbhse03569', 'dungbhse03569@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'dungbhse03569'),
(19, 'loittia03570', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'loittia03570', 'loittia03570@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'loittia03570'),
(20, 'thangnqsb03571', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thangnqsb03571', 'thangnqsb03571@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thangnqsb03571'),
(21, 'ducltia03572', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'ducltia03572', 'ducltia03572@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'ducltia03572'),
(22, 'anhtdia03573', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhtdia03573', 'anhtdia03573@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhtdia03573'),
(23, 'nhitmsb03574', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'nhitmsb03574', 'nhitmsb03574@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'nhitmsb03574'),
(24, 'anhvnia03575', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhvnia03575', 'anhvnia03575@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhvnia03575'),
(25, 'quynhllsb03576', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quynhllsb03576', 'quynhllsb03576@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quynhllsb03576'),
(26, 'dungphia03577', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'dungphia03577', 'dungphia03577@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'dungphia03577'),
(27, 'anhhtha03578', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhhtha03578', 'anhhtha03578@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhhtha03578'),
(28, 'quyenctha03579', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quyenctha03579', 'quyenctha03579@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quyenctha03579'),
(29, 'lienthse03580', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'lienthse03580', 'lienthse03580@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'lienthse03580'),
(30, 'ngocmgsb03581', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'ngocmgsb03581', 'ngocmgsb03581@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'ngocmgsb03581'),
(31, 'minhntsb03582', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'minhntsb03582', 'minhntsb03582@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'minhntsb03582'),
(32, 'nganbtse03583', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'nganbtse03583', 'nganbtse03583@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'nganbtse03583'),
(33, 'longlhia03584', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'longlhia03584', 'longlhia03584@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'longlhia03584'),
(34, 'cuongtvse03585', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'cuongtvse03585', 'cuongtvse03585@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'cuongtvse03585'),
(35, 'doanptia03586', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'doanptia03586', 'doanptia03586@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'doanptia03586'),
(36, 'anhdtha03587', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhdtha03587', 'anhdtha03587@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhdtha03587'),
(37, 'vinhdcse03588', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'vinhdcse03588', 'vinhdcse03588@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'vinhdcse03588'),
(38, 'danhnqha03589', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'danhnqha03589', 'danhnqha03589@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'danhnqha03589'),
(39, 'khoalxse03590', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'khoalxse03590', 'khoalxse03590@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'khoalxse03590'),
(40, 'phuocbbia03591', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'phuocbbia03591', 'phuocbbia03591@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'phuocbbia03591'),
(41, 'vibtia03592', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'vibtia03592', 'vibtia03592@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'vibtia03592'),
(42, 'linhudse03593', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'linhudse03593', 'linhudse03593@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'linhudse03593'),
(43, 'maidbsb03594', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'maidbsb03594', 'maidbsb03594@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'maidbsb03594'),
(44, 'thidase03595', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thidase03595', 'thidase03595@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thidase03595'),
(45, 'landbia03596', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'landbia03596', 'landbia03596@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'landbia03596'),
(46, 'oanhnyia03597', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'oanhnyia03597', 'oanhnyia03597@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'oanhnyia03597'),
(47, 'tienqhha03598', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'tienqhha03598', 'tienqhha03598@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'tienqhha03598'),
(48, 'thaohdha03599', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thaohdha03599', 'thaohdha03599@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thaohdha03599'),
(49, 'nguyetntha03600', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'nguyetntha03600', 'nguyetntha03600@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'nguyetntha03600'),
(50, 'thanhmqha03601', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thanhmqha03601', 'thanhmqha03601@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thanhmqha03601'),
(51, 'vuvqia03602', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'vuvqia03602', 'vuvqia03602@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'vuvqia03602'),
(52, 'quynhvmha03603', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quynhvmha03603', 'quynhvmha03603@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quynhvmha03603'),
(53, 'uylvsb03604', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'uylvsb03604', 'uylvsb03604@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'uylvsb03604'),
(54, 'lamctse03605', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'lamctse03605', 'lamctse03605@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'lamctse03605'),
(55, 'dunghqia03606', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'dunghqia03606', 'dunghqia03606@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'dunghqia03606'),
(56, 'daochse03607', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'daochse03607', 'daochse03607@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'daochse03607'),
(57, 'huylqia03608', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'huylqia03608', 'huylqia03608@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'huylqia03608'),
(58, 'baoqhse03609', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'baoqhse03609', 'baoqhse03609@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'baoqhse03609'),
(59, 'datlmha03610', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'datlmha03610', 'datlmha03610@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'datlmha03610'),
(60, 'sonvvse03611', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'sonvvse03611', 'sonvvse03611@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'sonvvse03611'),
(61, 'thuylxia03612', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thuylxia03612', 'thuylxia03612@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thuylxia03612'),
(62, 'daovtsb03613', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'daovtsb03613', 'daovtsb03613@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'daovtsb03613'),
(63, 'quyentbia03614', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quyentbia03614', 'quyentbia03614@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quyentbia03614'),
(64, 'nhuttia03615', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'nhuttia03615', 'nhuttia03615@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'nhuttia03615'),
(65, 'loanbmha03616', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'loanbmha03616', 'loanbmha03616@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'loanbmha03616'),
(66, 'thohasb03617', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thohasb03617', 'thohasb03617@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thohasb03617'),
(67, 'nguyethmia03618', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'nguyethmia03618', 'nguyethmia03618@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'nguyethmia03618'),
(68, 'anhqtsb03619', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhqtsb03619', 'anhqtsb03619@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhqtsb03619'),
(69, 'liennbia03620', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'liennbia03620', 'liennbia03620@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'liennbia03620'),
(70, 'vudhse03621', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'vudhse03621', 'vudhse03621@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'vudhse03621'),
(71, 'minhtqia03622', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'minhtqia03622', 'minhtqia03622@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'minhtqia03622'),
(72, 'phuvkia03623', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'phuvkia03623', 'phuvkia03623@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'phuvkia03623'),
(73, 'dungdnse03624', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'dungdnse03624', 'dungdnse03624@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'dungdnse03624'),
(74, 'tainase03625', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'tainase03625', 'tainase03625@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'tainase03625'),
(75, 'anhntha03626', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhntha03626', 'anhntha03626@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhntha03626'),
(76, 'ngocnhse03627', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'ngocnhse03627', 'ngocnhse03627@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'ngocnhse03627'),
(77, 'namnpia03628', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'namnpia03628', 'namnpia03628@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'namnpia03628'),
(78, 'luongkhsb03629', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'luongkhsb03629', 'luongkhsb03629@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'luongkhsb03629'),
(79, 'minhchia03630', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'minhchia03630', 'minhchia03630@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'minhchia03630'),
(80, 'thaobmia03631', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thaobmia03631', 'thaobmia03631@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thaobmia03631'),
(81, 'thanhttia03632', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thanhttia03632', 'thanhttia03632@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thanhttia03632'),
(82, 'kieuhtia03633', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'kieuhtia03633', 'kieuhtia03633@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'kieuhtia03633'),
(83, 'tuyenlksb03634', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'tuyenlksb03634', 'tuyenlksb03634@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'tuyenlksb03634'),
(84, 'mycuha03635', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'mycuha03635', 'mycuha03635@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'mycuha03635'),
(85, 'nhidtsb03636', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'nhidtsb03636', 'nhidtsb03636@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'nhidtsb03636'),
(86, 'trucbnha03637', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'trucbnha03637', 'trucbnha03637@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'trucbnha03637'),
(87, 'nganbsb03638', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'nganbsb03638', 'nganbsb03638@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'nganbsb03638'),
(88, 'phuongnmsb03639', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'phuongnmsb03639', 'phuongnmsb03639@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'phuongnmsb03639'),
(89, 'anhhnsb03640', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhhnsb03640', 'anhhnsb03640@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhhnsb03640'),
(90, 'minhntia03641', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'minhntia03641', 'minhntia03641@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'minhntia03641'),
(91, 'hanhndsb03642', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'hanhndsb03642', 'hanhndsb03642@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'hanhndsb03642'),
(92, 'minhhcia03643', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'minhhcia03643', 'minhhcia03643@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'minhhcia03643'),
(93, 'quandase03644', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quandase03644', 'quandase03644@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quandase03644'),
(94, 'hieudxsb03645', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'hieudxsb03645', 'hieudxsb03645@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'hieudxsb03645'),
(95, 'quangddha03646', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quangddha03646', 'quangddha03646@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quangddha03646'),
(96, 'thanhqtha03647', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thanhqtha03647', 'thanhqtha03647@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thanhqtha03647'),
(97, 'haaqse03648', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'haaqse03648', 'haaqse03648@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'haaqse03648'),
(98, 'khangqdse03649', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'khangqdse03649', 'khangqdse03649@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'khangqdse03649'),
(99, 'chautbha03650', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'chautbha03650', 'chautbha03650@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'chautbha03650'),
(100, 'anbhia03651', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anbhia03651', 'anbhia03651@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anbhia03651'),
(101, 'thuypkse03652', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thuypkse03652', 'thuypkse03652@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thuypkse03652'),
(102, 'vanvtse03653', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'vanvtse03653', 'vanvtse03653@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'vanvtse03653'),
(103, 'hieutdsb03654', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'hieutdsb03654', 'hieutdsb03654@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'hieutdsb03654'),
(104, 'khiemdtse03655', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'khiemdtse03655', 'khiemdtse03655@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'khiemdtse03655'),
(105, 'duydt', '$P$BI/jHMpm0o3Bfa2.xZoiItHXQrlmm6.', 'duydt', 'duydt@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'duydt'),
(106, 'lampt', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'lampt', 'lampt@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'lampt'),
(107, 'caupd', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'caupd', 'caupd@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'caupd'),
(108, 'bantq3', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'bantq3', 'bantq3@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'bantq3'),
(109, 'kienlt', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'kienlt', 'kienlt@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'kienlt'),
(110, 'duongtb', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'duongtb', 'duongtb@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'duongtb'),
(111, 'anhpn', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhpn', 'anhpn@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhpn'),
(112, 'khuongpd', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'khuongpd', 'khuongpd@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'khuongpd'),
(113, 'tritd', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'tritd', 'tritd@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'tritd'),
(114, 'trungnt', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'trungnt', 'trungnt@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'trungnt'),
(115, 'trangntksb02397', '$P$BBkhUXcVpDW/PgcgRTRHn4Xto7q9pI/', 'trangntksb02397', 'trangntksb02397@fpt.edu.vn', '', '2018-12-05 03:35:59', '', 0, 'trangntksb02397'),
(116, 'huylvse03982', '$P$B28LwV5mDixgAcI1hU3mmWffKOBMXZ/', 'huylvse03982', 'huylvse03982@fpt.edu.vn', '', '2018-12-05 05:36:10', '', 0, 'huylvse03982');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users_status`
--

CREATE TABLE `wp_users_status` (
  `ID` bigint(20) NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_users_status`
--

INSERT INTO `wp_users_status` (`ID`, `email`, `status`, `updated_date`) VALUES
(1, 'huylvse03982@fpt.edu.vn', 1, '2018-12-11 19:16:34'),
(9, 'trangntksb02397@fpt.edu.vn', 1, '2018-12-11 19:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `wp_user_chat`
--

CREATE TABLE `wp_user_chat` (
  `ID` bigint(20) NOT NULL,
  `user_send` bigint(20) NOT NULL,
  `user_recevive` bigint(20) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_user_chat`
--

INSERT INTO `wp_user_chat` (`ID`, `user_send`, `user_recevive`, `created_date`) VALUES
(16, 116, 115, '2018-12-17 09:30:54'),
(17, 105, 115, '2018-12-17 09:34:30'),
(18, 105, 116, '2018-12-17 18:18:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_chat`
--
ALTER TABLE `wp_chat`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_chat_user`
--
ALTER TABLE `wp_chat_user`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_finder_form`
--
ALTER TABLE `wp_finder_form`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_form_skill`
--
ALTER TABLE `wp_form_skill`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_groups`
--
ALTER TABLE `wp_groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_group_chat`
--
ALTER TABLE `wp_group_chat`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_major`
--
ALTER TABLE `wp_major`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_members`
--
ALTER TABLE `wp_members`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_request`
--
ALTER TABLE `wp_request`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_semester`
--
ALTER TABLE `wp_semester`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_semester_level`
--
ALTER TABLE `wp_semester_level`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_skill_major`
--
ALTER TABLE `wp_skill_major`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_usermetaData`
--
ALTER TABLE `wp_usermetaData`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `wp_users_status`
--
ALTER TABLE `wp_users_status`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_user_chat`
--
ALTER TABLE `wp_user_chat`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_chat`
--
ALTER TABLE `wp_chat`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_chat_user`
--
ALTER TABLE `wp_chat_user`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_finder_form`
--
ALTER TABLE `wp_finder_form`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `wp_form_skill`
--
ALTER TABLE `wp_form_skill`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `wp_groups`
--
ALTER TABLE `wp_groups`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `wp_group_chat`
--
ALTER TABLE `wp_group_chat`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_major`
--
ALTER TABLE `wp_major`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wp_members`
--
ALTER TABLE `wp_members`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1266;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1332;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `wp_request`
--
ALTER TABLE `wp_request`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `wp_semester`
--
ALTER TABLE `wp_semester`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_semester_level`
--
ALTER TABLE `wp_semester_level`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `wp_skill_major`
--
ALTER TABLE `wp_skill_major`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=387;

--
-- AUTO_INCREMENT for table `wp_usermetaData`
--
ALTER TABLE `wp_usermetaData`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=920;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `wp_users_status`
--
ALTER TABLE `wp_users_status`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wp_user_chat`
--
ALTER TABLE `wp_user_chat`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
