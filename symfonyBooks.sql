-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 27 jan. 2023 à 22:56
-- Version du serveur :  10.3.37-MariaDB-0ubuntu0.20.04.1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `symfonyBooks`
--

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `firstname` varchar(200) DEFAULT NULL,
  `lastname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `author`
--

INSERT INTO `author` (`id`, `firstname`, `lastname`) VALUES
(1, 'Pierre', 'Loti'),
(2, 'Rémi', 'Kauffer'),
(3, 'Roger', 'Faligot'),
(4, 'Albert', 'Londres'),
(5, 'Miguel', 'Torga'),
(6, 'Laurent', 'Joly'),
(7, 'Rémy', 'Oudghiri'),
(8, 'Evguéni', 'Zamiatine'),
(9, 'Gilles', 'Havard'),
(10, 'Cécile', 'Vidal'),
(11, 'David', 'Roberts'),
(12, 'Christian', 'Delage'),
(13, 'Vincent', 'Guigueno'),
(14, 'Georges-Henri', 'Soutou'),
(15, 'Fabrice', 'Grenard'),
(16, 'Philippe K.', 'Dick'),
(17, 'Bibhouti Bhoushan', 'Banerji');

-- --------------------------------------------------------

--
-- Structure de la table `author_book`
--

CREATE TABLE `author_book` (
  `author_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `author_book`
--

INSERT INTO `author_book` (`author_id`, `book_id`) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 8),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 7),
(7, 9),
(8, 10),
(9, 11),
(9, 12),
(9, 14),
(10, 11),
(11, 13),
(12, 15),
(13, 15),
(14, 16),
(15, 17),
(16, 18),
(16, 19),
(17, 20);

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `language` varchar(150) DEFAULT NULL,
  `collection` varchar(200) DEFAULT NULL,
  `editor` varchar(200) DEFAULT NULL,
  `releasedate` varchar(150) DEFAULT NULL,
  `description` longtext NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `numberpages` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `promo` decimal(10,2) DEFAULT NULL,
  `isbn10` varchar(150) DEFAULT NULL,
  `isbn13` varchar(150) DEFAULT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `book`
--

INSERT INTO `book` (`id`, `category_id`, `title`, `language`, `collection`, `editor`, `releasedate`, `description`, `picture`, `numberpages`, `price`, `promo`, `isbn10`, `isbn13`, `stock`) VALUES
(1, 2, 'Voyages', 'Français', 'Bouquins', 'Robert Laffont', '11 janvier 2018', '<div><strong>Pierre Loti</strong> reste un des modèles les plus accomplis de l\'écrivain-voyageur. Marin autant que romancier, il sillonna sans relâche ses continents favoris, curieux de l\'identité de chaque peuple, avec une fascination particulière pour les mondes en train de disparaître. <br><br> Ces récits de voyages peuvent être lus comme les \" Essais \" d\'une vie, au sens à la fois intime et universel que <strong>Montaigne</strong> donnait à ce mot. Chacun de ces fragments autobiographiques met en scène l\'initiation du voyageur au pays qu\'il traverse, à ses paysages, son histoire et ses moeurs. <strong>Loti</strong> se situe dans la lignée des grands écrivains qui, de <strong>Chateaubriand</strong> à <strong>Lamartine</strong> ou <strong>Gautier</strong>, ont parcouru le Maghreb et le Proche-Orient. Mais il se singularise par le fait d\'avoir été l\'un des premiers à évoquer l\'île de Pâques et Angkor, tandis que la Chine, et Pékin en particulier, lui inspira des récits d\'une justesse et d\'une virtuosité incomparables. <br><br> Le lecteur d\'aujourd\'hui éprouvera en lisant ces écrits d\'un navigateur d\'autrefois tout le charme des univers révolus et sans doute aussi la nostalgie d\'une certaine façon de voyager. Un art qui chez <strong>Loti</strong>, \" <em>coureur des mers, coureur des rêves</em> \", consistait, en partant vers tous les horizons, à partir avant tout à la recherche de lui-même. <br><br> Ce volume contient : <em>L\'Île de Pâques – Une relâche de trois heures – Mahé des Indes – Obock – Japoneries d\'automne – Au Maroc – Constantinople en 1890 – Le Désert – Jérusalem – La Galilée – L\'Inde (sans les Anglais) – Les Pagodes d\'or – En passant à Mascate – Vers Ispahan – Les Derniers Jours de Pékin – Un pèlerin d\'Angkor – La Mort de Philæ – Suprêmes Visions d\'Orient</em>.</div>', 'fe646a62711d5e5ca5f01ad8624e7ad72278c671.jpg', 1664, '33.00', '30.00', '2221216474', '978-2221216477', 10),
(2, 5, 'Kang Sheng - Le maître espion de Mao', 'Français', 'Tempus', 'Perrin', '10 avril 2014', '<div>Politicien rusé, diplomate hors pair, militant impitoyable, peintre et amateur d\'art, Kang Sheng fut l\'un des hommes les plus mystérieux et les plus puissants de son temps. A travers son histoire, les auteurs lèvent le voile sur les services secrets de la Chine populaire, le Tewu. Du Shanghai des années 20, paradis de l\'opium et de la prostitution, à l\'ère de l\'espionnage industriel, cet ouvrage révèle un univers sans merci : la lutte entre Mao et Tchiang Kai-shek, la naissance du goulag maoiste, les secrets du schisme sino-soviétique, l\'aventure de la bombe atomique chinoise, les arcanes de la Révolution culturelle et du \"printemps révolutionnaire de 1968\" ; enfin, les rapports avec les alliés et ses satellites dont Pol Pot. Ce livre met également au grand jour les opérations secrètes des nouveaux services spéciaux de la Chine populaire à l\'heure des \"quatre modernisations\" et de l\'ouverture vers l\'Occident.</div>', '6a281490410016df098d2c71a927d296ab39adfd.jpg', 464, '10.00', NULL, '2262041474', '978-2262041472', 9),
(3, 1, 'Pêcheurs d\'Islande', 'Français', NULL, 'Le livre de poche', '1° février 1973', '<div>Entre Gaud, fille d\'un gros commerçant de Paimpol, et Yann, le pêcheur, il y a bien des obstacles : la différence des conditions et des fortunes, bien sûr ; mais aussi la timidité farouche du jeune homme, de ceux qu\'on nomme les \" Islandais \" parce que, chaque année, leurs bateaux affrontent, durant des semaines, les tempêtes et les dangers de la mer du Nord. C\'est l\'histoire d\'un amour longtemps jugé impossible que nous conte ce roman, publié en 1886, et depuis lors redécouvert et admiré par plusieurs générations. Mais c\'est surtout un grand drame de la mer, et l\'une des expressions les plus abouties de ce thème éternel. Martin lui-même, <strong>Pierre Loti</strong> y déploie une poésie puissante, saisissante de vérité, pour dépeindre la rude vie des pêcheurs, l\'âpre solitude des landes bretonnes, le départ des barques, la présence fascinante et menaçante de l\'Océan.</div>', 'af866a3d250221f597314e144297e29797949802.jpg', 219, '5.20', NULL, '2253009156', '978-2253009153', 9),
(4, 2, 'Dante n\'avait rien vu', 'Français', NULL, 'Editions de Londres', '21 janvier 2017', '<div>Dans ce récit poignant, comme tous ses récits et reportages, <strong>Albert Londres</strong> se lance sur les traces de <strong>Georges Darien </strong>et part à la recherche de Biribi, les bataillons disciplinaires d’Afrique du Nord. On ne peut pas ne pas mettre les deux livres en parallèle, ce que d’ailleurs, nous allons faire prochainement. <strong>Londres</strong> obtient la fermeture des camps disciplinaires quelques années après la mort de <strong>Darien</strong>. L’écrivain anarchiste avait porté le premier coup,<strong> Londres</strong> aura la peau de ces camps de la mort de la République. C’est <em>Dante n’avait rien vu</em>. À lire absolument.</div>', '99d0b8062e931d0a37147b61cf23750ad8dc38a0.jpg', 154, '7.33', NULL, '1911572156', '978-1911572152', 10),
(5, 3, 'Rua', 'Français', NULL, 'José Corti', '23 janvier 1997', '<div><em>Rua,</em> le recueil de nouvelles, est l\'un des rares exemples d\'écrits sur la ville dans l\'œuvre de <br><strong>Torga</strong>. Ici, comme lorsqu\'il prête voix au monde rural, l\'auteur s\'attache à de petites gens pour nous donner à voir et à entendre la mosaïque bariolée et bruyante d\'une rue populaire de Lisbonne. Une jeune amoureuse, un policier en retraite, un vendeur de foire, une prostituée reconvertie en marchande des quatre saisons, tous saisis sur le vif, dans l\'humble quotidien. Pareils à ceux des campagnes pour lesquels <strong>Torga </strong>l\'humaniste n\'a jamais voulu abandonner sa profession de médecin.</div>', '32ebc179733fa1303509e92d0c084130ccd4a8fe.jpg', 133, '18.55', '15.00', NULL, '978-2714306005', 9),
(6, 3, 'Contes et nouveaux contes de la montagne', 'Français', NULL, 'Chandeigne', '09 février 2017', '<div>Cette édition regroupe les <em>Contes de la Montagne</em> et les <em>Nouveaux contes de la Montagne</em>. Cet ensemble est considéré comme le chef-d\'œuvre de <strong>Miguel Torga</strong> et l\'un des dix livres essentiels de la littérature portugaise.<br>Les 45 nouvelles de cet ouvrage ont été écrites et revues entre 1939 et 1980. Elles dépeignent la forte réalité rurale portugaise, celle des montagnes du nord du Portugal, de la misère et de la solitude de ses paysans. L\'auteur ausculte les hommes et les femmes de ce monde âpre, hostile et silencieux, à l\'écoute de leurs quelques joies et de leurs nombreuses peines.<br>« <em>Ce sont des moralités sans morale. Des contes sans la batterie du style. On sent que chaque mot doit être compris par tous. Il y a une force archaïque, une santé revêche, un sens de l\'homme, une acceptation de ses défauts, de ses espoirs, quelque chose de l\'esprit pionnier chez ce médecin du fin fond de la péninsule, chez ce paysan arc-bouté entre le chêne-liège et la bruyère à l\'odeur de maquis, qui en font un immense écrivain</em>. » <strong>Manuel Carcassonne,</strong><em> Le Figaro</em>.<br>«<em> Chacun de ces contes, en quelques pages, contient à la fois une part de réalité et une soif d\'absolu. On perçoit sans cesse des courants souterrains entre la nouvelle, cette longueur de prédilection de Miguel Torga, le champion du lapidaire selon le titre qu\'il a donné à l\'un de ses recueils, et le reste de l\'œuvre : quelques observations puisées dans son Journal, des thèmes qui reviennent sous toutes les formes possibles, transfigurés par la puissance d\'évocation des images, une écriture dont la concision à la limite de la sécheresse débouche sur l\'émotion</em>. » <strong>Nicole Zand,</strong> <em>Le Monde.</em></div>', '110971112dff9b4dc83ec4ecdb3c9ce9b55b2c83.jpg', 384, '22.00', NULL, NULL, '978-2367321431', 10),
(7, 5, 'L\'État contre les juifs: Vichy, les nazis et la persécution antisémite', 'Français', NULL, 'Grasset', '26 septembre 2018', '<div>Sur Vichy et la Shoah, on pensait tout savoir. Ce livre démontre qu’il reste encore beaucoup à découvrir. Répondant à une série de questions clés,<strong> Laurent Joly </strong>renouvelle profondément l’histoire de la persécution des juifs sous l’Occupation et balaie bien des idées reçues. Pourquoi, dès l’été 1940, le régime du<strong> maréchal Pétain </strong>a-t-il impulsé une politique antisémite ? Pourquoi a-t-il accepté de contribuer aux déportations massives décidées par les nazis en 1942 et d’assumer pleinement ces opérations, à Paris comme en zone libre ? Dans quelle mesure l’administration a-t-elle collaboré à la politique génocidaire ?<br>S’appuyant sur de nombreuses sources inédites, restituant les marges de manœuvre des agents (du dirigeant étatique jusqu’au simple gardien de la paix) et les effets concrets de leurs décisions, <strong>Laurent Joly </strong>écrit une histoire incarnée, au plus près des exécuteurs, des victimes et des témoins.<br>Le lecteur apprendra ainsi que le statut d’octobre 1940 n’est pas une simple transposition de la tradition antisémite française : Vichy cherche surtout à suivre le modèle nazi. Sur le Vel d’Hiv, il découvrira une histoire qu’on ne lui a jamais racontée : l’opération du point de vue policier. Enfin, il réalisera que l’idée selon laquelle la persécution des juifs a été occultée par la justice de l’épuration mérite d’être fortement nuancée.<br>Au bout du compte,<strong> Laurent Joly</strong> montre que si toute la puissance de l’État a été mobilisée pour persécuter puis rafler les juifs, les logiques propres à l’appareil étatique, ses objectifs contradictoires, ses pesanteurs et finalement les résistances ont contribué à ce que la majorité des juifs de France, frappés de plein fouet par la persécution, échappent malgré tout à la mort.</div>', 'f7ae9f74d3a6fed9e389ad142bad12de9206b0ca.jpg', 368, '20.90', NULL, '224686299X', '978-2246862994', 10),
(8, 5, 'Histoire mondiale des services secrets', 'Français', 'Tempus', 'Perrin', '17 août 2017', '<div>&nbsp;En couvrant plus de vingt siècles d\'histoire du renseignement sur plus de vingt pays, <strong>Rémi Kauffer</strong> fait la lumière sur le milieu ô combien opaque et captivant des services secrets. Un monde sans pitié dont les arcanes sont enfin révélés pour la première fois. On y découvre les grands services de renseignements, les moins connus aussi, les agents secrets, les taupes et leurs techniques, ainsi que les succès et échecs des opérations qui rythment l\'Histoire. Pas moins de trente-cinq années d\'investigation auront été nécessaires à l\'auteur pour livrer cette somme sans égale.<br>&nbsp;</div>', '7d17d557699fc9cbd7444c770853babacb7958d5.jpg', 1024, '14.90', NULL, '2262072078', '978-2262072070', 8),
(9, 6, 'La société très secrète des marcheurs solitaires', 'Français', NULL, 'PUF', '23 mars 2022', '<div>&nbsp;</div><div>Au détour d\'une conversation, l\'auteur prend conscience un beau jour qu\'il appartient à une communauté invisible : celle des gens qui marchent seuls, au hasard. Depuis l\'adolescence, il s\'adonne à cet art qui compte de prestigieux représentants : Rousseau, Baudelaire ou André Breton. Son métier de sociologue l\'incite à entreprendre une enquête à la rencontre de ces marcheurs du hasard. Il découvre alors tout un monde, aux personnalités haut en couleur : la flâneuse, le promeneur du dimanche, la mystique, le romantique, le fugitif, etc. Des liens se tissent, créant un réseau de correspondances d\'où ressort une grande impression d\'unité. La dernière partie du livre se concentre sur la personnalité de l\'Errante, une inconnue rencontrée aux Puces de Saint-Ouen qui développe une approche sensorielle de la marche solitaire. Elle encourage Rémy Oudghiri à retourner sur les traces de ses premières errances à Casablanca. Un voyage qui se révèle décisif pour comprendre l\'essence de la marche solitaire et le lien profond qui relie les membres de cette société très secrète.</div><div><br></div>', '3a177bf6dea3d18c9a41e37c36a25a73a88a5d2e.jpg', 296, '17.00', NULL, '2130833373', '978-2130833376', 10),
(10, 4, 'Nous', 'Français', 'Babel', 'Actes Sud', '3 février 2021', '<div>&nbsp;Dans une société assujettie au bonheur infaillible et obligatoire, alors que la “dernière” de toutes les révolutions possibles a eu lieu, les hommes, sous une cité de verre dans laquelle chaque geste est contrôlé, sont devenus des “Numéros”. Ceux-ci paient de leur vie le moindre écart à l’ordre établi contre lequel, malgré tout, une poignée de dissidents va s’insurger. D-503 y tient un journal à la gloire de ce monde aseptisé et y consigne les débuts d’une insurrection qui va peu à peu le transformer. Anti-utopie prophétique qui anticipe toutes les glaciations du XX° siècle, <em>Nous</em> est considéré comme le premier chef-d’œuvre de science-fiction, celui qui inspirera&nbsp; <em>1984</em> de <strong>George Orwell</strong> et <em>Le Meilleur des mondes</em> d’<strong>Aldous Huxley.</strong>&nbsp;</div>', '7a1f658ae161d297c705a96bd37b9a5d2338634b.jpg', 240, '8.00', NULL, '2330143222', '978-2330143220', 10),
(11, 5, 'Histoire de l\'amerique francaise', 'Français', 'Champs-Histoire', 'Flammarion', '30 décembre 2005', '<div>&nbsp;Empire colonial français : on pense Afrique Noire, Indochine, Algérie. Et on en oublie la Nouvelle-France qui, à son apogée, au début du XVIII siècle, s\'étendait sur près des deux tiers du continent nord-américain, de Québec à la Nouvelle-Orléans, des forêts glacées du Canada aux bayous de Louisiane, en passant par les prairies du Midwest. Un Empire dont la clé de voûte fut l\'alliance avec les Indiens, qui permit aux Français de s\'implanter et de se maintenir au nez et à la barbe des Anglais, plus nombreux, mais confinés sur le littoral atlantique. Colons, Indiens, esclaves africains composaient, surtout en Louisiane, une Amérique française au visage cosmopolite. Cette Amérique, que notre mémoire a occultée, n\'a pas entièrement disparu. Les toponymes en témoignent : New Orleans, Baton Rouge, Saint-Louis, Montréal, etc., de nombreuses villes nord-américaines ont cri pour fondateurs des Français. Des millions d\'Américains, aux États-Unis comme au Canada, ont des noms d\'origine française. Archambault, Bissonnette, Boucher, Colombe, Dion, Pineaux, Roubideaux : imagine-t-on aujourd\'hui que ces patronymes sont portés notamment par des Indiens du Dakota ? Parmi les descendants des colons français, et pas seulement au Québec comme on le croit parfois, certains parlent toujours la langue de Molière. Ce legs, on ne saurait le comprendre sans se glisser, au fil de la lecture, dans une pirogue ou dans un canoë à la recherche d\'une histoire ignorée&nbsp;</div>', 'ea3ab90a90770ef20ab8b36c13231866e85e1a6c.jpg', 864, '14.00', NULL, '208080121X', '978-2080801210', 10),
(12, 5, 'Histoire des coureurs de bois', 'Français', 'Temus', 'Perrin', '4 mars 2021', '<div>&nbsp;\" <em>Coureurs de bois, voyageurs, traiteurs, hommes du Nord, mangeurs de lard, hommes libres, chasseurs des montagnes</em> \" : ces appellations pittoresques témoignent d\'une Amérique oubliée, celle d\'avant la conquête de l\'Ouest. D\'origine européenne, les hommes qu\'on désignait ainsi sillonnaient le Nouveau Monde en quête de fourrures, séjournant et parfois hivernant parmi les Amérindiens ; ils formaient des sociabilités itinérantes et masculines, étroitement associées aux communautés autochtones. Restituer leurs circulations, c\'est repenser la construction des sociétés coloniales dans leur rapport à l\'espace, à l\'ordre et à l\'altérité, et mettre au jour des expériences singulières de la masculinité, comme d\'une certaine forme de liberté. Le lecteur est ainsi convié au dévoilement d\'une aventure interculturelle intense et méconnue, longue pourtant de deux siècles et qui s\'est jouée sur tout un continent.&nbsp;</div>', '526b42910b96701c29c83e38937e7adfb6d01dfc.jpg', 1230, '16.00', '12.00', '2262088128', '978-2262088125', 7),
(13, 5, 'Nous étions libres comme le vent', 'Français', 'Espaces Libres - Terre Indienne', 'Albin Michel', '26 janvier 2022', '<div>&nbsp;Au cours de la seconde moitié du XIXe siècle, le territoire couvert aujourd\'hui par le Nouveau-Mexique, l\'Arizona et le Nord du Mexique fut le théâtre d\'une tragédie marquée par la violence, la perfidie et la cruauté. Dans cette lutte sans merci, les chefs apaches n\'auront de cesse de défendre leur patrie, alors que leurs ennemis n\'aspirent qu\'à leur mort, leur déportation ou leur parcage sur des réserves.<br>Peu de chefs indiens auront exercé une aussi grande fascination que les figures désormais légendaires de Cochise et Géronimo. Sous la plume de <strong>David Roberts</strong>, écrivain et journaliste, cette histoire des guerres apaches devient une véritable épopée. II nous donne à lire une immense fresque épique, remarquablement construite et mise en scène, qui porte un regard particulier sur le rapport entre des cultures différentes et sur les peuples qui combattent pour leur liberté.&nbsp;</div>', 'e0a9bc8c3c1495300c844246c4887f4b9997eb84.jpg', 544, '14.00', NULL, '2226470514', '978-2226470515', 10),
(14, 5, 'L\'Amérique fantôme: Les aventuriers francophones du Nouveau Monde', 'Français', 'Champs-Histoire', 'Flammarion', '13 octobre 2021', '<div>&nbsp;Oublions les westerns. Entre le XVI° et le XIX° siècle, l\'Amérique du Nord a été sillonnée par des aventuriers de langue française. Coureurs de bois, trappeurs, interprètes, ces hommes, en quête de fourrures, se sont constamment mêlés aux Amérindiens. En partant sur la piste de dix voyageurs, originaires de la France ou du Canada, <strong>Gilles Havard </strong>fait surgir des scènes saisissantes : adoption d\'un jeune Français par des Iroquois, pirogues chargées de peaux de castor descendant la rivière Missouri, retrouvailles lors des grandes haltes de caravanes dans les Rocheuses... À travers ces destins hors du commun se dessine une autre histoire de la colonisation européenne, occultée par le récit américain de la conquête de l\'Ouest : une histoire d\'échanges et de métissages, dont les têtes d\'affiche sont des Français et des Amérindiens. S\'appuyant sur des récits de voyage, des archives et des témoignages de descendants, enrichi de cartes et d\'images inédites, cet ouvrage donne vie à un monde jusqu\'ici invisible.&nbsp;</div>', '539f67200d6add8166bcc8fab2e4c6d01096638c.jpg', 656, '13.00', NULL, '2080247123', '978-2080247124', 10),
(15, 5, 'L\'historien et le film', 'Français', 'Folio-Histoire', 'Gallimard', '27 septembre 2018', '<div>&nbsp;Il y eut d\'abord les liens que le cinéma tisse avec la société de son temps. <strong>Marc Ferro </strong>en a traité dans<em> Cinéma et histoire</em> (Folio Histoire n° 55).&nbsp; <br>Il y a, désormais, les rapports que les historiens entretiennent avec le film, en tant qu\'objet d\'analyse mais aussi en tant que mode d\'écriture. Pour mieux donner à percevoir, par la fiction et la compression du temps, ce qu\'ils ne peuvent écrire dans un livre, certains historiens ont fait le choix de passer à la réalisation. Plus généralement, l\'historien est devenu un conseiller, ce qui conduit à expliciter l\'évolution du statut de son expertise. Qu\'il se définisse, au cœur de l\'Histoire, comme oeuvre ou document d\'archives, du <em>Jour le plus long</em> (1962) à <em>Dunkirk </em>(2017), le film est assurément une mise en récit, au même titre que le discours de l\'historien. Mais il crée également des formes spécifiques de figuration de l\'histoire.<br>&nbsp;C\'est, à partir d\'analyses de films et de documentaires historiques ou de fiction comme de leur propre expérience cinématographique, ce que montrent <strong>Christian Delage</strong> et <strong>Vincent Guigueno</strong> dans cet ouvrage pionnier, devenu un classique.&nbsp;</div>', '35b3d5bd7ca75852ce1f51663fb71525cda7a2cc.jpg', 432, '9.70', NULL, '2072797446', '978-2072797446', 10),
(16, 5, 'L\'Europe de 1815 à nos jours', 'Français', NULL, 'PUF', '7 janvier 2015', '<div>&nbsp;Cet ouvrage entend considérer l\'Europe comme un tout et ne pas rester prisonnier des histoires nationales, pour comprendre le chemin parcouru depuis le Congrès de Vienne, de l\'ère des nationalismes à l\'Union européenne, c\'est-à-dire à un espace international organisé très original (ni État centralisé, ni confédération, ni fédération), répondant aux normes de la démocratie libérale et jouissant d\'un niveau de vie élevé. La réflexion est menée à partir de trois points de vue : celui du système européen et de son évolution progressive, depuis le « Concert européen » du XIX° siècle jusqu\'à l\'intégration européenne actuelle ; celui des grandes évolutions politiques, économiques, sociales et culturelles de l\'Europe ; celui, enfin, de l\'expérience historique unique de la démocratisation progressive de tout un continent. La méthode suivie insiste sur la notion de structures dans les relations internationales : structures d\'équilibres géopolitiques, structures de relations diplomatiques, structures juridiques, structures de civilisation. Cette notion résume les recherches les plus avancées de la science historique actuelle dans ce domaine et permet de poser le problème de l\'Europe, de son identité, de ses limites, de façon nouvelle.&nbsp;</div>', '67c8994f5091c754cb8b4950604486ca58c557cf.jpg', 520, '36.00', '30.00', '2130634923', '978-2130634928', 10),
(17, 5, 'Les Maquisards', 'Français', NULL, 'Vendémiaire', '19 septembre 2019', '<div>&nbsp;Des maquis, on connaît la légende. Celle de ces jeunes hommes qui, à partir de 1942, choisissent la clandestinité pour combattre l\'occupant. Celle des batailles des Glières ou du Vercors. Celle des résistants qui libérèrent des villes entières, avant même l\'arrivée des armées alliées. Hors de ces images d\'Épinal, pourtant, les maquisards restent des inconnus. De quel milieu venaient-ils ? À quelles motivations obéissaient-ils ? Comment ont-ils été formés, comment se sont-ils comportés devant l\'ennemi ? Comment ont-ils vécu ensemble, parfois pendant près de deux années, dans des conditions matérielles souvent très précaires ? De quels soutiens ont-ils pu bénéficier parmi les populations locales ? Ont-ils inconsidérément livré celles-ci aux représailles allemandes ? Les réponses ne sont pas univoques. Car, depuis la fin de l\'année 1942, lorsqu\'apparaissent les premiers camps, jusqu\'aux combats de la Libération, l\'expérience n\'a pas été la même selon les périodes et les contextes, variant considérablement en fonction de la date de formation du maquis, des territoires concernés, du niveau d\'encadrement des camps ou du type d\'actions entreprises. Et à chaque fois, les réalités de terrain ont fait l\'objet de tous les fantasmes, dans l\'incessante guerre psychologique qui opposait Londres à Vichy… La première grande synthèse sur l\'histoire des maquisards à l\'échelle de toute la France, à partir de recherches menées pendant plus de dix années dans de nombreux fonds d\'archives, nationaux ou départementaux, et des témoignages des derniers survivants.&nbsp;</div>', '9e8353d96c8bf04924d92bf2288f6cb582995080.jpg', 638, '26.00', NULL, '2363583329', '978-2363583321', 10),
(18, 4, 'Le Maître du Haut Château', 'Français', NULL, 'J\'AI LU', '30 mars 2022', '<div>&nbsp;1948, fin de la Seconde Guerre mondiale et capitulation des Alliés. Vingt ans plus tard, dans les États-Pacifiques d\'Amérique sous domination nippone, la vie a repris son cours. L\'occupant a apporté avec lui sa philosophie et son art de vivre. À San Francisco, le Yi King, ou Livre des mutations, est devenu un guide spirituel pour de nombreux Américains, tel Robert Chidan, ce petit négociant en objets de collection made in USA. Certains Japonais, comme M. Tagomi, dénichent chez lui d\'authentiques merveilles. Tandis qu\'un autre livre, qu\'on s\'échange sous le manteau, fait également beaucoup parler de lui : Le Poids de la sauterelle raconte un monde où les Alliés, en 1945, auraient gagné la guerre...&nbsp;</div>', '0fe96262cc29cd2f82dff826cd9c129b7c3885a8.jpg', 384, '8.50', NULL, '2290365319', '978-2290365311', 10),
(19, 4, 'Blade runner: Les androïdes rêvent-ils de moutons électriques ?', 'Français', NULL, 'J\'AI LU', '16 février 2022', '<div>&nbsp;Le mouton n\'était pas mal, avec sa laine et ses bêlements plus vrais que nature - les voisins n\'y ont vu que du feu. Mais il arrive en fin de carrière : ses circuits fatigués ne maintiendront plus longtemps l\'illusion de la vie. Il va falloir le remplacer. Pas par un autre simulacre, non, par un véritable animal. Deckard en rêve, seulement ce n\'est pas avec les maigres primes que lui rapporte la chasse aux androïdes qu\'il parviendra à mettre assez de côté. Holden, c\'est lui qui récupère toujours les boulots les plus lucratifs - normal, c\'est le meilleur. Mais ce coup-ci, ça n\'a pas suffi. Face aux Nexus-6 de dernière génération, même Holden s\'est fait avoir. Alors, quand on propose à Deckard de reprendre la mission, il serre les dents et signe. De toute façon, qu\'a-t-il à perdre ?&nbsp;</div>', '53ae054d604aa240d82c7a5f8c0a3a5e6fe6bc1c.jpg', 288, '8.00', NULL, '2290365181', '978-2290365182', 10),
(20, 1, 'La Complainte du sentier', 'Français', 'Connaissance de l\'Orient', 'Gallimard', '24 février 2002', '<div>&nbsp;Sans le savoir, beaucoup de Français connaissent déjà ce beau roman, tous ceux qui virent au cinéma Pather panchali, qui en bengali, veut dire quelque chose comme \" <em>La chantefable (ou la complainte) du sentier</em> \". Il s\'agit d\'un roman bengali publié en 1929 par <strong>Bibhouti Bhoushan Banerji,</strong> né en 1899 près de Calcutta, dans un petit village du Bengale. Les Français connaissent aussi <em>Aparajito </em>(ou <em>L\'Invaincu</em>), et <em>Apur Sansar </em>(<em>Le monde d\'Apur</em>) , autres films de <strong>Satyajit Ray</strong> qui font suite à <em>Pather panchali.</em> Avec le<em> Godan (La Vache) </em>de <strong>Prem Chand, </strong>roman qu\'hélas on n\'a pas encore publié chez nous, et qui montre sur le vif la vie des paysans des régions où l\'on parle ourdou et hindi, les romans de <strong>Banerji</strong> nous permettent de comprendre ce qu\'est en pays bengali la vie des pauvres, c\'est-à-dire la vie de presque tout le monde. De cette humble histoire contée au fil des jours et sans recherche formaliste, s\'élève un chant qui justifie quand même le titre du roman. Il s\'agit de la quête du bonheur, dans les pires conditions. Ce petit garçon que vous suivrez pas à pas, comme vous l\'avez suivi sur l\'écran, vous ne l\'oublierez jamais. Avec<em> Tagore </em>et <strong>Saratchandra Chatterji, Banerji </strong>est un des plus grands romanciers du Bengale. La traduction n\'est pas indigne de l\'original : les adultes n\'y trouveront pas moins de joie que les enfants (la deuxième partie du roman fut déjà publiée par ceux-ci au Bengale en édition illustrée). Comme <strong>Swift,</strong> comme <strong>Cervantès</strong>, comme <em>Alice au pays des merveilles, La complainte du sentier </em>s\'adresse à tous. C\'est la marque des plus grands livres.&nbsp;</div>', '0f9b9b4f8fb130a27e39065ec0b7b6d1d176bd6b.jpg', 245, '8.53', NULL, '2070705307', '978-2070705306', 0);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Roman'),
(2, 'Récit'),
(3, 'Nouvelles'),
(4, 'Science-fiction'),
(5, 'Essai-Histoire'),
(6, 'Essai-Sociologie');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230122182652', '2023-01-22 18:27:07', 120),
('DoctrineMigrations\\Version20230122183318', '2023-01-22 18:33:31', 211),
('DoctrineMigrations\\Version20230122184144', '2023-01-22 18:42:04', 172),
('DoctrineMigrations\\Version20230122201859', '2023-01-22 20:19:16', 87),
('DoctrineMigrations\\Version20230122224428', '2023-01-22 22:44:43', 123),
('DoctrineMigrations\\Version20230127204453', '2023-01-27 20:45:05', 99);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `age` smallint(6) DEFAULT NULL,
  `flat` varchar(255) DEFAULT NULL,
  `street` varchar(255) NOT NULL,
  `town` varchar(255) NOT NULL,
  `postalcode` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(150) NOT NULL,
  `purchaseorder` longtext NOT NULL,
  `numberorder` int(11) NOT NULL,
  `totalquantite` int(11) NOT NULL,
  `totalprice` decimal(10,2) NOT NULL,
  `payment` varchar(200) NOT NULL,
  `rgpd` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `purchase`
--

INSERT INTO `purchase` (`id`, `firstname`, `lastname`, `age`, `flat`, `street`, `town`, `postalcode`, `email`, `telephone`, `purchaseorder`, `numberorder`, `totalquantite`, `totalprice`, `payment`, `rgpd`) VALUES
(1, 'Corto', 'Maltese', NULL, NULL, '45 rue de Venise', 'Paris', 75000, 'cortomaltese@mail.fr', '44 44 44 44 44', '<ul>\r\n <li>\r\n<i>Les Services secrets d\'Eisenhower</i> de <b>Stephen Edward Ambrose</b> | prix unitaire :  4.50 €  |quantité : 2 | Total  9 €   \r\n</li>\r\n <li>\r\n<i>Histoire mondiale des services secrets</i> de <b>Rémi Kauffer</b> | prix unitaire :  14.90 €  |quantité : 1 | Total  14.9 €   \r\n</li>\r\n<li>\r\n<i>Rua</i> de <b>Miguel Torga</b> | prix unitaire :  16.00 €   |quantité : 1 | Total  16 €    \r\n </li>\r\n</ul>', 32780, 4, '39.90', 'Chèque', 1),
(5, 'Michel', 'Strogoff', NULL, NULL, '21 rue du Tsar de toutes les Russies', 'Paris', 75000, 'michelstrogoff@mail.fr', '75 75 75 75 75', '<ul>\r\n                                                                    <li>\r\n                                        <i>Kang Sheng - Le maître espion de Mao</i> de  <b>Rémi Kauffer</b>  <b>Roger Faligot</b>   | prix unitaire :  10.00 €  |quantité : 1 | Total  10 €   \r\n                                    </li>\r\n                                                                    <li>\r\n                                        <i>Histoire mondiale des services secrets</i> de  <b>Rémi Kauffer</b>   | prix unitaire :  14.90 €  |quantité : 1 | Total  14.9 €   \r\n                                    </li>\r\n                                                                </ul>', 32781, 2, '24.90', 'Virement', 1),
(6, 'James', 'West', NULL, NULL, '33 rue des mystères de l\'Ouest', 'Nantes', 44000, 'jameswest@mail.fr', '44 44 44 44 44', '<ul>\r\n                                                                    <li>\r\n                                        <i>La société très secrète des marcheurs solitaires</i> de  <b>Rémy Oudghiri</b>   | prix unitaire :  17.00 €  |quantité : 1 | Total  17 €   \r\n                                    </li>\r\n                                                                    <li>\r\n                                        <i>Dante n\'avait rien vu</i> de  <b>Albert Londres</b>   | prix unitaire :  7.33 €  |quantité : 1 | Total  7.33 €   \r\n                                    </li>\r\n                                                                </ul>', 32782, 2, '24.33', 'Carte', 1),
(7, 'Sherlock', 'Holmes', NULL, NULL, '221B Baker Street', 'Londres', 0, 'sherlockholmes@mail.uk', '55 66 66 66 66', '<ul>\r\n                                                                    <li>\r\n                                        <i>Blade runner: Les androïdes rêvent-ils de moutons électriques</i> de  <b>Philippe K. Dick</b>   | prix unitaire :  8.00 €  |quantité : 24 | Total  192 €   \r\n                                    </li>\r\n                                                                </ul>', 32783, 24, '192.00', 'Carte', 1),
(8, 'John H.', 'Watson', NULL, NULL, '221B Baker Street', 'Londres', 0, 'johnwatson@mail.uk', '22 22 22 22 22', '<ul>\r\n                                                                    <li>\r\n                                        <i>Nous étions libres comme le vent</i> de  <b>David Roberts</b>   | Prix unitaire :  14.00 €  | Quantité : 1 | Total  14 €   \r\n                                    </li>\r\n                                                                    <li>\r\n                                        <i>Histoire des coureurs de bois</i> de  <b>Gilles Havard</b>   | Prix unitaire :  12.00 €   | Quantité : 1 | Total  12 €    \r\n                                    </li>\r\n                                                                </ul>', 32784, 2, '26.00', 'Mandat', 1),
(9, 'Ric', 'Hochet', NULL, 'Appartement 5', '14 rue Edgar Quinet', 'Nantes', 44000, 'richochet@mail.com', '33 33 33 33 33', '<ul>\r\n                                                                    <li>\r\n                                        <i>La société très secrète des marcheurs solitaires</i> de  <b>Rémy Oudghiri</b>   | Prix unitaire :  17.00 €  | Quantité : 2 | Total  34 €   \r\n                                    </li>\r\n                                                                    <li>\r\n                                        <i>La Complainte du sentier</i> de  <b>Bibhouti Bhoushan Banerji</b>   | Prix unitaire :  8.53 €  | Quantité : 1 | Total  8.53 €   \r\n                                    </li>\r\n                                                                </ul>', 32785, 3, '42.53', 'Chèque', 1),
(10, 'Lucky', 'Luke', NULL, NULL, '12 rue du Far west', 'San Francisco', 941032, 'luckyluke@mail.us', '22 22 22 22 22', '<ul>\r\n                                                                    <li>\r\n                                        <i>Histoire mondiale des services secrets</i> de  <b>Rémi Kauffer</b>   | Prix unitaire :  14.90 €  | Quantité : 2 | Total  29.8 €   \r\n                                    </li>\r\n                                                                    <li>\r\n                                        <i>Histoire des coureurs de bois</i> de  <b>Gilles Havard</b>   | Prix unitaire :  12.00 €   | Quantité : 3 | Total  36 €    \r\n                                    </li>\r\n                                                                    <li>\r\n                                        <i>Kang Sheng - Le maître espion de Mao</i> de  <b>Rémi Kauffer</b>  <b>Roger Faligot</b>   | Prix unitaire :  10.00 €  | Quantité : 1 | Total  10 €   \r\n                                    </li>\r\n                                                                </ul>', 32786, 6, '75.80', 'Virement', 1),
(12, 'Diego', 'de la Vega', NULL, NULL, '11 rue du sergent Garcia', 'Los Angelès', 90000, 'diego@mail.fr', '55 55 55 55 55', '<ul>\r\n                                                                    <li>\r\n                                        <i>La Complainte du sentier</i> de  <b>Bibhouti Bhoushan Banerji</b>   | Prix unitaire :  8.53 €  | Quantité : 1 | Total  8.53 €   \r\n                                    </li>\r\n                                                                    <li>\r\n                                        <i>Pêcheurs d\'Islande</i> de  <b>Pierre Loti</b>   | Prix unitaire :  5.20 €  | Quantité : 1 | Total  5.2 €   \r\n                                    </li>\r\n                                                                    <li>\r\n                                        <i>Rua</i> de  <b>Miguel Torga</b>   | Prix unitaire :  15.00 €   | Quantité : 1 | Total  15 €    \r\n                                    </li>\r\n                                                                </ul>', 32787, 3, '28.73', 'Carte', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'jimchee@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$5nqu8sVEB6Q2vJHb.0avneM607IUBwzpGyp1kExJbhcC/txHwsjYW');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `author_book`
--
ALTER TABLE `author_book`
  ADD PRIMARY KEY (`author_id`,`book_id`),
  ADD KEY `IDX_2F0A2BEEF675F31B` (`author_id`),
  ADD KEY `IDX_2F0A2BEE16A2B381` (`book_id`);

--
-- Index pour la table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CBE5A33112469DE2` (`category_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `author_book`
--
ALTER TABLE `author_book`
  ADD CONSTRAINT `FK_2F0A2BEE16A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2F0A2BEEF675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK_CBE5A33112469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
