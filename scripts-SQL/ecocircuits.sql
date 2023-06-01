/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : ecocircuits

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2023-05-25 09:30:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `clients`
-- ----------------------------
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT '',
  `prenom` varchar(255) DEFAULT '',
  `email` varchar(255) DEFAULT '',
  `telephone` varchar(255) DEFAULT '',
  `adresse` varchar(255) DEFAULT '',
  `code_postal` int(11) DEFAULT NULL,
  `ville` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of clients
-- ----------------------------
INSERT INTO `clients` VALUES ('1', 'BONJOUR', 'MARTIN', 'test@gmail.com', '2323232323', null, null, null);
INSERT INTO `clients` VALUES ('4', 'François', 'Claude', 'claude.francois@ecocircuits.com', '0612345678', null, null, null);
INSERT INTO `clients` VALUES ('5', 'François', 'Claude', 'claude.francois@ecocircuits.com', '0612345678', null, null, null);
INSERT INTO `clients` VALUES ('6', 'François', 'Claude', 'claude.francois@ecocircuits.com', '1651651', null, null, null);

-- ----------------------------
-- Table structure for `commandes`
-- ----------------------------
DROP TABLE IF EXISTS `commandes`;
CREATE TABLE `commandes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_commande` varchar(255) DEFAULT NULL,
  `id_client` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of commandes
-- ----------------------------
INSERT INTO `commandes` VALUES ('3', '2023-05-12 11:49:34', '1');

-- ----------------------------
-- Table structure for `commande_details`
-- ----------------------------
DROP TABLE IF EXISTS `commande_details`;
CREATE TABLE `commande_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_commande` bigint(20) DEFAULT NULL,
  `id_produit` bigint(20) DEFAULT NULL,
  `quantite` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of commande_details
-- ----------------------------
INSERT INTO `commande_details` VALUES ('1', '1', '1', '10');
INSERT INTO `commande_details` VALUES ('2', '1', '1', '1');

-- ----------------------------
-- Table structure for `commande_producteur`
-- ----------------------------
DROP TABLE IF EXISTS `commande_producteur`;
CREATE TABLE `commande_producteur` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_commande_details` bigint(20) DEFAULT NULL,
  `id_producteur` bigint(20) DEFAULT NULL,
  `quantite` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of commande_producteur
-- ----------------------------
INSERT INTO `commande_producteur` VALUES ('1', '1', '1', '5');
INSERT INTO `commande_producteur` VALUES ('2', '1', '1', '4');
INSERT INTO `commande_producteur` VALUES ('3', '2', '2', '1');

-- ----------------------------
-- Table structure for `hub`
-- ----------------------------
DROP TABLE IF EXISTS `hub`;
CREATE TABLE `hub` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hub
-- ----------------------------

-- ----------------------------
-- Table structure for `privilege`
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', 'READ_PRIVILEGE');
INSERT INTO `privilege` VALUES ('2', 'WRITE_PRIVILEGE');
INSERT INTO `privilege` VALUES ('3', 'DELETE_PRIVILEGE');

-- ----------------------------
-- Table structure for `producteurs`
-- ----------------------------
DROP TABLE IF EXISTS `producteurs`;
CREATE TABLE `producteurs` (
  `id_producteur` bigint(20) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT '',
  `adresse_postale` varchar(255) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `tags` varchar(255) DEFAULT '',
  `mail` varchar(255) DEFAULT '',
  `rayon_livraison` float DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id_producteur`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of producteurs
-- ----------------------------
INSERT INTO `producteurs` VALUES ('1', 'test', 'test', null, null, 'test@gmail.com', '40', '0');
INSERT INTO `producteurs` VALUES ('2', 'ADPEP 45 EA La Noue du Bois', '25 Bd Jean Jaures, 45000 ORLEANS', 'L’Entreprise Adaptée La Noue du Bois (ADPEP 45) est situé à Dampierre en Burly. Elle emploie des personnes ayant une « reconnaissance en qualité de travailleur handicapé » avec une orientation en milieu de travail. Cette entreprise œuvre sur plusieurs activités de travail, comme l’entretien des jardins et espaces verts, le maraichage, ou encore diverses prestations de services, … L’activité maraichage compte 6 salariés depuis sa création en 2010. Nous produisons une diversité de légumes de saison sur une surface d’un ha de plein champ et 0.5 ha d’abris froids.', 'Agriculture biologique\r\nProduits : Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('3', 'ALLAIRE Daniel SAS', 'Le Bourg, 45460 St Aignan des Gues', null, 'Agriculture biologique\r\nFamille : TRANS\r\nProduits : Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('4', 'AgroPaul', 'Chemin des Maisons Rouges, 41700 Le Controis-en-Sologne', 'Entreprise familiale de transformation de légumes biologiques en 4ème gamme', 'Agriculture biologique\r\nCertificat : Bio\r\nFamille : TRANS\r\nProduits : Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('5', 'Anthémis', 'Route de Marcilly en Gault, 41200 MILLANCAY', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('6', 'Arlesthis', 'Pulant, 41370 Marchenoir', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('7', 'Association Atouts et Perspectives', '33 Rue des Bourgetteries, 37390 METTRAY', 'Les 4 Saisons d\'Atouts constitue l\'établissement producteur de légumes biologiques géré par l\'Association Atouts et Perspectives à tout âge.\r\n Situé à Mettray Tours Nord, cette entité s\'inscrit dans l\'insertion par l\'activité économique au service de l\'employabilité des personnes en situation de fragilité. Ce chantier d\'insertion, ouvert en 2020, accueille femmes ou hommes dans le cadre d\'un projet d\'économie social et solidaire de proximité afin de faciliter leur insertion sociale et professionnelle. \r\n 38 légumes bio de saison, de proximité, de qualité sont récoltés à maturité sur une surface de 2 hectares dont 300 m² sous abris. Peu de manipulations et de stockage sont appliqués.', 'Agriculture biologique\r\nCertificat : AB\r\nProduits : Légume\r\nRécolte à maturité\r\nSite internet : http://atouts-et-perspectives.fr', '', null, '0');
INSERT INTO `producteurs` VALUES ('8', 'Association Le Relais', '12 Place de Juranville, 18000 Bourges', 'Association de solidarité agissant sur l\'hébergement, l\'accès aux droits et l\'insertion professionnelle en chantiers d\'insertion utilisant des activités comme la maraîchage biologique et la transformation de fruits et légumes comme support.', 'Agriculture biologique\r\nProduits : Fruit, Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('9', 'Aux Jardins du Soubeau', 'Le Soubeau, 18570 Morthomiers', 'Ferme maraîchère, production de fruits et légumes de saison sous serres et en plein champ sur 2ha.', 'Agriculture biologique\r\nProduits : Fruit, Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('10', 'Aux Légumes Célestes', '49 Rue du Grand Orme, 45150 Férolles', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('11', 'BENOIST Alexandre', 'Route de Tigy, 45600 VIGLAIN', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('12', 'BRESLU Antoine', '11 rue de la Colombe, 41160 MOISY', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('13', 'Berry graines', 'Rifardeaux, 18350 Nérondes', null, 'Agriculture biologique\r\nCertificat : Ecpcert\r\nFamille : GROUP\r\nProduits : Céréale\r\nSite internet : http://berrygraines.com', '', null, '0');
INSERT INTO `producteurs` VALUES ('14', 'Bio Centre Loire', null, 'Bio Centre Loire est une coopérative de producteurs 100% Bio qui met en marché les FEL bio issus des fermes adhérentes en région Centre Val de Loire. Créé en 2016 par 7 producteurs, BCL rassemble aujourd\'hui 36 fermes au profil diversifié. La gamme proposée est large (Plus de 35 familles pour plus de 100 références produits). En 2021, BCL a commercialisé 3 000 t de FEL pour un chiffre d\'affaires de 4,4 millions d\'euros. Nous sommes spécialisés sur l\'expédition en frais (marché de demi-gros/gros). Nos producteurs ont leur siège social et leurs sites de production en région Centre VDL. Ils sont 100% bio et engagés dans la certification Bio Cohérence (pas de travailleurs détachés, pas de serres chauffées, pas de CMS, ...). Le stockage et le conditionnement ont lieu sur les fermes. Notre leitmotiv : Développer une agriculture biologique exigeante en région Centre Val de Loire en construisant des filières durables, équitables et rémunératrices pour les producteurs.', 'Agriculture biologique\r\nCertificat : Bio\r\nFamille : GROUP\r\nProduits : Fruit, Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('15', 'CHAMPDAVOINE Baptiste', null, null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('16', 'Domaine de St Gilles', '68 Route de Thenay, 41400 Pontlevoy', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('17', 'EARL ARIBAUD', 'La Pharmacie, 45150 Férolles', null, 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('18', 'EARL BAIGNOUX', 'Baignoux, 41500 Villexanton', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('19', 'EARL Biotope', 'Villerussien, 41500 Maves', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('20', 'EARL DAVEAU', 'Bardie, 41370 St Leonard en beauce', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('21', 'EARL Grésillon', '4 Rue des prés, 28310 GOMMERVILLE', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('22', 'EARL Jean-Baptiste BOURDELOUP', '24 Hameau de Lutz, 28150 Éole-en-Beauce', 'Installé en 2008 sur la ferme familiale en production de céréales (blé tendre, tournesol, lentilles, luzernes) et légumes frais destinés à l\'industrie, je me suis converti en bio en 2018. J\'ai développé une nouvelle production de légumes secs pour la vente en circuits courts en 2020. Je propose désormais de la lentille verte BIO en conditionnement de 500g et 10kg. J\'envisage d\'élargir la gamme de légumes secs avec une production de haricots secs.', 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Céréale, Légume\r\nVolonté de produire en agriculture biologique de conservation des sols (limiter le labour et favoriser les couverts végétaux).', '', null, '0');
INSERT INTO `producteurs` VALUES ('23', 'EARL LA JONCHERE', '138 Route d’Ouvrouer, 45110 Sigloy', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('24', 'EARL LEPAGE Vincent', '12 Rue de Chateaudun, 41240 Beauce la Romaine', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('25', 'EARL Le Champ d\'Eau', '7 Hameau de Bazainville, 45480 GRENEVILLE en BEAUCE', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('26', 'EARL Les Caves du Lochois', '16 Rue de Vautrompeau, 37600 Loches', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('27', 'EARL Les Epis d\'Or', '6 Rue des Epis d’Or, 28800 Neuvy-en-Dunois', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('28', 'EARL Nouvellon Agri Bio', '6 Chemin de Cour-sur-loire, 41500 Mulsans', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('29', 'EARL Philippe JUMEAU', '2 rue Albert CAMUNEAU, 28200 Thiville', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('30', 'EARL Pontijou', null, null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('31', 'EARL S;Guerin', 'Occonville 17 rue du lion, 28700 Le Gué de Longroi', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('32', 'EARL Serres Bio Val', '257 Rue des Serres, 45590 Saint-Cyr-en-Val', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('33', 'EARL Vazelle', 'Vazelle, 41130 Billy', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('34', 'EARL Zou la Galinette', '443 Rue du Parc Floral, 45590 Saint-Cyr-en-Val', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('35', 'EARL de la Bourgognerie', '18 Rue Trianon, 45310 Patay', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('36', 'EARL de la Ferme des 4 Vents', '6 rue des 4 Vents, 41500 La Chapelle-Saint-Martin', null, 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Huile, Céréale, Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('37', 'EARL de la Galinette', '10 Boisville, 41240 Beauce la Romaine', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('38', 'EARL de la Varenne', '2 Rue du Vignoble, 45300 DADONVILLE', null, 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Céréale', '', null, '0');
INSERT INTO `producteurs` VALUES ('39', 'EARL des Ruesses', 'Les Ruesses, 18380 Presly', null, 'Agriculture biologique\r\nCertificat : Bio\r\nFamille : TRANS\r\nProduits : Produit carné, Porc', '', null, '0');
INSERT INTO `producteurs` VALUES ('40', 'EARL du Bois Galant', '32 Rue Florimond Robertet, 28800 Alluyes', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('41', 'EARL du Montet', 'Le Montet, 18120 Méreau', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('42', 'EARL du Tacre', '82 Petite Rue, 45160 Saint-Hilaire-Saint-Mesmin', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('43', 'EARL la Renardière', '5 Faubourg du Parc, 45480 Outarville', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('44', 'Entraide Berruyère', '261 Route de Saint-michel, 18000 Bourges', 'Association loi 1901 créée en 1984 gérant des ateliers d\'insertion dont la culture maraîchère en biodynamie et des actions sociales. Son objectif : Aider des personnes en grande difficulté.', 'Agriculture biologique\r\nProduits : Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('45', 'FONTAINE Jérôme', '13 Dommarville, 28800 Sancheville', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('46', 'Ferme de Léonard', '6 Rue des Marronniers, 28220 CLOYES sur LOIR', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('47', 'Ferme de l\'Aulnay', 'Route de Tigy, 45600 Viglain', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('48', 'Ferme de la Motte', '52, rue du Château, 41370 Talcy', 'La Ferme de la Motte est une entreprise familiale (5 frères et cousins) située à Talcy entre Beauce et Châteaux. Producteur BIO depuis 1997, la ferme produit aujourd\'hui (avec l\'aide de ses producteurs partenaires) sur plus de 400 ha BIO en région Centre Val de Loire. Les produits phares sont : ail, oignon, échalote, pomme de terre et courge.', 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('49', 'Fromagerie MAURICE', 'Bourdel, 37160 NEUILLY LE BRIGNON', 'Nous fabriquons à la ferme des produits laitiers bio avec le lait récoltés dans un périmètre de 25 km alentour.', 'Agriculture biologique\r\nCertificat : Bio\r\nFamille : TRANS\r\nProduits : Produit laitier de vache\r\nSite internet : http://www.fromageriemaurice.fr', '', null, '0');
INSERT INTO `producteurs` VALUES ('50', 'GABB 18', '2701 route d\'Orléans BP 10, 18230 Saint Doulchard', null, 'Agriculture biologique\r\nCertificat : Bio\r\nFamille : GROUP', '', null, '0');
INSERT INTO `producteurs` VALUES ('51', 'GAEC Ferme de la Cour', '22 Rue Fernand Boulon Seillac, 41190 Valloire sur Cisse', null, 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('52', 'GAEC Hofstede', 'Ferme de la Garenne, 18800 BAUGY', null, 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Céréale, Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('53', 'GAEC St Paul', '73 Rue St Jacques, 37600 LOCHES', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('54', 'GAEC Ste Marie', 'Domaine Ste Marie des Dués, 45570 Ouzouer sur Loire', null, 'Agriculture biologique\r\nProduits : Volaille, Oeuf, Viande bovine, Produit carné\r\nSite internet : http://fermebiosaintemarie.e-monsite.com/', '', null, '0');
INSERT INTO `producteurs` VALUES ('55', 'GAEC de la Georgerie', '301 chemin de la georgerie, 37360 Rouziers-de-Touraine', 'La Ferme de la Georgerie est composée d\'Audrey et Cyrille associés co-gérants et d\'un salarié à temps partiel.\r\n Nous cultivons des céréales en agriculture biologique sur 120 hectares et transformons nos céréales en farines et pâtes sur la ferme. Nous approvisionnons boulangeries, épiceries et particuliers.', 'Agriculture en conversion biologique\r\nProduits : Céréale', '', null, '0');
INSERT INTO `producteurs` VALUES ('56', 'GAEC du Chat Blanc', null, null, 'Agriculture biologique\r\nCertificat : FR-BIO-10\r\nVente à la ferme\r\nProduits : Céréale\r\nSite internet : https://fr-fr.facebook.com/fermeduchatblanc/', '', null, '0');
INSERT INTO `producteurs` VALUES ('57', 'GAEC du Mesnil', '11 Onville, 45480 GRENEVILLE en BEAUCE', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('58', 'GAUTHIER Hugues', '5 bis grande rue, 41370 LORGES', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('59', 'GOUEFFON Alexandre', 'Les Champarts, 45170 NEUVILLE aux BOIS', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('60', 'HUGUET Emilien', '15 Rue des Breluquettes, 41500 Séris', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('61', 'HUGUET Florentin', '21 Chemin de Paris, 41500 Seris', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('62', 'Histoire de fruits', '7 Rue des Avanries, 37130 La Chapelle-aux-Naux', null, 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Fruit', '', null, '0');
INSERT INTO `producteurs` VALUES ('63', 'ISA Entraide', '9 bis Avenue du Général de Gaulle, 18700 Aubigny sur Nère', null, 'Agriculture biologique\r\nProduits : Légume\r\nSite internet : http://www.isagroupe.fr', '', null, '0');
INSERT INTO `producteurs` VALUES ('64', 'Jean-David LOCHON', '5 Place St Georges, 28300 JOUY', 'Exploitation agricole, producteur de blé dur Bio, transformation de notre Blé dur Bio en pâtes artisanales semi-complètes depuis 2016.', 'Agriculture biologique\r\nLabel : Bio Ecocert\r\nCertificat : Bio\r\nProduits : Céréale', '', null, '0');
INSERT INTO `producteurs` VALUES ('65', 'Julie BLESSON-MAHAIS', '1 Rue du Presbytère, 41190 SANTENAY', 'Fabrication de muesli issu de l\'agriculture biologique.', 'Agriculture biologique\r\nCertificat : Bio\r\nFamille : TRANS\r\nProduits : Céréale', '', null, '0');
INSERT INTO `producteurs` VALUES ('66', 'L\'Abeille de Sologne', '14 Rue des Sautereaux, 41300 Theillay', 'Eleveur d\'abeilles par passion, je suis à la tête de 200 ruches et exploite plusieurs ruchers en Sologne et en Berry. Je ne vends que des miels de ma production. Je propose une gamme de 10 miels et autres produits de la ruche certifiées bio.', 'Agriculture biologique\r\nProduits : Miel\r\nSite internet : http://www.abeilledesologne.fr', '', null, '0');
INSERT INTO `producteurs` VALUES ('67', 'LEGRAND Emmanuel', '16 Juvrainville, 28200 Villampuy', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('68', 'LEXTERIAT Loïc', 'Le Grand Vignol, 36110 Vineuil', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('69', 'La Ferme de Doublainville', 'Doublainville, 41240 BEAUCE LA ROMAINE', 'Jeune producteur installé en agriculture biologique depuis 2022, je produits des patates douce et pommes de terre, céréales et légumineuses.', 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Céréale, Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('70', 'La Ferme de Léonard', '6 Rue des Marronniers, 28220 Cloyes les 3 rivières', 'Ferme bio depuis 2017, production de céréales diverses (sarrazin, chanvre, chia...) de légumineuses, et légumes pleins champs (potimarrons, butternuts et autres courges.\r\n Une petite production de courgettes et tomates.', 'Agriculture biologique\r\nProduits : Céréale, Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('71', 'La Ferme des Perrières', '165 Rue des Perrières, 45160 Saint-Hilaire-Saint-Mesmin', 'Arboriculteur maraîcher depuis 1964 sur une exploitation de 20 ha..', 'Agriculture biologique\r\nLabel : Bio cohérence\r\nCertificat : Bio\r\nProduits : Fruit, Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('72', 'La Ferme du Relais', 'Le Relais, 36180 PELLEVOISIN', 'A la Ferme du Relais, nous cultivons des céréales diversifiées dans le respect de l\'agriculture paysanne et biologique.\r\n Nous transformons nos récoltes sur place en farines écrasées sur meule de pierre, en pains pur levain cuits dans un four à bois et en huile pressés à froid.\r\n A la saison, nous produisons également des asperges vertes et blanches à têtes violettes que nous récoltons et trions à la main.\r\n Afin d\'entretenir la biodiversité, et les paysages de notre Boischaut, nous avons plantés des haies et des arbres en agroforesteries dans nos parcelles cultivées.', 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Huile, Céréale', '', null, '0');
INSERT INTO `producteurs` VALUES ('73', 'La Gauloise Dorée', 'La Folie Le quartier, 37160 La Celle Saint Avant', null, 'Agriculture biologique\r\nProduits : Volaille', '', null, '0');
INSERT INTO `producteurs` VALUES ('74', 'La branche à fruits', 'La Toucherie, 37320 SAINT BRANCHS', null, 'Agriculture biologique\r\nLabel : Bio cohérence\r\nVente à la ferme\r\nProduits : Fruit', '', null, '0');
INSERT INTO `producteurs` VALUES ('75', 'Laiterie de Verneuil', 'Les Arcis, 37600 Verneuil sur Indre', 'Coopérative Touraine Berry, fabrication de beurre, lait et fromage de chèvre.', 'Agriculture biologique\r\nProduits : Produit laitier de chèvre, Produit laitier de vache\r\nSite internet : http://www.laiterie-de-verneuil.com', '', null, '0');
INSERT INTO `producteurs` VALUES ('76', 'Le Grain Libre', '5 route du Coudray, 37600 Saint jean Saint Germain', 'Le Grain Libre, c\'est un collectif de sept fermes bio du Sud Touraine unies par une envie forte de vivre une aventure commune : apprendre à valoriser nos céréales et à les transformer ensemble.\r\n C\'est dans l\'atelier de Saint-Jean-Saint-Germain que les grains de blé tendre de variétés paysannes passent entre les meules de granite du moulin pour devenir des farines.\r\n Simplement mélangées à un peu d\'eau, c\'est l\'extrudeuse qui donne forme à nos spécialités céréalières, type pâtes sèches.', 'Agriculture biologique\r\nN° Siret :80982627400015 N° TVA intracom. :FR53809826274\r\nProduits : Céréale', '', null, '0');
INSERT INTO `producteurs` VALUES ('77', 'Le goût des saisons', '2013 Route des Forêts, 18110 Saint-Martin-d\'Auxigny', 'Paysan maraîcher en agriculture biologique diversifiée. Je cultive sur la commune de St Martin d\'Auxigny et dans les marais de Bourges. Les cultures sont en places permanentes en agroécologie et un système verger - maraicher.', 'Agriculture biologique\r\nCertificat : Ecocert\r\nProduits : Fruit, Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('78', 'Le jardin du Breuil', '31 Le Breuil aux Gittons, 36700 CLION', 'Maraicher en agriculture biologique installé depuis juillet 2017 à Clion', 'Agriculture biologique\r\nCertificat : AB\r\nProduits : Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('79', 'Les Vergers du Closeau', '748 Route de Villesavin, 41250 Mont Près Chambord', 'Nous produisons des fruits à pépins (Pommes principalement et poires) ainsi que des fraises. Une diversification est engagée sur d\'autres petits fruits (framboises notamment). L\'ensemble de l\'exploitation est conduite en respectant le cahier des charges de l\'agriculture biologique. Le verger est encore en conversion tandis que le reste de l\'exploitation est labelisé AB.', 'Agriculture en conversion biologique\r\nProduits : Fruit, Boisson\r\nSite internet : http://www.lesvergersducloseau.fr', '', null, '0');
INSERT INTO `producteurs` VALUES ('80', 'Les jardins de Cocagnes', '112 Rue de Bas-rivière, 41000 Blois', null, 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Fruit, Légume\r\nSite internet : http://www.association-biosolidaire.fr', '', null, '0');
INSERT INTO `producteurs` VALUES ('81', 'Les jardins de contrat', 'Roucheux, 37530 Montreuil-en-Touraine', null, 'Agriculture biologique\r\nProduits : Fruit, Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('82', 'Louis CAILLEAU', '66 Rue de la Motte, 45150 Darvoy', null, 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Fruit, Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('83', 'Loïc COSSET', '16 bis Bel Air, 36500 CHEZELLES', 'Maraîcher bio depuis 2014, je produis des fruits et légumes traditionnels. J\'ai également choisi de me diversifier en produisant du raisin de table.\r\n Je cultive une surface de 8ha de légumes et 2ha20 de raisin de table.', 'Agriculture biologique\r\nProduits : Fruit, Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('84', 'MINEC-DUBE Jérôme', '555 Route de Saint-Jean de Braye, 45400 Semoy', 'Installé depuis 2014 sur une petite surface de 1.5 ha en production de légumes et fruits bio.', 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Fruit, Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('85', 'MORINEAU Xavier', 'Villeramard, 41500 Maves', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('86', 'Négo Beauce', '5 La Frileuse, 28140 Orgères-en-Beauce', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('87', 'POTHIER Sylvain', 'Hameau de Loupille, 28140 Péronville', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('88', 'Porcs Bio du Centre', 'Gorgeat, 41100 Azé', 'Créée en 2008 la SARL «PORCS BIO DU CENTRE» comprend un groupe d’éleveurs de porcs, des charcutiers dont un titulaire du titre de « Maître Artisan ». Cette réunion témoigne de l’attachement et de l’engagement ancien des associés dans des valeurs d’authenticité\r\n très fortes des points de vue humain, environnemental et économique.\r\n Les fermes, conduites en polyculture-élevage 100 % bio couvrent la totalité des besoins alimentaires en céréales et en fourrage des porcs.\r\n Les porcs sont conduits par chaque éleveur à un abattoir local de petite taille où l’on prend en compte au maximum le bien-être animal.\r\n Les charcutiers expérimentent et mettent au point des recettes, utilisant au maximum les qualités des viandes des porcs fournis par les éleveurs.\r\n Ensemble ils coordonnent leurs savoirs faire et associent leurs compétences individuelles pour fournir ce qui leur semble être le meilleur des productions de terroir : pâté de campagne, Jambon de Vendée IGP, etc.\r\n L’essentiel des producti', 'Agriculture biologique\r\nCertificat : Bio\r\nFamille : TRANS\r\nProduits : Agneau, Viande bovine, Produit carné, Porc', '', null, '0');
INSERT INTO `producteurs` VALUES ('89', 'Provinces Bio - Relais Vert', '71 Boulevard Alfred Nobel, 44400 Rezé', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('90', 'SAMYN Frédéric', '8 Les Tresseaux, 41330 Averdon', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('91', 'SARL FFBIO', 'Lieu dit Chatenay, 28140 Bazoches en Dunois', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('92', 'SARL La Porte Dorée', '32 Route de Fougères, 41700 CHEVERNY', 'Transformation de fruits et légumes bio depuis 2011 à nos marques (Conserverie de Cheverny, Confiturerie de Cheverny, Confibio) et pour le compte de maraîchers et arboriculteurs locaux.', 'Agriculture biologique\r\nCertificat : Bio\r\nFamille : TRANS\r\nProduits : Fruit, Confiture', '', null, '0');
INSERT INTO `producteurs` VALUES ('93', 'SARL Saute Mouton', 'Forcelles, 45510 TIGY', 'Exploitation familiale en polyculture-élevage 100% bio depuis 1996, sous label bio cohérence, avec une activité d\'accueil pédagogique à destination de tous les publics.', 'Agriculture biologique\r\nLabel : Bio cohérence\r\nProduits : Légume\r\nSite internet : http://www.saute-mouton.net', '', null, '0');
INSERT INTO `producteurs` VALUES ('94', 'SAS Brasserie Sancerroise', '258 Route d\'Amigny, 18300 Sancerre', 'A la recherche d\'une bière artisanale à Sancerre ?\r\n Nos bières sont toutes brassées localement dans le Centre de la France à Sancerre, selon d\'anciennes recettes, toutes différentes les unes des autres, ainsi nous vous donnons le choix entre : \r\n Infusion et décoction, fermentation haute et basse, bières filtrées ou non filtrées, bières refermentées en bouteilles ou non.', 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Boisson', '', null, '0');
INSERT INTO `producteurs` VALUES ('95', 'SAS Domaine du Coudray', 'Le Coudray, 18290 Civray', null, 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Céréale', '', null, '0');
INSERT INTO `producteurs` VALUES ('96', 'SASU Ju\'Nature', '10 Rue du Petit Bois Ferme de la Paternelle, 37390 METTRAY', 'Céréalier Bio sur 184ha sur la commune de Mettray avec une activité de transformation à la ferme (huiles, lentilles, plats préparés) et une activité de compostage.', 'Agriculture biologique\r\nCertificat : Bio\r\nVente à la ferme\r\nProduits : Huile, Céréale\r\nSite internet : https://www.leschampsdejulien.com/', '', null, '0');
INSERT INTO `producteurs` VALUES ('97', 'SCEA Ferme des Montmartins', 'D 72 Les Montmartins, 41350 SAINT CLAUDE DE DIRAY', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('98', 'SCEA L\'Orée de la Brenne', 'Maisons Sinaud, 36700 Arpheuilles', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('99', 'SCEA La Croix des Vignes', '27 Rue de Beaugency, 41290 Oucques La Nouvelle', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('100', 'SCEA La Tibiodaire', '4 Le Parc de la Thibaudiere, 37120 Courcoué', null, 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Huile, Céréale', '', null, '0');
INSERT INTO `producteurs` VALUES ('101', 'SCEA Le Petit Bergeresse', 'Le Petit de Bergeresse, 45510 VIENNE en VAL', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('102', 'SCEA Les Fourmis Vertes', '7 Rue de la Vacquerie, 41000 Blois', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('103', 'SCEA Les Vergers', 'Petit Biche, 41370 Saint-Léonard-en-Beauce', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('104', 'SCEA Obi', '14 Rue du Bout Hallé, 41500 Séris', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('105', 'SCEA de Villardeau', 'Lieu Dit Villardeau, 18340 Senneçay', null, 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('106', 'SCEA de la Croix de Guignas', '21 Chemin de Paris, 41500 Seris', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('107', 'SCEA la Croix des Vignes', '27 Rue de Beaugency, 41290 Oucques La Nouvelle', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('108', 'Saint Cyr Bio Val', '257 Rue des Serres, 45590 Saint-Cyr-en-Val', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('109', 'Ternao', '5 rue Pierre et Marie Curie INGRE, 45140 Saint Jean de la Ruelle', null, 'Agriculture biologique\r\nFamille : XXX\r\nProduits : Fruit, Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('110', 'Terra Cérès', '17 rue des Entrepreneurs, 41700 Le Controis en Sologne', null, 'Agriculture biologique\r\nCertificat : Bio\r\nFamille : TRANS\r\nSite internet : https://terraceres.bio/', '', null, '0');
INSERT INTO `producteurs` VALUES ('111', 'Terres Dormes', '11 Les Bordes, 41100 ROCE', null, null, '', null, '0');
INSERT INTO `producteurs` VALUES ('112', 'Terres d\'Excellences', '8 Rue de Mérangle, 28500 Germainville', 'Exploitation agricole de 263 hectares en polyculture élevage et labelisée en agriculture biologique, la Ferme de Germainville possède un troupeau de vaches Angus d\'un peu plus de 200 animaux élevés uniquement à l\'herbe.\r\n La ferme cultive sur l\'autre partie de ses terres des céréales, légumineuses et cultures fourragères.', 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Huile, Céréale, Viande bovine, Produit carné', '', null, '0');
INSERT INTO `producteurs` VALUES ('113', 'Thomas GANEM', 'Les Hézeaux, 45360 Saint-Firmin-sur-Loire', null, 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Légume', '', null, '0');
INSERT INTO `producteurs` VALUES ('114', 'Val Bio Centre', '27bis Rue des Ponts Chartrains, 41000 Blois', null, 'Agriculture biologique\r\nCertificat : Bio\r\nProduits : Boisson non alcoolisée, Huile, Céréale, Oeuf, Fruit, Confiture, Aromate, Légume, Boisson', '', null, '0');

-- ----------------------------
-- Table structure for `produits`
-- ----------------------------
DROP TABLE IF EXISTS `produits`;
CREATE TABLE `produits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT '',
  `tva` varchar(255) DEFAULT NULL,
  `producteurs` varchar(255) DEFAULT '',
  `reference` varchar(255) DEFAULT '',
  `origine_production` varchar(255) DEFAULT NULL,
  `origine_transformation` varchar(255) DEFAULT NULL,
  `agriculture` varchar(255) DEFAULT NULL,
  `type_produit` varchar(255) DEFAULT NULL,
  `conditionnement` varchar(255) DEFAULT NULL,
  `dluo` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=714 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of produits
-- ----------------------------
INSERT INTO `produits` VALUES ('5', 'Betterave botte x10', '5.5%', 'Bio Centre Loire', 'BETBOT', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Colis 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('6', 'Betterave crue (variété crapaudine, chioggia)', '5.5%', 'SARL Saute Mouton', 'BETCRUDIV', 'Loiret', 'Loiret', 'Biologique', 'Légume', 'Conditionnement : Cagette 5 kg', '4 jours', null, null);
INSERT INTO `produits` VALUES ('8', 'Blette', '5.5%', 'Les jardins de contrat', 'BLET5', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Légume', 'Conditionnement : Cagette 5 kg', '4 jours', null, null);
INSERT INTO `produits` VALUES ('9', 'Champignon eryngii', '5.5%', 'Bio Centre Loire', 'D1DAWHV5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 1 kg', '4 jours', null, null);
INSERT INTO `produits` VALUES ('10', 'Champignon nameko', '5.5%', 'Bio Centre Loire', 'QDU9UVJB', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 1 kg', '4 jours', null, null);
INSERT INTO `produits` VALUES ('11', 'Champignon pleurote', '5.5%', 'Bio Centre Loire', 'CHAMPIPLE', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 2 kg', '4 jours', null, null);
INSERT INTO `produits` VALUES ('12', 'Champignon shiitaké', '5.5%', 'Bio Centre Loire', '213MFYJY', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 2 kg', '4 jours', null, null);
INSERT INTO `produits` VALUES ('13', 'Chou blanc lisse X8 pièces', '5.5%', 'Bio Centre Loire', 'CHOUBL', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Colis 4.8 kg', null, null, null);
INSERT INTO `produits` VALUES ('15', 'Chou rave x8 pcs', '5.5%', 'Bio Centre Loire, Les jardins de contrat', 'CHOURAV', 'Loir et Cher, Indre et Loire', 'Loir et Cher, Indre et Loire', 'Biologique', 'Légume', 'Conditionnement : Colis 4 kg', null, null, null);
INSERT INTO `produits` VALUES ('16', 'Epinards feuilles', '5.5%', 'Bio Centre Loire', 'EPINFE', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 4 kg', null, null, null);
INSERT INTO `produits` VALUES ('17', 'Navet primeur vrac', '5.5%', 'Bio Centre Loire, Les jardins de contrat', 'Z5AFSV73', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Colis 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('18', 'Navet primeur x10 bottes', '5.5%', 'Bio Centre Loire', 'NAVPRIBO', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Colis 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('19', 'Poireau', '5.5%', 'Bio Centre Loire', 'W8S3K8BS', 'Loiret', 'Loiret', 'Biologique', 'Légume', 'Conditionnement : Cagette 5 kg', '4 jours', null, null);
INSERT INTO `produits` VALUES ('20', 'Poireau', '5.5%', 'Bio Centre Loire', 'POIR10', 'Loiret', 'Loiret', 'Biologique', 'Légume', 'Conditionnement : Cagette 10 kg', '4 jours', null, null);
INSERT INTO `produits` VALUES ('21', 'Pomme de terre de conservation chair ferme', '5.5%', 'Bio Centre Loire, Ferme de la Motte, La Ferme des Perrières', 'PDTCONS', 'Loiret, Loir et Cher', 'Loiret, Loir et Cher', 'Biologique', 'Pomme de terre', 'Conditionnement : Cagette 10 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('22', 'Pomme de terre de conservation chair tendre', '5.5%', 'Bio Centre Loire, Ferme de la Motte, La Ferme des Perrières', 'KF2U3SQY', 'Loir et Cher, Loiret', 'Loir et Cher, Loiret', 'Biologique', 'Pomme de terre', 'Conditionnement : Cagette 10 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('23', 'Pomme de terre primeur', '5.5%', 'MINEC-DUBE Jérôme', 'PDTPRIM', 'Loiret', 'Loiret', 'Biologique', 'Légume', 'Conditionnement : Cagette 5 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('24', 'Radis rond noir X12 bottes', '5.5%', 'SARL Saute Mouton', 'FUYKKNVI', 'Loiret', 'Loiret', 'Biologique', 'Légume', 'Conditionnement : Colis', '4 jours', null, null);
INSERT INTO `produits` VALUES ('25', 'Radis rose x12', '5.5%', null, 'RADBOT20', 'Centre Val de Loire', 'Centre Val de Loire', 'Biologique', 'Légume', 'Conditionnement : Cagette 4.8 kg', '3 jours', null, null);
INSERT INTO `produits` VALUES ('26', 'Radis rose x20', '5.5%', 'Les jardins de Cocagnes', 'RADLONGRO', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 10 kg', '3 jours', null, null);
INSERT INTO `produits` VALUES ('27', 'Rutabaga', '5.5%', 'SARL Saute Mouton', 'RUTAB', 'Loiret', 'Loiret', 'Biologique', 'Légume', 'Conditionnement : Cagette 5 kg', '4 jours', null, null);
INSERT INTO `produits` VALUES ('28', 'Salade batavia rouge X12 pcs', '5.5%', 'Bio Centre Loire', 'J219922Q', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 4.8 kg', null, null, null);
INSERT INTO `produits` VALUES ('29', 'Salade batavia verte X12 pcs', '5.5%', 'Bio Centre Loire', 'SALBATA', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 4.8 kg', null, null, null);
INSERT INTO `produits` VALUES ('30', 'Salade batavia verte x8 pcs', '5.5%', 'MINEC-DUBE Jérôme, Les jardins de Cocagnes', 'SALBAT', 'Loir et Cher, Loiret', 'Loir et Cher, Loiret', 'Biologique', 'Légume', 'Conditionnement : Cagette 3.2 kg', null, null, null);
INSERT INTO `produits` VALUES ('31', 'Salade feuille de chêne rouge x12pc', '5.5%', 'Bio Centre Loire, Association Atouts et Perspectives', '3W5JLFVM', 'Loir et Cher, Indre et Loire', 'Loir et Cher, Indre et Loire', 'Biologique', 'Légume', 'Conditionnement : Cagette 4.8 kg', null, null, null);
INSERT INTO `produits` VALUES ('32', 'Salade feuille de chêne verte x12pc', '5.5%', 'Bio Centre Loire, Association Atouts et Perspectives', 'SALFECH8', 'Loir et Cher, Indre et Loire', 'Loir et Cher, Indre et Loire', 'Biologique', 'Légume', 'Conditionnement : Cagette 4.8 kg', null, null, null);
INSERT INTO `produits` VALUES ('33', 'Salade roquette', '5.5%', 'Bio Centre Loire', 'SALAROQU', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 1 kg', '3 jours', null, null);
INSERT INTO `produits` VALUES ('34', 'Salade rougette x12pc', '5.5%', 'Les jardins de Cocagnes', 'SALROUG', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 3.2 kg', '3 jours', null, null);
INSERT INTO `produits` VALUES ('35', 'Ail calibre +70', '5.5%', 'Ferme de la Motte', 'KH6GH23L', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Carton 5 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('36', 'Ail calibre 40/70', '5.5%', 'Ferme de la Motte', 'GJIDRTSR', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Carton 5 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('37', 'Echalion calibre +50', '5.5%', 'Ferme de la Motte, Association Le Relais', 'Q1PH1ET8', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', 'Légume', 'Conditionnement : Carton 5 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('38', 'Echalion calibre 20/50', '5.5%', 'Ferme de la Motte, Association Le Relais', 'N2WFWHVR', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', 'Légume', 'Conditionnement : Carton 5 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('39', 'Echalote calibre +50', '5.5%', 'EARL ARIBAUD, Ferme de la Motte, MINEC-DUBE Jérôme', 'H779XNBN', 'Loiret, Loir et Cher', 'Loiret, Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 5 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('40', 'Echalote calibre 20/50', '5.5%', 'Bio Centre Loire, EARL ARIBAUD, Ferme de la Motte, Louis CAILLEAU', 'ECHALO', 'Loiret, Loir et Cher', 'Loiret, Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 5 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('41', 'Oignon jaune calibre +80', '5.5%', 'Bio Centre Loire, EARL ARIBAUD, Ferme de la Motte, MINEC-DUBE Jérôme', 'WEPD9TTG', 'Loiret, Loir et Cher', 'Loiret, Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 5 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('42', 'Oignon jaune calibre 40/60', '5.5%', 'Bio Centre Loire, Ferme de la Motte, MINEC-DUBE Jérôme', 'N7TULTYS', 'Loiret, Loir et Cher', 'Loiret, Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 5 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('43', 'Oignon jaune calibre 60/80', '5.5%', 'Bio Centre Loire, EARL ARIBAUD, Ferme de la Motte, MINEC-DUBE Jérôme', 'E42YF3DP', 'Loiret, Loir et Cher', 'Loiret, Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 5 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('44', 'Oignon rouge +80', '5.5%', 'Bio Centre Loire, EARL ARIBAUD, Ferme de la Motte', '42JSW76Z', 'Loiret, Loir et Cher', 'Loiret, Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Colis bois 5 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('45', 'Oignon rouge calibre 40/60', '5.5%', 'Bio Centre Loire, EARL ARIBAUD, Ferme de la Motte, Louis CAILLEAU', 'MVSAVVU5', 'Loiret, Loir et Cher', 'Loiret, Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 5 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('46', 'Oignon rouge calibre 60/80', '5.5%', 'Bio Centre Loire, EARL ARIBAUD, Ferme de la Motte, MINEC-DUBE Jérôme', 'Z8V3VNXV', 'Loiret, Loir et Cher', 'Loiret, Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 5 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('47', 'Oignons blancs x10 bottes', '5.5%', 'Bio Centre Loire', 'OIBLBOT', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Colis 5 kg', '14 jours', null, null);
INSERT INTO `produits` VALUES ('48', 'Menthe x6 bottes', '5.5%', 'Bio Centre Loire', 'MENTHE', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Colis 350 g', null, null, null);
INSERT INTO `produits` VALUES ('49', 'Oseille x10 bouquets', '5.5%', 'Les jardins de Cocagnes', 'OSEIL', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Cagette 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('50', 'Persil plat x6 bottes', '5.5%', 'Bio Centre Loire', 'PERS', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Colis 350 g', null, null, null);
INSERT INTO `produits` VALUES ('51', 'Betterave CUBE 10x10', '5.5%', 'AgroPaul', 'T5IR1UA3', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('52', 'Betterave ENTIERE épluchée', '5.5%', 'AgroPaul', 'BETENTEP', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('53', 'Betterave RAPEE', '5.5%', 'AgroPaul', '4BSFCZE5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('54', 'Carotte ENTIERE éboutée', '5.5%', 'AgroPaul', 'CARENTEBO', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('55', 'Carotte RAPEE', '5.5%', 'AgroPaul', 'CARRAP', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('56', 'Carotte RONDELLE', '5.5%', 'AgroPaul', 'CARROND', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('57', 'Céleri rave QUARTIER', '5.5%', 'AgroPaul', 'CELRAVQUA', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('58', 'Céleri rave RAPE', '5.5%', 'AgroPaul', 'BNLD4C4S', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('59', 'Chou blanc EMINCE', '5.5%', 'AgroPaul', 'FPXN4ZW3', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('60', 'Chou blanc QUARTIER', '5.5%', 'AgroPaul', 'NAY15AY6', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('61', 'Chou rouge EMINCE', '5.5%', 'AgroPaul', '8SRT9EBC', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('62', 'Chou rouge QUARTIER', '5.5%', 'AgroPaul', 'AVE54LX5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('63', 'Courgette RAPE (avec peau)', '5.5%', 'AgroPaul', 'DIS9M55U', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('64', 'Courgette RONDELLE (avec peau)', '5.5%', 'AgroPaul', 'CAJZLV2A', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Colis 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('65', 'Mélange potage (selon saison)', '5.5%', 'AgroPaul', 'MELPOT', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('66', 'Panais CUBE 10x10', '5.5%', 'AgroPaul', '7K6I8KRF', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('67', 'Panais ENTIER épluché', '5.5%', 'AgroPaul', 'R2XP7JKX', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('68', 'Panais RAPE', '5.5%', 'AgroPaul', 'JHTRU451', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('69', 'Poireau EMINCE', '5.5%', 'AgroPaul', 'POIREMIN', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('70', 'Poireau ENTIER', '5.5%', 'AgroPaul', 'POIRENTI', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('71', 'Pomme de terre CUBE crue épluchée 10X10', '5.5%', 'AgroPaul', 'POMCCUB', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('72', 'Pomme de terre ENTIERE crue épluchée', '5.5%', 'AgroPaul', 'POMCEEP', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('73', 'Pomme de terre FRITE crue 10X10', '5.5%', 'AgroPaul', '5JT2DGGF', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('74', 'Pomme de terre RONDELLE crue épluchée', '5.5%', 'AgroPaul', 'JJLMWZKS', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume quatrième gamme', 'Conditionnement : Colis sous vide 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('75', 'Betteraves CUBES cuites sous vide 6x2kg', '5.5%', ' ALLAIRE Daniel SAS', 'ZM87QRZB', 'Espagne', 'Loiret', 'Biologique', 'Légume cinquième gamme', 'Conditionnement : Carton 12 kg', null, null, null);
INSERT INTO `produits` VALUES ('76', 'Betteraves CUBES cuites sous vide paquet 2x200gr x 18 étuis', '5.5%', ' ALLAIRE Daniel SAS', 'BETCUCSV', 'Espagne', 'Loiret', 'Biologique', 'Légume cinquième gamme', 'Conditionnement : Colis 7.2 kg', null, null, null);
INSERT INTO `produits` VALUES ('77', 'Betteraves ENTIERES cuites sous vide sachet 500gr x20', '5.5%', ' ALLAIRE Daniel SAS', 'BATENTCUISV', 'Espagne', 'Loiret', 'Biologique', 'Légume cinquième gamme', 'Conditionnement : Colis 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('78', 'Maïs EPI cuits sous vide paquet 400gr x12', '5.5%', ' ALLAIRE Daniel SAS', 'MAIEPICSV', 'France', 'Loiret', 'Biologique', 'Légume cinquième gamme', 'Conditionnement : Colis 4.8 kg', null, null, null);
INSERT INTO `produits` VALUES ('79', 'Marrons ENTIERS cuits sous vides sachet 200gr x15', '5.5%', ' ALLAIRE Daniel SAS', 'MARENTCSV', 'France', 'Loiret', 'Biologique', 'Légume cinquième gamme', 'Conditionnement : Colis 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('80', 'Pommes de terre CUBES cuites sous vides', '5.5%', ' ALLAIRE Daniel SAS', 'PDTCUBCSV', 'France', 'Loiret', 'Biologique', 'Légume cinquième gamme', 'Conditionnement : Poche 2.5 kg (x4)', null, null, null);
INSERT INTO `produits` VALUES ('81', 'Pommes de terre ENTIERES cuites sous vides 4x2.5kg', '5.5%', ' ALLAIRE Daniel SAS', 'PDTENTCSV', 'France', 'Loiret', 'Biologique', 'Légume cinquième gamme', 'Conditionnement : Carton 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('82', 'Fraises cat 1 x 10 barquettes', '5.5%', 'Les Vergers du Closeau, Loïc COSSET', 'FRAI1', 'Loir et Cher, Indre', 'Loir et Cher, Indre', 'Biologique', 'Fruit', 'Conditionnement : Barquette 500 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('83', 'Fraises cat1 x20 barquettes', '5.5%', 'Les Vergers du Closeau, Loïc COSSET', 'FRAI2', 'Loir et Cher, Indre', 'Loir et Cher, Indre', 'Biologique', 'Fruit', 'Conditionnement : Barquette 250 g (x20)', null, null, null);
INSERT INTO `produits` VALUES ('84', 'Rhubarbe', '5.5%', 'Bio Centre Loire', 'RHUBARBE', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Fruit', 'Conditionnement : Cagette 6 kg', null, null, null);
INSERT INTO `produits` VALUES ('85', 'Yaourt nature 125gr (x24)', '5.5%', 'Fromagerie MAURICE', 'YANA125', 'Centre Val de Loire', 'Indre et Loire', 'Biologique', 'Produit laitier', 'Conditionnement : Pack 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('86', 'Yaourt aromatisé fraise 125gr (x24)', '5.5%', 'Fromagerie MAURICE', 'YAAROFR125', 'Centre Val de Loire', 'Indre et Loire', 'Biologique', 'Produit laitier', 'Conditionnement : Pack 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('87', 'Yaourt aromatisé vanille 125gr (x24)', '5.5%', 'Fromagerie MAURICE', 'YAAROVA125', 'Centre Val de Loire', 'Indre et Loire', 'Biologique', 'Produit laitier', 'Conditionnement : Pack 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('88', 'Yaourt nature sucré 125gr (x24)', '5.5%', 'Fromagerie MAURICE', 'YANASU125', 'Centre Val de Loire', 'Indre et Loire', 'Biologique', 'Produit laitier', 'Conditionnement : Pack 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('89', 'Lait UHT 1/2 écrémé Laiterie Verneuil', '5.5%', 'Laiterie de Verneuil', 'LAITUHT', 'Centre Val de Loire', 'Indre et Loire', 'Biologique', 'Produit laitier', 'Conditionnement : Pack 1 L (x6)', '60 jours', null, null);
INSERT INTO `produits` VALUES ('90', 'Beurre doux plaquette', '5.5%', 'Laiterie de Verneuil', 'BEURDX', 'Centre Val de Loire', 'Indre et Loire', 'Biologique', 'Produit laitier', 'Conditionnement : 250 g (x20)', '60 jours', null, null);
INSERT INTO `produits` VALUES ('91', 'Amarante blanche', '5.5%', 'Berry graines', 'AMARBLA', 'Centre Val de Loire', 'Cher', 'Biologique', null, 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('92', 'Amarante noire', '5.5%', 'Berry graines', 'AMARNOI', 'Centre Val de Loire', 'Cher', 'Biologique', null, 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('93', 'Chanvre décortiqué', '5.5%', 'EARL de la Ferme des 4 Vents', 'CHANVDECO', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sachet 250 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('94', 'Chia', '5.5%', 'EARL de la Ferme des 4 Vents', 'CHIA05', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sachet 250 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('95', 'Chia', '5.5%', 'EARL de la Ferme des 4 Vents', 'CHIA5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('96', 'Lin brun', '5.5%', 'EARL de la Ferme des 4 Vents', 'LINBRU05', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sachet 250 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('97', 'Lin brun', '5.5%', 'EARL de la Ferme des 4 Vents', 'LINBRU5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('98', 'Lin brun', '5.5%', 'EARL de la Ferme des 4 Vents', 'LINBR10', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('99', 'Lin doré', '5.5%', 'EARL de la Ferme des 4 Vents', 'LINDOR05', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sachet 250 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('100', 'Lin doré', '5.5%', 'EARL de la Ferme des 4 Vents, GAEC Ferme de la Cour', 'LINDOR5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('101', 'Lin doré', '5.5%', 'EARL de la Ferme des 4 Vents', 'LINDOR10', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('102', 'Millet décortiqué', '5.5%', 'SCEA La Tibiodaire', 'MILDECO1', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 1 kg (x3)', null, null, null);
INSERT INTO `produits` VALUES ('103', 'Millet décortiqué', '5.5%', 'SCEA La Tibiodaire', 'MILDECO5', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('104', 'Millet décortiqué', '5.5%', 'SCEA La Tibiodaire', 'MILDECO10', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('105', 'Petit Epeautre', '5.5%', 'Terres d\'Excellences, Berry graines', 'PETEPEA', 'Eure et Loir, Cher', 'Eure et Loir, Cher', 'Biologique', null, 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('106', 'Petit Epeautre', '5.5%', 'Terres d\'Excellences, Berry graines', 'FRYVVNBQ', 'Eure et Loir, Cher', 'Eure et Loir, Cher', 'Biologique', null, 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('107', 'Polenta de maïs', '5.5%', 'GAEC de la Georgerie', 'POLMAI5', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('108', 'Polenta de maïs', '5.5%', 'GAEC de la Georgerie', 'POLMAI10', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('109', 'Quinoa', '5.5%', 'Ferme de la Motte, EARL de la Ferme des 4 Vents, GAEC Ferme de la Cour, GAEC du Chat Blanc', 'QUINBL5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('110', 'Quinoa', '5.5%', 'EARL de la Ferme des 4 Vents', 'QUINOBLC10', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('111', 'Quinoa Blanc cuisson rapide 6mn', '5.5%', 'Berry graines', 'QUIBLC6MN', 'Centre Val de Loire', 'Cher', 'Biologique', null, 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('112', 'Quinoa Blanc cuisson rapide 6mn', '5.5%', 'Berry graines', '97XANSF8', 'Centre Val de Loire', 'Cher', 'Biologique', null, 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('113', 'Semoule de maïs', '5.5%', 'La Ferme du Relais', 'SEMMAIS4', 'Indre', 'Indre', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 4 kg', null, null, null);
INSERT INTO `produits` VALUES ('114', 'Tournesol décortiqué', '5.5%', 'Berry graines', 'TOURDECO', 'Centre Val de Loire', 'Cher', 'Biologique', null, 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('115', 'Farine blé complète T110', '5.5%', 'SCEA La Tibiodaire, La Ferme du Relais, GAEC de la Georgerie', 'FARIBLET1105', 'Indre et Loire, Indre', 'Indre et Loire, Indre', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('116', 'Farine blé semi complète T110', '5.5%', 'SCEA La Tibiodaire, GAEC du Chat Blanc', 'FARISECOMP', 'Loir et Cher, Indre et Loire', 'Loir et Cher, Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('117', 'Farine blé T110', '5.5%', 'La Ferme du Relais', 'FARIT1105', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('118', 'Farine de blé 65', '5.5%', 'SCEA La Tibiodaire, Terres d\'Excellences, GAEC de la Georgerie, GAEC du Chat Blanc', 'FABL655', 'Indre et Loire, Loir et Cher, Eure et Loir', 'Indre et Loire, Loir et Cher, Eure et Loir', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('119', 'Farine de blé 65', '5.5%', 'SCEA La Tibiodaire, GAEC de la Georgerie', 'FABL6510', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('120', 'Farine de blé 80', '5.5%', 'SCEA La Tibiodaire, La Ferme du Relais, GAEC de la Georgerie', 'FABL805', 'Indre et Loire, Indre', 'Indre et Loire, Indre', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('121', 'Farine de blé 80', '5.5%', 'SCEA La Tibiodaire, GAEC de la Georgerie', 'FABL8010', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('122', 'Farine de haricot', '5.5%', 'Terres d\'Excellences', 'FARIHARI', 'Eure et Loir', 'Eure et Loir', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('123', 'Farine de pois chiche', '5.5%', 'Terres d\'Excellences', 'FARIPOICHI', 'Eure et Loir', 'Eure et Loir', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('124', 'Farine grand épeautre', '5.5%', 'GAEC de la Georgerie', 'FARIGDEPEA5', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('125', 'Farine grand épeautre', '5.5%', 'GAEC de la Georgerie', 'FARIGDEPEA10', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('126', 'Farine lentilles vertes', '5.5%', 'GAEC de la Georgerie', 'FARILENT5', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('127', 'Farine lentilles vertes', '5.5%', 'GAEC de la Georgerie', 'FARILENT10', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('128', 'Farine maïs', '5.5%', 'GAEC de la Georgerie', 'FARIMAI5', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('129', 'Farine maïs', '5.5%', 'GAEC de la Georgerie', 'FARIMAI10', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('130', 'Farine millet', '5.5%', 'GAEC de la Georgerie', 'FARIMIL5', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('131', 'Farine millet', '5.5%', 'GAEC de la Georgerie', 'FARIMIL10', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('132', 'Farine petit épeautre', '5.5%', 'Terres d\'Excellences, GAEC de la Georgerie, GAEC du Chat Blanc', 'FARPTEPEA', 'Loir et Cher, Eure et Loir', 'Loir et Cher, Eure et Loir', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('133', 'Farine petit épeautre', '5.5%', 'GAEC de la Georgerie', 'FARIPTEP10', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('134', 'Farine sarrasin', '5.5%', 'La Ferme du Relais, GAEC de la Georgerie, GAEC du Chat Blanc', 'FARISAR', 'Loir et Cher, Indre', 'Loir et Cher, Indre', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('135', 'Farine sarrasin', '5.5%', 'GAEC de la Georgerie', 'FARISAR10', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('136', 'Farine seigle', '5.5%', 'La Ferme du Relais, GAEC de la Georgerie, GAEC du Chat Blanc', 'FARISEIG', 'Loir et Cher, Indre', 'Loir et Cher, Indre', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('137', 'Farine seigle', '5.5%', 'GAEC de la Georgerie', 'FARISEI10', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('138', 'Pâtes Campanelles', '5.5%', 'GAEC du Chat Blanc', 'PATCAMP5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('139', 'Pâtes Campanelles Ail des ours', '5.5%', 'GAEC du Chat Blanc', 'PATAILOUR5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('140', 'Pâtes Campanelles aux Cêpes', '5.5%', 'GAEC du Chat Blanc', 'PATCEP5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('141', 'Pâtes Conchiglis nature', '5.5%', 'GAEC de la Georgerie', 'CONCHNAT', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 12.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('142', 'Pâtes Coquillages', '5.5%', 'GAEC du Chat Blanc', 'PATCOQUILA5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('143', 'Pâtes Coquillettes', '5.5%', 'Jean-David LOCHON, GAEC du Chat Blanc', 'PATCOQ5', 'Eure et Loir, Loire et Cher', 'Eure et Loir, Loire et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('144', 'Pâtes Fusilis', '5.5%', 'Jean-David LOCHON', 'PATFUS5', 'Eure et Loir', 'Eure et Loir', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('145', 'Pâtes Linguines', '5.5%', 'GAEC du Chat Blanc', 'PATLING5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('146', 'Pâtes Pennes', '5.5%', 'GAEC du Chat Blanc', 'PATPEN5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('147', 'Pâtes Risonis', '5.5%', 'GAEC du Chat Blanc', 'PATRIS5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('148', 'Pâtes Sarrasinettes (coquillettes) 99% sarrasin', '5.5%', 'Le Grain Libre', 'SARRAS', 'Indre et Loire', 'Indre et Loire', 'Biologique', null, 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('149', 'Pâtes Tagliatelles', '5.5%', 'GAEC du Chat Blanc', 'PATTAGL5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('150', 'Pâtes Torsades aux shiitaké 96% blé tendre', '5.5%', 'Le Grain Libre', 'TORTAK', 'Indre et Loire', 'Indre et Loire', 'Biologique', null, 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('151', 'Pâtes Torsades basilic', '5.5%', 'GAEC de la Georgerie', 'TORSBAS', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 12.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('152', 'Pâtes Torsades curry', '5.5%', 'GAEC de la Georgerie', 'TORSCUR', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : sac 12.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('153', 'Pâtes Torsades d\'engrain 100% petit épeautre', '5.5%', 'Le Grain Libre', 'TORSENG', 'Indre et Loire', 'Indre et Loire', 'Biologique', null, 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('154', 'Pâtes Torsades nature', '5.5%', 'GAEC du Chat Blanc', 'PATTORS5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('155', 'Pâtes Torsades paysannes 100% blé tendre', '5.5%', 'Le Grain Libre', 'TORSPAY', 'Indre et Loire', 'Indre et Loire', 'Biologique', null, 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('156', 'Flageolets', '5.5%', 'Terres d\'Excellences', 'FLAGEOTEREX', 'Eure et Loir', 'Eure et Loir', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('157', 'Flageolets', '5.5%', 'EARL Jean-Baptiste BOURDELOUP', 'HFLAGEO10', 'Eure et Loire', 'Eure et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : SAC 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('158', 'Haricots blancs coco', '5.5%', 'EARL Jean-Baptiste BOURDELOUP', 'HBLANCO10', 'Eure et Loire', 'Eure et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : SAC 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('159', 'Haricots blancs lingots', '5.5%', 'EARL de la Ferme des 4 Vents, Terres d\'Excellences, GAEC Hofstede, GAEC du Chat Blanc', 'HARIBLC', 'Cher, Loir et Cher, Eure et Loir', 'Cher, Loir et Cher, Eure et Loir', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('160', 'Haricots blancs lingots', '5.5%', 'EARL de la Ferme des 4 Vents, EARL Jean-Baptiste BOURDELOUP', 'HBLANLING10', 'Eure et Loire, Loir et Cher', 'Eure et Loire, Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : SAC 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('161', 'Haricots bruns', '5.5%', 'GAEC Hofstede', 'HARIBRU', 'Cher', 'Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('162', 'Haricots jaune paille', '5.5%', 'GAEC Hofstede', 'HARIJAUPAI', 'Cher', 'Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('163', 'Haricots rouges', '5.5%', 'EARL de la Ferme des 4 Vents, Terres d\'Excellences, GAEC Hofstede, GAEC du Chat Blanc', 'HARIRGE', 'Cher, Loir et Cher, Eure et Loir', 'Cher, Loir et Cher, Eure et Loir', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('164', 'Haricots rouges', '5.5%', 'EARL de la Ferme des 4 Vents, EARL Jean-Baptiste BOURDELOUP', 'HROUG10', 'Eure et Loire, Loir et Cher', 'Eure et Loire, Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : SAC 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('165', 'Lentilles corail', '5.5%', 'EARL de la Ferme des 4 Vents, Berry graines', 'LENTCOR5', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('166', 'Lentilles corail', '5.5%', 'EARL de la Ferme des 4 Vents, Berry graines', 'LENTCOR10', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('167', 'Lentilles vertes', '5.5%', 'EARL de la Ferme des 4 Vents, SAS Domaine du Coudray, Terres d\'Excellences, GAEC Hofstede, GAEC du Chat Blanc, SASU Ju\'Nature, Berry graines', 'LENTVERT', 'Cher, Loir et Cher, Eure et Loir, Indre et Loire', 'Cher, Loir et Cher, Eure et Loir, Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('168', 'Lentilles vertes', '5.5%', 'EARL de la Ferme des 4 Vents, SAS Domaine du Coudray, Terres d\'Excellences, GAEC Hofstede, GAEC du Chat Blanc, SASU Ju\'Nature, Berry graines', 'LENTVERT10', 'Cher, Loir et Cher, Eure et Loir, Indre et Loire', 'Cher, Loir et Cher, Eure et Loir, Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('169', 'Maïs popcorn', '5.5%', 'Ferme de la Motte', 'MAIPOPCOR', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sachet 400 g (x16)', null, null, null);
INSERT INTO `produits` VALUES ('170', 'Mélange petit épeautre / lentilles', '5.5%', 'Berry graines', 'MELEPELENT', 'Centre Val de Loire', 'Cher', 'Biologique', null, 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('171', 'Mélange quinoa / lentilles corail', '5.5%', 'Berry graines', 'T9SK1Q4R', 'Centre Val de Loire', 'Cher', 'Biologique', null, 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('172', 'Pois cassés', '5.5%', 'SCEA La Tibiodaire', 'POICAS1', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 1 kg (x3)', null, null, null);
INSERT INTO `produits` VALUES ('173', 'Pois cassés', '5.5%', 'EARL de la Ferme des 4 Vents, SCEA La Tibiodaire, GAEC Hofstede', 'POICAS5', 'Indre et Loire, Cher', 'Indre et Loire, Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('174', 'Pois cassés', '5.5%', 'SCEA La Tibiodaire, GAEC Hofstede', 'POISCAS10', 'Indre et Loire, Cher', 'Indre et Loire, Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('175', 'Pois chiche', '5.5%', 'EARL de la Ferme des 4 Vents, GAEC Ferme de la Cour, SAS Domaine du Coudray, Terres d\'Excellences, GAEC Hofstede, GAEC du Chat Blanc, Berry graines', 'POICHI5', 'Loir et Cher, Cher, Eure et Loir', 'Loir et Cher, Cher, Eure et Loir', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('176', 'Pois chiche', '5.5%', 'SAS Domaine du Coudray, Terres d\'Excellences, GAEC Hofstede, GAEC du Chat Blanc, Berry graines', 'POICHI10', 'Cher, Loir et Cher, Eure et Loir', 'Cher, Loir et Cher, Eure et Loir', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('177', 'Huile Bouquet 4 fleurs 3L', '5.5%', 'SCEA La Tibiodaire', 'HUIBOU4FL3', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : Bidon (x3)', null, null, null);
INSERT INTO `produits` VALUES ('178', 'Huile Bouquet 4 fleurs 5L', '5.5%', 'SCEA La Tibiodaire', 'HUIBOU4FL5', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : Bidon (x4)', null, null, null);
INSERT INTO `produits` VALUES ('179', 'Huile Bouquet 4 fleurs 75cl', '5.5%', 'SCEA La Tibiodaire', 'HUIBOU4FL75', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Epicerie locale', 'Conditionnement : Bouteille (x6)', null, null, null);
INSERT INTO `produits` VALUES ('180', 'Huile colza', '5.5%', 'EARL de la Ferme des 4 Vents', 'HUICOLZ07', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume', 'Conditionnement : Bouteille 75 cl (x6)', null, null, null);
INSERT INTO `produits` VALUES ('181', 'Huile colza', '5.5%', 'EARL de la Ferme des 4 Vents, SASU Ju\'Nature', 'HUICOLZ5', 'Loir et Cher, Indre et Loire', 'Loir et Cher, Indre et Loire', 'Biologique', 'Huile', 'Conditionnement : Bidon 5 L (x4)', null, null, null);
INSERT INTO `produits` VALUES ('182', 'Huile de cameline 1ère pression à froid', '5.5%', 'EARL de la Ferme des 4 Vents', 'TF3JSCRH', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Huile', 'Conditionnement : Bouteille 25 cl (x6)', null, null, null);
INSERT INTO `produits` VALUES ('183', 'Huile de caméline 1ere pression à froid', '5.5%', 'EARL de la Ferme des 4 Vents', 'HUICAM07', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Huile', 'Conditionnement : Bouteille 75 cl (x6)', null, null, null);
INSERT INTO `produits` VALUES ('184', 'Huile de chanvre 1ere pression à froid', '5.5%', 'EARL de la Ferme des 4 Vents', 'HUICHA07', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Huile', 'Conditionnement : Bouteille 75 cl (x6)', null, null, null);
INSERT INTO `produits` VALUES ('185', 'Huile de chanvre 1ere pression à froid 25cl', '5.5%', 'EARL de la Ferme des 4 Vents, La Ferme du Relais', 'HUICHA25', 'Indre, Loir et Cher', 'Indre, Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Bouteille (x6)', null, null, null);
INSERT INTO `produits` VALUES ('186', 'Huile Tournesol', '5.5%', 'SCEA La Tibiodaire, Terres d\'Excellences', 'HUITOUR075', 'Indre et Loire, Eure et Loir', 'Indre et Loire, Eure et Loir', 'Biologique', 'Huile', 'Conditionnement : Bouteille 75 cl (x6)', null, null, null);
INSERT INTO `produits` VALUES ('187', 'Huile Tournesol', '5.5%', 'SCEA La Tibiodaire', 'HUITOUR3', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Huile', 'Conditionnement : Bidon 3 L (x3)', null, null, null);
INSERT INTO `produits` VALUES ('188', 'Huile Tournesol', '5.5%', 'SCEA La Tibiodaire, Terres d\'Excellences, SASU Ju\'Nature', 'HUITOUR5', 'Indre et Loire, Eure et Loir, Loir et Cher', 'Indre et Loire, Eure et Loir, Loir et Cher', 'Biologique', 'Huile', 'Conditionnement : Bidon 5 L (x4)', null, null, null);
INSERT INTO `produits` VALUES ('189', 'Huile Tournesol', '5.5%', 'SCEA La Tibiodaire', 'HUITOUR10', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Huile', 'Conditionnement : Bidon 10 L', null, null, null);
INSERT INTO `produits` VALUES ('190', 'Huile tournesol oléique \"spécial cuisson\"', '5.5%', 'SCEA La Tibiodaire', 'HUISPECUI10', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Huile', 'Conditionnement : Bidon 10 L', null, null, null);
INSERT INTO `produits` VALUES ('191', 'Huile tournesol oléique \"spéciale cuisson\"', '5.5%', 'EARL de la Ferme des 4 Vents, SCEA La Tibiodaire', 'HUITOUTOLE5', 'Indre et Loire, Loir et Cher', 'Indre et Loire, Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Bidon 5 kg (x4)', null, null, null);
INSERT INTO `produits` VALUES ('192', 'Huile tournesol oléique \"spéciale cuisson\" 75cl', '5.5%', 'EARL de la Ferme des 4 Vents, SCEA La Tibiodaire, La Ferme du Relais', 'HUITOUROLE75', 'Indre', 'Indre', 'Biologique', 'Epicerie locale', 'Conditionnement : Bouteille (x6)', null, null, null);
INSERT INTO `produits` VALUES ('193', 'Huile tournesol pimentée 25cl', '5.5%', 'La Ferme du Relais', 'HUITOUPIM25', 'Indre', 'Indre', 'Biologique', 'Epicerie locale', 'Conditionnement : Bouteille (x6)', null, null, null);
INSERT INTO `produits` VALUES ('194', 'Bocaux Haricots blancs au naturel', '5.5%', 'EARL de la Ferme des 4 Vents', 'HARBLCNAT225', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume en conserve', 'Conditionnement : Bocal 225 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('195', 'Bocaux Haricots blancs au naturel', '5.5%', 'EARL de la Ferme des 4 Vents', 'HARBLCNAT425', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume en conserve', 'Conditionnement : Bocal 425 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('196', 'Bocaux Haricots blancs au naturel', '5.5%', 'GAEC Hofstede', 'BOCHARBLC', 'Cher', 'Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Bocal 690 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('197', 'Bocaux Haricots rouges au naturel', '5.5%', 'EARL de la Ferme des 4 Vents', 'HARRGENAT225', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Bocal 225 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('198', 'Bocaux Haricots rouges au naturel', '5.5%', 'EARL de la Ferme des 4 Vents', 'HARRGENAT425', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume en conserve', 'Conditionnement : Bocal 425 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('199', 'Bocaux Haricots rouges au naturel', '5.5%', 'GAEC Hofstede', 'BOCHARRG', 'Cher', 'Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Bocal 690 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('200', 'Bocaux Lentilles vertes au naturel', '5.5%', 'EARL de la Ferme des 4 Vents', 'LENTVETNAT225', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume en conserve', 'Conditionnement : Bocal 225 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('201', 'Bocaux Lentilles vertes au naturel', '5.5%', 'EARL de la Ferme des 4 Vents', 'LENVERTNAT', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume en conserve', 'Conditionnement : Bocal 425 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('202', 'Bocaux Pois chiches au naturel', '5.5%', 'EARL de la Ferme des 4 Vents', 'POICHINAT225', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume en conserve', 'Conditionnement : Bocal 225 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('203', 'Bocaux Pois chiches au naturel', '5.5%', 'EARL de la Ferme des 4 Vents', 'POICHINAT425', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Légume en conserve', 'Conditionnement : Bocal 425 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('204', 'Bocaux Pois chiches au naturel', '5.5%', 'GAEC Hofstede', 'BOCPOICHI', 'Cher', 'Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Bocal 690 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('205', 'Rillette au piment d\'Espelette', '5.5%', 'Terres d\'Excellences', 'BKUJLDLC', null, 'Eure et Loir', 'Biologique', 'Epicerie locale', 'Conditionnement : Pot 200 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('206', 'Rillette nature', '5.5%', 'Terres d\'Excellences', 'RILPIMESP', null, 'Eure et Loir', 'Biologique', 'Epicerie locale', 'Conditionnement : Pot 200 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('207', 'Brownie Chocolat/noisette', '5.5%', ' Terra Cérès', 'RILLENAT', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Pièce 30 g (x40)', null, null, null);
INSERT INTO `produits` VALUES ('208', 'Brownie Chocolat/Noisette', '5.5%', ' Terra Cérès', 'BROCHONOI', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Pièce 75 g (x18)', null, null, null);
INSERT INTO `produits` VALUES ('209', 'Fondant noir intense', '5.5%', ' Terra Cérès', 'BROWCHONOI', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Pièce 55 g (x20)', null, null, null);
INSERT INTO `produits` VALUES ('210', 'Fondant noir intense', '5.5%', ' Terra Cérès', 'FONDNOI', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Pièce 75 g (x18)', null, null, null);
INSERT INTO `produits` VALUES ('211', 'Gâteau Amande/Citron', '5.5%', ' Terra Cérès', 'FONDNOIR75', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Pièce 70 g (x18)', null, null, null);
INSERT INTO `produits` VALUES ('212', 'Gâteau aux épices', '5.5%', ' Terra Cérès', 'GATAMCIT', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Pièce 30 g (x40)', null, null, null);
INSERT INTO `produits` VALUES ('213', 'Gâteau Chocolat noir surgelé', '5.5%', ' Terra Cérès', 'GATEPI', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Pièce 600 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('214', 'Gâteau Citron jaune', '5.5%', ' Terra Cérès', 'GATCHO600', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Pièce 30 g (x40)', null, null, null);
INSERT INTO `produits` VALUES ('215', 'Gâteau Orange douce 30gr', '5.5%', ' Terra Cérès', 'GATCITJA', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Carton 30 g (x40)', null, null, null);
INSERT INTO `produits` VALUES ('216', 'Gâteau Orange douce surgelé', '5.5%', ' Terra Cérès', 'GATORDO', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Pièce 600 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('217', 'Gâteau Praliné/Noisette', '5.5%', ' Terra Cérès', 'GATOR600', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Pièce 30 g (x40)', null, null, null);
INSERT INTO `produits` VALUES ('218', 'Muffins Chocolat/Noisette', '5.5%', ' Terra Cérès', 'GATPRANOI', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Pièce 50 g (x20)', null, null, null);
INSERT INTO `produits` VALUES ('219', 'Muffins Citron jaune', '5.5%', ' Terra Cérès', 'MUFCHONOI', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Pièce 45 g (x20)', null, null, null);
INSERT INTO `produits` VALUES ('220', 'Muffins Noisette/Praliné', '5.5%', ' Terra Cérès', 'MUFCIT', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Pièce 50 g (x20)', null, null, null);
INSERT INTO `produits` VALUES ('221', 'Purée de Pommes', '5.5%', ' SARL La Porte Dorée', 'PURPOM5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Poche 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('222', 'Purée de Pommes', '5.5%', ' SARL La Porte Dorée', 'PURPOM10', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Poche 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('223', 'Confiture abricots de Drôme', '5.5%', ' SARL La Porte Dorée', 'CONABRIDRO5', 'Drôme', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Poche 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('224', 'Confiture abricots de Drôme', '5.5%', ' SARL La Porte Dorée', 'CONABRIDRO10', 'Drôme', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Poche 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('225', 'Confiture cassis', '5.5%', 'Association Le Relais', 'KFFJLFAI', 'Cher', 'Cher', 'Biologique', null, 'Conditionnement : Pot 370 g', null, null, null);
INSERT INTO `produits` VALUES ('226', 'Confiture fraises / rhubarbe', '5.5%', 'Association Le Relais', 'F2YRF81K', 'Cher', 'Cher', 'Biologique', null, 'Conditionnement : Pot 370 g', null, null, null);
INSERT INTO `produits` VALUES ('227', 'Confiture fraises', '5.5%', 'Association Le Relais', 'CONFRA', 'Cher', 'Cher', 'Biologique', null, 'Conditionnement : Pot 370 g', null, null, null);
INSERT INTO `produits` VALUES ('228', 'Confiture fraises de Sologne', '5.5%', ' SARL La Porte Dorée', 'CONFRAISOLO5', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Poche 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('229', 'Confiture fraises de Sologne', '5.5%', ' SARL La Porte Dorée', 'CONFRAISOL10', 'Loir et Cher', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Poche 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('230', 'Confiture framboises', '5.5%', 'Association Le Relais', 'MC71NHRM', 'Cher', 'Cher', 'Biologique', null, 'Conditionnement : Pot 370 g', null, null, null);
INSERT INTO `produits` VALUES ('231', 'Confiture pommes / cannelle', '5.5%', 'Association Le Relais', 'TK5MF8VI', 'Cher', 'Cher', 'Biologique', null, 'Conditionnement : Pot 370 g', null, null, null);
INSERT INTO `produits` VALUES ('232', 'Confiture pommes / vanille', '5.5%', 'Association Le Relais', 'SPHYZJZK', 'Cher', 'Cher', 'Biologique', null, 'Conditionnement : Pot 370 g', null, null, null);
INSERT INTO `produits` VALUES ('233', 'Confiture rhubarbe', '5.5%', 'Association Le Relais', '911CI6RA', 'Cher', 'Cher', 'Biologique', null, 'Conditionnement : Pot 370 g', null, null, null);
INSERT INTO `produits` VALUES ('234', 'Muesli Banane/Caramel', '5.5%', ' Julie BLESSON-MAHAIS', 'MUFNOIPRA', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('235', 'Muesli Canneberges/Courges', '5.5%', ' Julie BLESSON-MAHAIS', 'MUBANCAR', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('236', 'Muesli Chocolat/Noix de coco', '5.5%', ' Julie BLESSON-MAHAIS', 'MUCANCOU', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('237', 'Muesli Citron/Gingembre', '5.5%', ' Julie BLESSON-MAHAIS', 'MUCHONOI', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('238', 'Muesli Figues/Gingembre', '5.5%', ' Julie BLESSON-MAHAIS', 'MUCIGING', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('239', 'Muesli Figues/Noix', '5.5%', ' Julie BLESSON-MAHAIS', 'MUFIGGING', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('240', 'Muesli Mangue/Fruits rouges', '5.5%', ' Julie BLESSON-MAHAIS', 'MUFIGNOI', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('241', 'Muesli Orange/Cacao', '5.5%', ' Julie BLESSON-MAHAIS', 'MUMANFR', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('242', 'Muesli Pommes/Canneberges', '5.5%', ' Julie BLESSON-MAHAIS', 'MUORCA', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('243', 'Muesli Pommes/Cannelle', '5.5%', ' Julie BLESSON-MAHAIS', 'MUPOMCANB', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('244', 'Muesli Raisin/Tournesol', '5.5%', ' Julie BLESSON-MAHAIS', 'MUPOMCAN', 'Centre Val de Loire, France', 'Loir et Cher', 'Biologique', 'Epicerie locale', 'Conditionnement : Sac 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('245', 'Miel de châtaignier', '5.5%', 'L\'Abeille de Sologne', 'MIELCHAT025', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 250 g', null, null, null);
INSERT INTO `produits` VALUES ('246', 'Miel de châtaignier', '5.5%', 'L\'Abeille de Sologne', 'MIELCHAT05', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 500 g', null, null, null);
INSERT INTO `produits` VALUES ('247', 'Miel de châtaignier', '5.5%', 'L\'Abeille de Sologne', 'MIELCHAT', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('248', 'Miel de ronces', '5.5%', 'L\'Abeille de Sologne', 'MIELRON05', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 250 g', null, null, null);
INSERT INTO `produits` VALUES ('249', 'Miel de ronces', '5.5%', 'L\'Abeille de Sologne', 'MIELRON025', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 500 g', null, null, null);
INSERT INTO `produits` VALUES ('250', 'Miel de ronces', '5.5%', 'L\'Abeille de Sologne', 'MIELRON', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('251', 'Miel de sarrazin', '5.5%', 'L\'Abeille de Sologne', 'MIELSAR025', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 250 g', null, null, null);
INSERT INTO `produits` VALUES ('252', 'Miel de sarrazin', '5.5%', 'L\'Abeille de Sologne', 'MIELSAR05', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 500 g', null, null, null);
INSERT INTO `produits` VALUES ('253', 'Miel de sarrazin', '5.5%', 'L\'Abeille de Sologne', 'MIELSARA', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('254', 'Miel de tilleul', '5.5%', 'L\'Abeille de Sologne', 'MIELTI025', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 250 g', null, null, null);
INSERT INTO `produits` VALUES ('255', 'Miel de tilleul', '5.5%', 'L\'Abeille de Sologne', 'MIELTI05', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 500 g', null, null, null);
INSERT INTO `produits` VALUES ('256', 'Miel de tilleul', '5.5%', 'L\'Abeille de Sologne', 'MIELTI', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('257', 'Miel fleurs d\'été', '5.5%', 'L\'Abeille de Sologne', 'MIELFLETE025', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 250 g', null, null, null);
INSERT INTO `produits` VALUES ('258', 'Miel fleurs d\'été', '5.5%', 'L\'Abeille de Sologne', 'MIELFLETE05', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 500 g', null, null, null);
INSERT INTO `produits` VALUES ('259', 'Miel fleurs d\'été', '5.5%', 'L\'Abeille de Sologne', 'MIELFLEETE', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('260', 'Miel fleurs de printemps', '5.5%', 'L\'Abeille de Sologne', 'MIELFL025', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 250 g', null, null, null);
INSERT INTO `produits` VALUES ('261', 'Miel fleurs de printemps', '5.5%', 'L\'Abeille de Sologne', 'MIELFL05', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 500 g', null, null, null);
INSERT INTO `produits` VALUES ('262', 'Miel fleurs de printemps', '5.5%', 'L\'Abeille de Sologne', 'MIELFP', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('263', 'Miel forêt de Sologne', '5.5%', 'L\'Abeille de Sologne', 'MIELFOR025', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 250 g', null, null, null);
INSERT INTO `produits` VALUES ('264', 'Miel forêt de Sologne', '5.5%', 'L\'Abeille de Sologne', 'MIELFOR05', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 500 g', null, null, null);
INSERT INTO `produits` VALUES ('265', 'Miel forêt de Sologne', '5.5%', 'L\'Abeille de Sologne', 'MIELFOR', 'Loir et Cher, Cher', 'Loir et Cher, Cher', 'Biologique', null, 'Conditionnement : Pot 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('266', 'Oeufs -53g', '5.5%', 'GAEC Ste Marie', 'MUP9QP2D', 'Loiret', 'Loiret', 'Biologique', null, 'Conditionnement : Barquette 50 g (x30)', null, null, null);
INSERT INTO `produits` VALUES ('267', 'Oeufs 53-63g', '5.5%', 'GAEC Ste Marie', 'PUCEG869', 'Loiret', 'Loiret', 'Biologique', null, 'Conditionnement : Barquette (x30)', null, null, null);
INSERT INTO `produits` VALUES ('268', 'Oeufs 53-63g', '5.5%', 'GAEC Ste Marie', 'OEUFS', 'Loiret', 'Loiret', 'Biologique', null, 'Conditionnement : Barquette 50 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('269', 'Oeufs 63-73g', '5.5%', 'GAEC Ste Marie', 'XTNF8XB6', 'Loiret', 'Loiret', 'Biologique', null, 'Conditionnement : Barquette 60 g (x30)', null, null, null);
INSERT INTO `produits` VALUES ('270', 'Oeufs 73+', '5.5%', 'GAEC Ste Marie', 'RDH9XNQX', 'Loiret', 'Loiret', 'Biologique', null, 'Conditionnement : Barquette 70 g (x20)', null, null, null);
INSERT INTO `produits` VALUES ('271', 'Bavette aloyau 130/150gr', '5.5%', ' Porcs Bio du Centre', 'VJJLK6X5', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande à griller', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('272', 'Boulette 30gr', '5.5%', ' Porcs Bio du Centre', 'RGF8W5BG', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande à mijoter', 'Conditionnement : Poche 1 kg', '1 mois', null, null);
INSERT INTO `produits` VALUES ('273', 'Braiser', '5.5%', ' Porcs Bio du Centre', 'YYJY89QJ', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande à mijoter', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('274', 'Brochette 120gr', '5.5%', ' Porcs Bio du Centre', 'W1CBICG7', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande à griller', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('275', 'Egrené surgelé', '5.5%', ' Porcs Bio du Centre', 'GMPU6GKK', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande à mijoter', 'Conditionnement : Carton 6 kg', '1 mois', null, null);
INSERT INTO `produits` VALUES ('276', 'Emincé', '5.5%', ' Porcs Bio du Centre', '8FJX6T9G', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande à griller', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('277', 'Entrecote 150gr', '5.5%', ' Porcs Bio du Centre', 'RYC6T2RY', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande à griller', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('278', 'Faux filet 150gr', '5.5%', ' Porcs Bio du Centre', 'KLD9GTBQ', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande à griller', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('279', 'Paleron', '5.5%', 'GAEC Ste Marie', 'PALER', 'Loiret', 'Allier', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('280', 'Pavé 150gr', '5.5%', ' Porcs Bio du Centre', 'LIE8ZZS7', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande à griller', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('281', 'Pot au feu sans os', '5.5%', ' Porcs Bio du Centre', 'QGMJD55X', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande à mijoter', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('282', 'Rognon', '5.5%', 'GAEC Ste Marie', 'RB38M3M4', 'Loiret', 'Allier', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('283', 'Roti 1.5kg', '5.5%', ' Porcs Bio du Centre', '12GCUEI5', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande à mijoter', 'Conditionnement : Poche 1.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('284', 'Rôti bœuf race Angus 1kg', '5.5%', 'Terres d\'Excellences', 'ROTANG', 'Eure et Loir', 'Allier', 'Biologique', 'Produit carné', 'Conditionnement : Poche 750 g', null, null, null);
INSERT INTO `produits` VALUES ('285', 'Sauté (bourguignon) 50/80 à la demande', '5.5%', ' Porcs Bio du Centre', '3FPUXPJ2', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('286', 'Sauté bœuf race Angus 80gr', '5.5%', 'Terres d\'Excellences', 'SAUTANG', 'Eure et Loir', 'Allier', 'Biologique', 'Produit carné', 'Conditionnement : Poche 800 g', null, null, null);
INSERT INTO `produits` VALUES ('287', 'Steak 130/150gr', '5.5%', ' Porcs Bio du Centre', 'TMLIGE4M', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande à griller', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('288', 'Steak bœuf race Angus 125gr', '5.5%', 'Terres d\'Excellences', 'STEANG', 'Eure et Loir', 'Allier', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('289', 'Steak haché frais 125gr', '5.5%', 'GAEC Ste Marie', 'STEKHEFR', 'Loiret', 'Allier', 'Biologique', 'Viande à griller', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('290', 'Tende de tranche PAD 130/150gr', '5.5%', ' Porcs Bio du Centre', 'CE5MA732', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande à mijoter', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('291', 'Tripes', '5.5%', 'GAEC Ste Marie', '28UMEXLJ', 'Loiret', 'Allier', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('292', 'Côte sans os 130/150gr', '5.5%', ' Porcs Bio du Centre', 'COTSSOS', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Veau', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('293', 'Côte sans os surgelé 130/150gr', '5.5%', ' Porcs Bio du Centre', 'COTSSOSUR', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Veau', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('294', 'Emincé', '5.5%', ' Porcs Bio du Centre', 'EMINC', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Veau', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('295', 'Escalope 130/150gr', '5.5%', ' Porcs Bio du Centre', 'ESCAL', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Veau', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('296', 'Filet longe sans os 1kg', '5.5%', ' Porcs Bio du Centre', 'FILLONGSSOS', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Veau', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('297', 'Osso bucco', '5.5%', ' Porcs Bio du Centre', 'OSSBUC', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Veau', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('298', 'Rognon', '5.5%', 'GAEC Ste Marie', 'ROGNO', 'Loiret', 'Allier', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('299', 'Rôti épaule bas carré 1kg', '5.5%', ' Porcs Bio du Centre', 'ROTEPBC', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Veau', 'Conditionnement : Poche 1.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('300', 'Rôti noix/sous noix 1kg', '5.5%', ' Porcs Bio du Centre', 'ROTNSN', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Veau', 'Conditionnement : Poche 1.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('301', 'Sauté (blanquette) 50/80gr à la demande', '5.5%', ' Porcs Bio du Centre', 'SAUBLA', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Veau', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('302', 'Tendron', '5.5%', 'GAEC Ste Marie', 'TENDR', 'Loiret', 'Allier', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('303', 'Tripes', '5.5%', 'GAEC Ste Marie', 'TRIPES', 'Loiret', 'Allier', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('304', 'Brochette 120gr', '5.5%', ' Porcs Bio du Centre', '5K6HJYHH', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('305', 'Carré détalonné', '5.5%', ' Porcs Bio du Centre', 'E8XPQSFM', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Viande fraîche', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('306', 'Côtes avec os 160/180gr', '5.5%', ' Porcs Bio du Centre', 'FIYIWYP8', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('307', 'Côtes sans os 130/150gr', '5.5%', ' Porcs Bio du Centre', 'QZC8U1RI', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('308', 'Echine avec os 160/180gr', '5.5%', ' Porcs Bio du Centre', 'TT9MCX43', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Viande fraîche', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('309', 'Echine sans os 130/150gr', '5.5%', ' Porcs Bio du Centre', 'N55XRWCY', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('310', 'Emincé', '5.5%', ' Porcs Bio du Centre', 'EGSP47UN', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('311', 'Escalope 130/150gr', '5.5%', ' Porcs Bio du Centre', 'I58FX1UW', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('312', 'Filet mignon 400gr', '5.5%', ' GAEC Ste Marie', 'FILMIG', 'Loiret', 'Loir et Cher', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('313', 'Jambon 1/2 sel', '5.5%', ' Porcs Bio du Centre', 'YZVL3F9W', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Salaison', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('314', 'Rognon', '5.5%', ' Porcs Bio du Centre', '713EQLVS', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('315', 'Roti longe 1kg', '5.5%', ' Porcs Bio du Centre', '4F7RMMJW', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('316', 'Sauté de porc 50/80gr à la demande', '5.5%', ' Porcs Bio du Centre', 'BG7FAJB8', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Viande fraîche', 'Conditionnement : Sous vide 12 kg', null, null, null);
INSERT INTO `produits` VALUES ('317', 'Travers', '5.5%', ' Porcs Bio du Centre', 'H13R9DR6', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Produit carné', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('318', 'Chipolatas de porc 10 pièces x60gr', '5.5%', ' Porcs Bio du Centre', 'M9C6UCG4', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 600 g', null, null, null);
INSERT INTO `produits` VALUES ('319', 'Chipolatas de porc surgelée 10 pièces x60gr', '5.5%', ' Porcs Bio du Centre', 'JIZ7BT72', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 600 g', null, null, null);
INSERT INTO `produits` VALUES ('320', 'Merguez bœuf race Angus 5 pièces x60gr', '5.5%', 'Terres d\'Excellences', 'MERGANG', 'Eure et Loir', 'Eure et Loir', 'Biologique', 'Produit carné', 'Conditionnement : POCHE 300 g', null, null, null);
INSERT INTO `produits` VALUES ('321', 'Merguez d\'agneau 10 pièces x60gr', '5.5%', ' Porcs Bio du Centre', 'T6MPU5IM', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 600 g', null, null, null);
INSERT INTO `produits` VALUES ('322', 'Saucisse aux herbes 10 pièces x60gr', '5.5%', ' Porcs Bio du Centre', 'JFRGW9FS', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 600 g', null, null, null);
INSERT INTO `produits` VALUES ('323', 'Saucisse aux herbes surgelée 10 pièces x60gr', '5.5%', ' Porcs Bio du Centre', 'Y31MLYX4', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 600 g', null, null, null);
INSERT INTO `produits` VALUES ('324', 'Saucisse bœuf façon Toulouse race Angus 2 pièces x180gr', '5.5%', 'Terres d\'Excellences', '4Q8DUVY3', 'Eure et Loir', 'Eure et Loir', 'Biologique', 'Produit carné', 'Conditionnement : POCHE 360 g', null, null, null);
INSERT INTO `produits` VALUES ('325', 'Saucisse d\'agneau 10 pièces x60gr', '5.5%', ' Porcs Bio du Centre', 'CT4Q8SMS', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 600 g', null, null, null);
INSERT INTO `produits` VALUES ('326', 'Saucisse d\'agneau surgelée 10 pièces x60gr', '5.5%', ' Porcs Bio du Centre', 'F4TGR2RR', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 600 g', null, null, null);
INSERT INTO `produits` VALUES ('327', 'Saucisse de bœuf 10 pièces x60gr', '5.5%', ' Porcs Bio du Centre', 'UYCGWNVV', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Viande à griller', 'Conditionnement : POCHE 600 g', null, null, null);
INSERT INTO `produits` VALUES ('328', 'Saucisse de veau 10 pièces x60gr', '5.5%', ' Porcs Bio du Centre', 'XS33993X', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Veau', 'Conditionnement : POCHE 600 g', null, null, null);
INSERT INTO `produits` VALUES ('329', 'Saucisse de veau surgelée 10 pièces x60gr', '5.5%', ' Porcs Bio du Centre', 'JRAYGVQE', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Veau', 'Conditionnement : POCHE 600 g', null, null, null);
INSERT INTO `produits` VALUES ('330', 'Saucisse nature bœuf race Angus pièce 180gr', '5.5%', 'Terres d\'Excellences', 'SAUCNATANG', 'Eure et Loir', 'Eure et Loir', 'Biologique', 'Produit carné', 'Conditionnement : POCHE 180 g', null, null, null);
INSERT INTO `produits` VALUES ('331', 'Saucisson à l\'ail pièce 1kg', '5.5%', 'GAEC Ste Marie', 'SAUCAIL', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', null, 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('332', 'Toulouse de porc surgelée 10 pièces x80gr', '5.5%', ' Porcs Bio du Centre', 'FW2TVYI1', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 800 g', null, null, null);
INSERT INTO `produits` VALUES ('333', 'Toulouse de porc surgelée 10 pièces x80gr', '5.5%', ' Porcs Bio du Centre', 'CBN69HPK', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 800 g', null, null, null);
INSERT INTO `produits` VALUES ('334', 'Boudin blanc 10 pièces x100gr', '5.5%', ' Porcs Bio du Centre', 'GLCVKPKV', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('335', 'Boudin noir 10 pièces x100 g', '5.5%', ' Porcs Bio du Centre', 'XTR5NZQU', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('336', 'Chair à saucisse de porc', '5.5%', ' Porcs Bio du Centre', 'GL88V7J4', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 500 g', null, null, null);
INSERT INTO `produits` VALUES ('337', 'Chorizo 250 à 300 g', '5.5%', ' Porcs Bio du Centre', 'RPRBHWPY', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 275 g', null, null, null);
INSERT INTO `produits` VALUES ('338', 'Jambon à l\'os tranches 20 tranches x50gr', '5.5%', ' Porcs Bio du Centre', 'HIV71G3Y', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('339', 'Jambon cru Vendée entier', '5.5%', ' Porcs Bio du Centre', '8TPC5CC2', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : Pièce 6 kg', null, null, null);
INSERT INTO `produits` VALUES ('340', 'Jambon cru Vendée tranches 25 tranches x30gr', '5.5%', ' Porcs Bio du Centre', '1LVAHXL4', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 750 g', null, null, null);
INSERT INTO `produits` VALUES ('341', 'Jambon DD tranches 20 tranches x50gr', '5.5%', ' Porcs Bio du Centre', 'WWG2QCMT', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('342', 'Lardon fumé 750gr', '5.5%', ' Porcs Bio du Centre', 'PBENFULS', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : Barquette 750 g', null, null, null);
INSERT INTO `produits` VALUES ('343', 'Lardon nature 750gr', '5.5%', 'Porcs Bio du Centre, GAEC Ste Marie', 'IHJF52HK', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher, Loiret', 'Biologique', 'Charcuterie', 'Conditionnement : Barquette 750 g', null, null, null);
INSERT INTO `produits` VALUES ('344', 'Paté de campagne', '5.5%', 'Porcs Bio du Centre, GAEC Ste Marie', '11EXZCEZ', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher, Loiret', 'Biologique', 'Charcuterie', 'Conditionnement : Pièce 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('345', 'Paté de tête', '5.5%', ' Porcs Bio du Centre', 'I6J37SXY', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : Pièce 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('346', 'Paté en croûte', '5.5%', ' Porcs Bio du Centre', 'X7WSY6JS', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : Pièce 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('347', 'Poitrine fumé 1/2 ou entière', '5.5%', ' Porcs Bio du Centre', 'ERJU6Y2X', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : Pièce 2.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('348', 'Rillette de poulet', '5.5%', 'La Gauloise Dorée', 'RILPOU', 'Indre et Loire', 'Indre et Loire', 'Biologique', null, 'Conditionnement : Pièce 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('349', 'Rillons', '5.5%', 'GAEC Ste Marie', 'RILLON', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', null, 'Conditionnement : Barquette 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('350', 'Saucisse de Francfort 20 pièces x60gr', '5.5%', ' Porcs Bio du Centre', 'W9QDRAFG', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 1.2 kg', null, null, null);
INSERT INTO `produits` VALUES ('351', 'Saucisse fumée 10 pièces x100gr', '5.5%', ' Porcs Bio du Centre', 'YJ47U5DF', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('352', 'Saucisson à cuire', '5.5%', ' Porcs Bio du Centre', '1VUTGYCY', 'Centre Val de Loire, Dpts Limitrophes', 'Loir et Cher', 'Biologique', 'Charcuterie', 'Conditionnement : Pièce 500 g', null, null, null);
INSERT INTO `produits` VALUES ('353', 'Cuisse de poulet 200/250gr', '5.5%', 'La Gauloise Dorée', 'CUIPOU', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Produit carné', 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('354', 'Filet de poulet', '5.5%', 'La Gauloise Dorée', 'FILPOU', 'Indre et Loire', 'Indre et Loire', 'Biologique', 'Produit carné', 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('355', 'Poulet entier 2/2.5kg', '5.5%', 'GAEC Ste Marie, La Gauloise Dorée', 'POULENT', 'Loiret, Indre et Loire', 'Loiret, Indre et Loire', 'Biologique', 'Produit carné', 'Conditionnement : Pièce 2.3 kg', null, null, null);
INSERT INTO `produits` VALUES ('356', 'Brochette agneau 120gr', '5.5%', ' Porcs Bio du Centre', 'BROAGN', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande fraîche', 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('357', 'Carré huit côtes', '5.5%', ' Porcs Bio du Centre', 'CARHUICO', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande fraîche', 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('358', 'Côtes 80gr', '5.5%', ' Porcs Bio du Centre', 'COTES', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande fraîche', 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('359', 'Epaule 1,5kg', '5.5%', ' Porcs Bio du Centre', 'EPAULE', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Produit carné', 'Conditionnement : POCHE 1.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('360', 'Epaule sans os 1kg', '5.5%', ' Porcs Bio du Centre', 'EPASSOS', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande fraîche', 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('361', 'Foie 120/140gr', '5.5%', ' Porcs Bio du Centre', 'FOIE', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande fraîche', 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('362', 'Gigot', '5.5%', ' Porcs Bio du Centre', 'GIGOT', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Produit carné', 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('363', 'Gigot sans os', '5.5%', ' Porcs Bio du Centre', 'GIGSSOS', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande fraîche', 'Conditionnement : POCHE 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('364', 'Poitrine sans os', '5.5%', ' Porcs Bio du Centre', 'POITSSOS', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande fraîche', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('365', 'Sauté (navarin) 50/80gr à la demande', '5.5%', ' Porcs Bio du Centre', 'SAUNAV', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande fraîche', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('366', 'Sauté de mouton 50/80gr à la demande', '5.5%', ' Porcs Bio du Centre', 'SAUTMOUT', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande fraîche', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('367', 'Tranche gigot 140/160gr', '5.5%', ' Porcs Bio du Centre', 'TRANGIG', 'Centre Val de Loire, Dpts Limitrophes', 'Allier', 'Biologique', 'Viande fraîche', 'Conditionnement : Poche 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('368', 'Jus Poires', '5.5%', 'Histoire de fruits', 'JPOIR', 'Indre et Loire', 'Indre et Loire', 'Biologique', null, 'Conditionnement : Bouteille 1 L (x6)', null, null, null);
INSERT INTO `produits` VALUES ('369', 'Jus Pommes', '5.5%', 'Histoire de fruits', 'JPOM', 'Indre et Loire', 'Indre et Loire', 'Biologique', null, 'Conditionnement : Bouteille 1 L (x6)', null, null, null);
INSERT INTO `produits` VALUES ('370', 'Jus Pommes bib 3L', '5.5%', 'Histoire de fruits', 'JPOMBIB', 'Indre et Loire', 'Indre et Loire', 'Biologique', null, 'Conditionnement : Bib', null, null, null);
INSERT INTO `produits` VALUES ('371', 'Jus Pommes/Cassis', '5.5%', 'Histoire de fruits', 'VJKUMTCJ', 'Indre et Loire', 'Indre et Loire', 'Biologique', null, 'Conditionnement : Bouteille 1 L (x6)', null, null, null);
INSERT INTO `produits` VALUES ('372', 'Jus Pommes/Poires', '5.5%', 'Histoire de fruits', 'JPOMPOI', 'Indre et Loire', 'Indre et Loire', 'Biologique', null, 'Conditionnement : Bouteille 1 L (x6)', null, null, null);
INSERT INTO `produits` VALUES ('373', 'La Donzelle 33cl Ale romarin', '20%', ' SAS Brasserie Sancerroise', 'LADONZ33', 'Centre Val de Loire, France', 'Cher', 'Biologique', 'Boisson', 'Conditionnement : Colis (x12)', null, null, null);
INSERT INTO `produits` VALUES ('374', 'La Donzelle 75cl Ale romarin', '20%', ' SAS Brasserie Sancerroise', 'LADONZ75', 'Centre Val de Loire, France', 'Cher', 'Biologique', 'Boisson', 'Conditionnement : Colis (x6)', null, null, null);
INSERT INTO `produits` VALUES ('375', 'Lou Pelou 33cl Ambrée à la chataigne et gentiane', '20%', ' SAS Brasserie Sancerroise', 'LOUPEL33', 'Centre Val de Loire, France', 'Cher', 'Biologique', 'Boisson', 'Conditionnement : Colis (x12)', null, null, null);
INSERT INTO `produits` VALUES ('376', 'Lou Pelou 75cl Ambrée chataigne et gentiane', '20%', ' SAS Brasserie Sancerroise', 'LOUPEL75', 'Centre Val de Loire, France', 'Cher', 'Biologique', 'Boisson', 'Conditionnement : Colis (x6)', null, null, null);
INSERT INTO `produits` VALUES ('377', 'Quincy AOP sauvignon 75cl', '20%', 'SAS Domaine du Coudray', 'QUIAOP75', 'Cher', 'Cher', 'Biologique', 'Boisson', 'Conditionnement : Carton (x6)', null, null, null);
INSERT INTO `produits` VALUES ('378', 'Reuilly AOP pinot gris 75cl', '20%', 'SAS Domaine du Coudray', 'REUI75', 'Cher', 'Cher', 'Biologique', 'Boisson', 'Conditionnement : Carton (x6)', null, null, null);
INSERT INTO `produits` VALUES ('379', 'Ananas Bateau Costa Rica', '5.5%', 'Ternao', 'ANAN', 'Costa Rica', null, 'Biologique', null, 'Conditionnement : Colis 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('380', 'Banane Côte Ivoire 60/40', '5.5%', 'Ternao', 'BANA', 'Côte Ivoire', null, 'Biologique', null, 'Conditionnement : Carton 18.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('381', 'Mangue kent Pérou', '5.5%', 'Ternao', 'MANG', 'Perou', null, 'Biologique', null, 'Conditionnement : Colis 4 kg', null, null, null);
INSERT INTO `produits` VALUES ('382', 'Orange valencialate cal 7/8 Espagne', '5.5%', 'Ternao', 'ORNVAL', 'Espagne', null, 'Biologique', null, 'Conditionnement : Caisse 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('383', 'Pomelos star ruby Espagne', '5.5%', 'Ternao', 'POMEL', 'Espagne', null, 'Biologique', null, 'Conditionnement : Colis 8 kg', null, null, null);
INSERT INTO `produits` VALUES ('384', 'AMANDE DECORTIQUEE (25KG) ESPAGNE', '5.5%', ' Provinces Bio - Relais Vert', '39345', 'ESPAGNE', null, 'Biologique', null, 'Conditionnement : 25 kg', null, null, null);
INSERT INTO `produits` VALUES ('385', 'AMANDE DECORTIQUEE CAL,34/36 (10KG) ITALIE', '5.5%', ' Provinces Bio - Relais Vert', '36841', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('386', 'AMANDE DECORTIQUEE CAL,34/36 (25KG) ITALIE', '5.5%', ' Provinces Bio - Relais Vert', '40601', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 25 kg', null, null, null);
INSERT INTO `produits` VALUES ('387', 'AMANDE GRILLEE CAL 34/36 (10KG)', '5.5%', ' Provinces Bio - Relais Vert', '38022', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('388', 'AMANDES EMONDEES (10KG) ITALIE', '5.5%', ' Provinces Bio - Relais Vert', '40772', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('389', 'ANANAS SECHE RONDELLES (6KG) TANZANIE', '5.5%', ' Provinces Bio - Relais Vert', '37025', 'TANZANIE', null, 'Biologique', null, 'Conditionnement : 6 kg', null, null, null);
INSERT INTO `produits` VALUES ('390', 'ARACHIDE COQUE (5KG) EGYPTE', '5.5%', ' Provinces Bio - Relais Vert', '39518', 'EGYPTE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('391', 'BAIES DE GOJI SECHEES (20KG) CHINE', '5.5%', ' Provinces Bio - Relais Vert', '39256', 'CHINE', null, 'Biologique', null, 'Conditionnement : 20 kg', null, null, null);
INSERT INTO `produits` VALUES ('392', 'BAIES DE GOJI SECHEES (5KG) CHINE', '5.5%', ' Provinces Bio - Relais Vert', '36862', 'CHINE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('393', 'BANANE CHIPS (6,8KG) PHILIPPINES', '5.5%', ' Provinces Bio - Relais Vert', '36863', 'PHILIPPINES', null, 'Biologique', null, 'Conditionnement : 6.8 kg', null, null, null);
INSERT INTO `produits` VALUES ('394', 'BANANE SECHEE (5KG) COLOMBIE', '5.5%', ' Provinces Bio - Relais Vert', '36864', 'COLOMBIE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('395', 'CACAHUETE DECORTIQUEE GRILLEE EQUITABLE (10KG) OUGANDA', '5.5%', ' Provinces Bio - Relais Vert', '43477', 'OUGANDA', null, 'Biologique', null, 'Conditionnement : 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('396', 'CACAHUETE DECORTIQUEE GRILLEE SALEE (10KG) EGYPTE', '5.5%', ' Provinces Bio - Relais Vert', '39516', 'EGYPTE', null, 'Biologique', null, 'Conditionnement : 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('397', 'CACAHUETES CARAMELISEES \"CHOUCHOU\" BIO (2 X2,5KG)', '5.5%', ' Provinces Bio - Relais Vert', '40791', 'EGYPTE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('398', 'CERNEAUX DE NOIX (10KG) FRANCE', '5.5%', ' Provinces Bio - Relais Vert', '39673', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('399', 'CERNEAUX DE NOIX (5KG) UKRAINE', '5.5%', ' Provinces Bio - Relais Vert', '37418', 'UKRAINE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('400', 'CRANBERRIES 1/2 SECHEES / SUCRE DE CANNE (11,34KG)', '5.5%', ' Provinces Bio - Relais Vert', '36928', 'CANADA', null, 'Biologique', null, 'Conditionnement : 11.34 kg', null, null, null);
INSERT INTO `produits` VALUES ('401', 'CRANBERRIES ENROBEES CHOCOLAT NOIR (5KG)', '5.5%', ' Provinces Bio - Relais Vert', '40773', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('402', 'CUBES DE GINGEMBRE CONFIT CHOCOLAT NOIR (5KG)', '5.5%', ' Provinces Bio - Relais Vert', '40774', 'CHINE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('403', 'DATTE DEGLET NOUR BRANCHEE (5KG) TUNISIE', '5.5%', ' Provinces Bio - Relais Vert', '37006', 'TUNISIE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('404', 'DATTE DEGLET NOUR DÉNOYAUTÉE EQUITABLE (5KG) TUNISIE', '5.5%', ' Provinces Bio - Relais Vert', '43834', 'TUNISIE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('405', 'DATTE DEGLET NOUR STANDARD (5KG) TUNISIE', '5.5%', ' Provinces Bio - Relais Vert', '40790', 'TUNISIE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('406', 'DATTE FRAICHE MAZZAFATI (250G) IRAN', '5.5%', ' Provinces Bio - Relais Vert', '40749', 'IRAN', null, 'Biologique', null, 'Conditionnement :  (x12)', null, null, null);
INSERT INTO `produits` VALUES ('407', 'DATTE MEDJOOL FRAICHES (250G) ISRAEL', '5.5%', ' Provinces Bio - Relais Vert', '39148', 'ISRAEL', null, 'Biologique', null, 'Conditionnement :  (x12)', null, null, null);
INSERT INTO `produits` VALUES ('408', 'DATTE MEDJOOL FRAICHES (3KG) CISJORDANIE', '5.5%', ' Provinces Bio - Relais Vert', '36865', 'ISRAEL', null, 'Biologique', null, 'Conditionnement : 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('409', 'DATTE MEDJOOL SECHE CALIFORNIE (5KG)', '5.5%', ' Provinces Bio - Relais Vert', '20295', 'ÉTATS UNIS', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('410', 'DATTES MEDJOOL SECHES (5KG)', '5.5%', ' Provinces Bio - Relais Vert', '42054', 'ISRAEL', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('411', 'FIGUE BAGLAMA FICELLE N°3 (5KG) TURQUIE', '5.5%', ' Provinces Bio - Relais Vert', '40689', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('412', 'FIGUE LERIDA N°3 (5 KG) TURQUIE', '5.5%', ' Provinces Bio - Relais Vert', '40691', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('413', 'FIGUE PROTOBEN N°3 (5 KG) TURQUIE', '5.5%', ' Provinces Bio - Relais Vert', '40692', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('414', 'FIGUETTE (5KG) ESPAGNE', '5.5%', ' Provinces Bio - Relais Vert', '36866', 'ESPAGNE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('415', 'GINGEMBRE CONFIT CUBE (5KG) CHINE', '5.5%', ' Provinces Bio - Relais Vert', '36867', 'CHINE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('416', 'GINGEMBRE CONFIT CUBE (5KG) MADAGASCAR', '5.5%', ' Provinces Bio - Relais Vert', '42444', 'MADAGASCAR', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('417', 'GINGEMBRE CONFIT LAMELLE (5KG) CHINE', '5.5%', ' Provinces Bio - Relais Vert', '40787', 'CHINE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('418', 'GRAINES DE CHIA (10KG)', '5.5%', ' Provinces Bio - Relais Vert', '43410', 'PARAGUAY', null, 'Biologique', null, null, null, null, null);
INSERT INTO `produits` VALUES ('419', 'MANGUE SECHEE EQUITABLE (2,5KG) BURKINA FASO', '5.5%', ' Provinces Bio - Relais Vert', '44083', 'BURKINA FASO', null, 'Biologique', null, 'Conditionnement : 2.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('420', 'MELANGE EXOTIQUE (3KG)', '5.5%', ' Provinces Bio - Relais Vert', '38420', 'NON UE', null, 'Biologique', null, 'Conditionnement : 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('421', 'MELANGE FRUITS SECS APERITIF (3KG)', '5.5%', ' Provinces Bio - Relais Vert', '37395', 'NON UE', null, 'Biologique', null, 'Conditionnement : 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('422', 'MELANGE FRUITS SECS ETUDIANT NATURE (5KG)', '5.5%', ' Provinces Bio - Relais Vert', '36933', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('423', 'MELANGE FRUITS SECS GRILLE SALE (5KG)', '5.5%', ' Provinces Bio - Relais Vert', '41839', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('424', 'MELANGE FRUITS SECS TORREFIE (5KG)', '5.5%', ' Provinces Bio - Relais Vert', '41721', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('425', 'MELANGE SALADE GRAINES (5KG)', '5.5%', ' Provinces Bio - Relais Vert', '39968', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('426', 'MELANGE SALADE ITALIEN BIO (3KG) JLRG', '5.5%', ' Provinces Bio - Relais Vert', '39971', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('427', 'MELANGE SUPERFRUITS (3KG)', '5.5%', ' Provinces Bio - Relais Vert', '36935', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('428', 'MELANGE SUPERFRUITS POUR MUESLI BIO (3KG) JLRG', '5.5%', ' Provinces Bio - Relais Vert', '39972', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('429', 'MELANGE TIBETAIN (3KG)', '5.5%', ' Provinces Bio - Relais Vert', '38421', 'NON UE', null, 'Biologique', null, 'Conditionnement : 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('430', 'MURES BLANCHES SECHEES (5KG) TURQUIE', '5.5%', ' Provinces Bio - Relais Vert', '44122', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('431', 'NOISETTE DECORTIQUEE (5KG) CAL,13/15', '5.5%', ' Provinces Bio - Relais Vert', '36846', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('432', 'NOISETTE DECORTIQUEE CAL,13/15 (25KG) TURQUIE', '5.5%', ' Provinces Bio - Relais Vert', '39257', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 25 kg', null, null, null);
INSERT INTO `produits` VALUES ('433', 'NOISETTE GRILLEE CAL 13/15 (10KG)', '5.5%', ' Provinces Bio - Relais Vert', '38026', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('434', 'NOISETTE GRILLEE SALEE CAL 13/15 (10KG)', '5.5%', ' Provinces Bio - Relais Vert', '38027', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('435', 'NOIX DE CAJOU (22,68KG) VIETNAM', '5.5%', ' Provinces Bio - Relais Vert', '38733', 'VIETNAM', null, 'Biologique', null, 'Conditionnement : 22.68 kg', null, null, null);
INSERT INTO `produits` VALUES ('436', 'NOIX DE CAJOU (5KG) VIETNAM', '5.5%', ' Provinces Bio - Relais Vert', '36819', 'VIETNAM', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('437', 'NOIX DE CAJOU GRILLEES AU CHILI (5KG) VIETNAM', '5.5%', ' Provinces Bio - Relais Vert', '40581', 'VIETNAM', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('438', 'NOIX DE CAJOU GRILLEES AU CURRY (5KG) VIETNAM', '5.5%', ' Provinces Bio - Relais Vert', '37593', 'VIETNAM', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('439', 'NOIX DE CAJOU GRILLEES AU TAMARI (5KG) VIETNAM', '5.5%', ' Provinces Bio - Relais Vert', '40580', 'VIETNAM', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('440', 'NOIX DE CAJOU TORREFIE SS SEL (5KG)', '5.5%', ' Provinces Bio - Relais Vert', '39436', 'VIETNAM', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('441', 'NOIX DE COCO EN LAMELLES (2KG) PHILIPPINES', '5.5%', ' Provinces Bio - Relais Vert', '36851', 'PHILIPPINES', null, 'Biologique', null, 'Conditionnement : 2 kg', null, null, null);
INSERT INTO `produits` VALUES ('442', 'NOIX DE COCO RAPEE MEDIUM (2KG) PHILIPPINES', '5.5%', ' Provinces Bio - Relais Vert', '36850', 'PHILIPPINES', null, 'Biologique', null, 'Conditionnement : 2 kg', null, null, null);
INSERT INTO `produits` VALUES ('443', 'NOIX DE MACADAMIA (5KG) KENYA', '5.5%', ' Provinces Bio - Relais Vert', '34829', 'KENYA', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('444', 'NOIX DE PECAN DECORTIQUEE LARGE (5KG) MEXIQUE', '5.5%', ' Provinces Bio - Relais Vert', '39992', 'MEXIQUE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('445', 'NOIX DU BRESIL (20KG) BOLIVIE', '5.5%', ' Provinces Bio - Relais Vert', '40688', 'BOLIVIE', null, 'Biologique', null, 'Conditionnement : 20 kg', null, null, null);
INSERT INTO `produits` VALUES ('446', 'NOIX DU BRESIL (5KG) BOLIVIE', '5.5%', ' Provinces Bio - Relais Vert', '36938', 'BOLIVIE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('447', 'PALETS CHOCOLAT NOIR 70% EQUITABLE (5KG)', '5.5%', ' Provinces Bio - Relais Vert', '43408', 'PÉROU', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('448', 'PEPITES DE CHOCOLAT NOIR 62% EQUITABLE (5KG)', '5.5%', ' Provinces Bio - Relais Vert', '43406', 'PÉROU', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('449', 'PEPITES NOIX DU BRESIL (20KG) BOLIVIE', '5.5%', ' Provinces Bio - Relais Vert', '42960', 'BOLIVIE', null, 'Biologique', null, 'Conditionnement : 20 kg', null, null, null);
INSERT INTO `produits` VALUES ('450', 'PIGNON DE PIN (3KG) CHINE', '5.5%', ' Provinces Bio - Relais Vert', '37092', 'CHINE', null, 'Biologique', null, 'Conditionnement : 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('451', 'PISTACHE COQUE GRILLEE SALEE (5 KG) ESPAGNE', '5.5%', ' Provinces Bio - Relais Vert', '40707', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('452', 'PISTACHE DECORTIQUEE (10 KG) ESPAGNE', '5.5%', ' Provinces Bio - Relais Vert', '42310', 'ESPAGNE', null, 'Biologique', null, 'Conditionnement : 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('453', 'POMMES SECHEES RONDELLES (1,5KG)', '5.5%', ' Provinces Bio - Relais Vert', '40882', 'UNION EUROPÉENNE', null, 'Biologique', null, 'Conditionnement : 1.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('454', 'POUDRE D\'AMANDE COMPLETE (10KG) ITALIE', '5.5%', ' Provinces Bio - Relais Vert', '36845', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('455', 'POUDRE DE NOISETTE BIO (10KG) TURQUIE', '5.5%', ' Provinces Bio - Relais Vert', '35417', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('456', 'PRUNEAU ENTIER GROS CAL 30/50 BIO (10KG) FRANCE', '5.5%', ' Provinces Bio - Relais Vert', '40475', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('457', 'RAISIN SULTANINE N°9 (12,5KG) TURQUIE', '5.5%', ' Provinces Bio - Relais Vert', '36868', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 12.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('458', 'RAISIN THOMPSON (12,5KG) TURQUIE', '5.5%', ' Provinces Bio - Relais Vert', '43387', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 12.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('459', 'TUONO AMANDE DECORTIQUEE CAL,34/36 (10KG) ITALIE', '5.5%', ' Provinces Bio - Relais Vert', '32494', 'ITALIE', null, null, null, 'Conditionnement : 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('460', 'MELANGE NOIX (5KG)', '5.5%', ' Provinces Bio - Relais Vert', '43629', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('461', 'AMANDES AU CHOCOLAT AU LAIT (5KG) DAMIANO', '5.5%', ' Provinces Bio - Relais Vert', '38734', 'ITALIE', null, 'Biologique', null, null, null, null, null);
INSERT INTO `produits` VALUES ('462', 'AMANDES AU CHOCOLAT NOIR (5KG) DAMIANO', '5.5%', ' Provinces Bio - Relais Vert', '38735', 'ITALIE', null, 'Biologique', null, null, null, null, null);
INSERT INTO `produits` VALUES ('463', 'BAIES DE GOJI (1KG) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '38966', 'CHINE', null, 'Biologique', null, 'Conditionnement :  (x4)', null, null, null);
INSERT INTO `produits` VALUES ('464', 'SUCRE DE COCO BIO (5KG) SRI LANKA', '5.5%', ' Provinces Bio - Relais Vert', '37086', 'SRI LANKA', null, 'Biologique', null, null, null, null, null);
INSERT INTO `produits` VALUES ('465', 'TOMATES SECHEES MOELLEUSES (2KG) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '39308', 'ITALIE', null, 'Biologique', null, null, null, null, null);
INSERT INTO `produits` VALUES ('466', 'SACS A LEGUMES TAILLE L 30CM X28CM (5 PIÈCES) BIOCOTON', '20%', ' Provinces Bio - Relais Vert', '37949', 'INDE', null, null, null, 'Conditionnement :  (x10)', null, null, null);
INSERT INTO `produits` VALUES ('467', 'SACS COTON VRAC LEGUMINEUSES ET CEREALES TAILLE S 20CMX27CM (5 PIÈCES) BIOCOTON', '20%', ' Provinces Bio - Relais Vert', '40381', 'BANGLADESH', null, null, null, 'Conditionnement :  (x10)', null, null, null);
INSERT INTO `produits` VALUES ('468', 'SACS COTON VRAC TAILLE XL 40 CM X40CM (3 PIÈCES) BIOCOTON', '20%', ' Provinces Bio - Relais Vert', '40380', 'BANGLADESH', null, null, null, 'Conditionnement :  (x15)', null, null, null);
INSERT INTO `produits` VALUES ('469', 'SACS PAPIER KRAFT BRUN 1KG X1000', '20%', ' Provinces Bio - Relais Vert', '32172', 'UNION EUROPÉENNE', null, null, null, null, null, null, null);
INSERT INTO `produits` VALUES ('470', 'SACS PAPIER KRAFT BRUN 2KG X1000', '20%', ' Provinces Bio - Relais Vert', '32173', 'UNION EUROPÉENNE', null, null, null, null, null, null, null);
INSERT INTO `produits` VALUES ('471', 'SACS PAPIER KRAFT BRUN 3 KG X1000', '20%', ' Provinces Bio - Relais Vert', '33113', 'UNION EUROPÉENNE', null, null, null, null, null, null, null);
INSERT INTO `produits` VALUES ('472', 'YAOURT BREBIS NATURE (4X105G) TRADI-BERGERE', '5.5%', ' Provinces Bio - Relais Vert', '15092', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4 x 105g 420 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('473', 'CREME DESSERT AU CHOCOLAT EQUITABLE (4X100G) TANTE HELENE', '5.5%', ' Provinces Bio - Relais Vert', '16306', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 4x100g 460 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('474', 'CREME DESSERT VACHE CAFE  (4X105G) LAITERIE DU PERIGORD', '5.5%', ' Provinces Bio - Relais Vert', '16548', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 4x105g 420 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('475', 'CREME DESSERT VANILLE (4X100G) TANTE HELENE', '5.5%', ' Provinces Bio - Relais Vert', '16307', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 4 x 100g 460 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('476', 'PTITS MALINS - FROMAGE FRAIS AUX FRUITS 20% M.G (6X60G) GRANDEUR NATURE', '5.5%', ' Provinces Bio - Relais Vert', '14018', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 6x60g 360 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('477', 'FROMAGE BLANC NATURE 3,6% (4X100G) TANTE HELENE', '5.5%', ' Provinces Bio - Relais Vert', '15040', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4 x 100g 400 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('478', 'CREME FRAICHE EPAISSE 30% (5L) YOGOURMAND', '5.5%', ' Provinces Bio - Relais Vert', '16931', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 5L 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('479', 'CREME FRAICHE FLEURETTE 33%MG (1L) GRANDEUR NATURE', '5.5%', ' Provinces Bio - Relais Vert', '17108', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 1L 1 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('480', 'CREME FRAICHE LIQUIDE 30%MG (5L) GRANDEUR NATURE', '5.5%', ' Provinces Bio - Relais Vert', '14149', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 5l 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('481', 'CREME FRAICHE LIQUIDE UHT 35% MG (1L) YOGOURMAND', '5.5%', ' Provinces Bio - Relais Vert', '17088', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 1 L 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('482', 'BEURRE BARATTE DEMI SEL (10KG) GRANDEUR NATURE', '5.5%', ' Provinces Bio - Relais Vert', '16216', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 10kg 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('483', 'BEURRE DE BARATTE DEMI-SEL (250G) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '17178', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 250g 250 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('484', 'BEURRE DE BARATTE DOUX (10KG) GRANDEUR NATURE', '5.5%', ' Provinces Bio - Relais Vert', '16215', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 10kg 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('485', 'BEURRE DE BARATTE DOUX (250G) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '17177', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 250g 250 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('486', 'BEURRE DE BARATTE DOUX (500G) GRANDEUR NATURE', '5.5%', ' Provinces Bio - Relais Vert', '16463', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 500g 500 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('487', 'LAIT DE VACHE UHT CHOCOLATE BRIQUETTE (6X20CL) GRANDEUR NATURE', '5.5%', ' Provinces Bio - Relais Vert', '10491', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 6x20cl 1.2 kg (x4)', null, null, null);
INSERT INTO `produits` VALUES ('488', 'LAIT DE VACHE UHT ENTIER BOUTEILLE (1L) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '16268', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 1l 1 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('489', 'BRIE (ENV 1KG) MONTSURS', '5.5%', ' Provinces Bio - Relais Vert', '16283', 'FRANCE', null, 'Biologique', null, 'Conditionnement : ENV 1KG 1 kg (x2)', null, null, null);
INSERT INTO `produits` VALUES ('490', 'BUCHE DE CHEVRE (150G) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '16920', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 150g 150 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('491', 'CAMEMBERT (250G) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '16762', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 250g 253 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('492', 'COMTE PORTION 34% MG LAIT CRU VACHE (200G) RBIO', '5.5%', ' Provinces Bio - Relais Vert', '15034', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 200g 200 g (x8)', null, null, null);
INSERT INTO `produits` VALUES ('493', 'EDAM DE BAVIERE ALLEGE 30% VRAC (ENV 1,5KG) OMA', '5.5%', ' Provinces Bio - Relais Vert', '13056', 'ALLEMAGNE', null, 'Biologique', null, 'Conditionnement : 1,5kg 1.5 kg (x8)', null, null, null);
INSERT INTO `produits` VALUES ('494', 'EMMENTAL ALPESTRE  RAPE BIOLAND LAIT CRU VACHE (1KG) OMA', '5.5%', ' Provinces Bio - Relais Vert', '13108', 'ALLEMAGNE', null, 'Biologique', null, 'Conditionnement : 1kg 1 kg (x10)', null, null, null);
INSERT INTO `produits` VALUES ('495', 'EMMENTAL BLOC LAIT CRU VACHE VRAC (ENV 2.5KG) RBIO', '5.5%', ' Provinces Bio - Relais Vert', '11699', 'FRANCE', null, 'Biologique', null, 'Conditionnement : env 2,5Kg 2.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('496', 'EMMENTAL POINTE VRAC LAIT CRU VACHE (ENV 3.5KG) RBIO', '5.5%', ' Provinces Bio - Relais Vert', '17266', 'FRANCE', null, 'Biologique', null, 'Conditionnement : Env 3.5kg 3.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('497', 'EMMENTAL PORTION  (220G) VALMARTIN', '5.5%', ' Provinces Bio - Relais Vert', '15793', 'UNION EUROPÉENNE', null, 'Biologique', null, 'Conditionnement : 220g 220 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('498', 'EMMENTAL RAPE (500G) VALMARTIN', '5.5%', ' Provinces Bio - Relais Vert', '15792', 'UNION EUROPÉENNE', null, 'Biologique', null, 'Conditionnement : 500g 495 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('499', 'FETA IL GRECO BLOC VRAC (ENV 1.730KG) OMA', '5.5%', ' Provinces Bio - Relais Vert', '13177', 'GRÈCE', null, 'Biologique', null, 'Conditionnement : env 1,730kg 1.73 kg', null, null, null);
INSERT INTO `produits` VALUES ('500', 'FROMAGE A LA CREME NATURE (150G) GRANDEUR NATURE', '5.5%', ' Provinces Bio - Relais Vert', '14081', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 150g 150 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('501', 'LA BUCHE DE CHEVRE (ENV 1KG) LA LEMANCE', '5.5%', ' Provinces Bio - Relais Vert', '15360', 'FRANCE', null, 'Biologique', null, 'Conditionnement : env 1kg 1 kg', null, null, null);
INSERT INTO `produits` VALUES ('502', 'MASCARPONE (250G) AMBROSI', '5.5%', ' Provinces Bio - Relais Vert', '13918', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 250g 250 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('503', 'MIMOLETTE DEMI VIEILLE (ENV 3KG) ISIGNY SAINTE MERE', '5.5%', ' Provinces Bio - Relais Vert', '16352', 'FRANCE', null, 'Biologique', null, 'Conditionnement : Env. 3kg 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('504', 'MOZZARELLA DE BUFFLONNE DOP (125G) OMA', '5.5%', ' Provinces Bio - Relais Vert', '11989', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 125g 110 g (x8)', null, null, null);
INSERT INTO `produits` VALUES ('505', 'MOZZARELLA EN BOULE SANS LACTOSE 18.5% MG (100G) ZUGER', '5.5%', ' Provinces Bio - Relais Vert', '16745', 'SUISSE', null, 'Biologique', null, 'Conditionnement : 100g 100 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('506', 'MOZZARELLA RAPE (1KG) VALMARTIN', '5.5%', ' Provinces Bio - Relais Vert', '15922', 'UNION EUROPÉENNE', null, 'Biologique', null, 'Conditionnement : 1kg 1 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('507', 'PARMESAN REGGIANO DOP RAPE LAIT CRU VACHE  (80G) OMA', '5.5%', ' Provinces Bio - Relais Vert', '16375', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 80g 80 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('508', 'PARMIGIANO REGGIANO DOP 24 MOIS  (ENV 2.5KG) AZIENDA AGRICOLA IL BARDELONNE', '5.5%', ' Provinces Bio - Relais Vert', '16683', 'ITALIE', null, 'Biologique', null, 'Conditionnement : env 2.5 KG 2.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('509', 'TOMME D\'ANJOU  LAIT DE VACHE VRAC (ENV 1.6KG) GABORIT', '5.5%', ' Provinces Bio - Relais Vert', '12125', 'FRANCE', null, 'Biologique', null, 'Conditionnement : env 1,6Kg 1.6 kg', null, null, null);
INSERT INTO `produits` VALUES ('510', 'SOJA DESSERT NATURE (4X100G) SOJADE', '5.5%', ' Provinces Bio - Relais Vert', '12888', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4x100g 400 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('511', 'SOJA NATURE (5KG) SOJADE', '5.5%', ' Provinces Bio - Relais Vert', '15899', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 5kg 4.98 kg', null, null, null);
INSERT INTO `produits` VALUES ('512', 'BRIOCHE TRANCHEE (400G) BIEN', '5.5%', ' Provinces Bio - Relais Vert', '15397', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 400g 400 g (x7)', null, null, null);
INSERT INTO `produits` VALUES ('513', 'PAINS AU LAIT (8X35G) BIEN', '5.5%', ' Provinces Bio - Relais Vert', '15046', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 8X35g 280 g (x8)', null, null, null);
INSERT INTO `produits` VALUES ('514', 'PATE BRISEE A DEROULER (230G) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '11815', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 230g 230 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('515', 'PATE FEUILLETEE A DEROULER (230G) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '11814', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 230g 230 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('516', 'PATE SABLEE PUR BEURRE A DEROULER (265G) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '16344', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 265g 265 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('517', 'TOFOU SOYEUX NATURE (400G) SOY', '5.5%', ' Provinces Bio - Relais Vert', '13370', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 400g 400 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('518', 'TOFU NATURE BLOC (500G) TOSSOLIA', '5.5%', ' Provinces Bio - Relais Vert', '12060', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 500g 500 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('519', 'TOFU FUMESSE X4 (300G) TAIFUN', '5.5%', ' Provinces Bio - Relais Vert', '13755', 'ALLEMAGNE', null, 'Biologique', null, 'Conditionnement : 300g 320 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('520', 'FARINE DE BLE T55 BLANCHE FRANCE (1KG) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '37822', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 1kg 1 kg (x10)', null, null, null);
INSERT INTO `produits` VALUES ('521', 'FARINE DE BLE T55 BLANCHE FRANCE (5KG) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '43507', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('522', 'BOULGOUR GROS (5KG) PRIMEAL', '5.5%', ' Provinces Bio - Relais Vert', '44250', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('523', 'COUSCOUS BLANC GRAIN MOYEN (5KG) MARTINO', '5.5%', ' Provinces Bio - Relais Vert', '40832', 'EUROPE DE L\'EST', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('524', 'COUSCOUS COMPLET GRAIN MOYEN (5KG) MARTINO', '5.5%', ' Provinces Bio - Relais Vert', '40833', 'EUROPE DE L\'EST', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('525', 'COUSCOUS SEMI COMPLET (5KG) MARTINO', '5.5%', ' Provinces Bio - Relais Vert', '43862', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('526', 'MELANGE 4 CEREALES PRECUITES (5KG) MARKAL', '5.5%', ' Provinces Bio - Relais Vert', '36821', null, null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('527', 'ORGE MONDE (500G) CELNAT', '5.5%', ' Provinces Bio - Relais Vert', '24791', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 500g 520 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('528', 'PETIT EPEAUTRE DECORTIQUE FRANCE (3KG) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '42050', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 3kg 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('529', 'QUINOA BLANC (5KG) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '33959', 'BOLIVIE', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('530', 'QUINOA TRICOLORE (5KG) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '35256', 'PÉROU', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('531', 'SEMOULE DE BLE DUR BLANCHE GROSSE (500G) MARKAL', '5.5%', ' Provinces Bio - Relais Vert', '24004', null, null, 'Biologique', null, 'Conditionnement : 500g 520 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('532', 'SEMOULE POLENTA (2.5KG) MOULIN D\'AMHARA', '5.5%', ' Provinces Bio - Relais Vert', '38683', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 2.5kg 2.5 kg (x2)', null, null, null);
INSERT INTO `produits` VALUES ('533', 'LENTILLE CORAIL (5KG) SELECTION RELAIS VERT', '5.5%', ' Provinces Bio - Relais Vert', '43177', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 5kg 5.1 kg', null, null, null);
INSERT INTO `produits` VALUES ('534', 'LENTILLES BLONDES FRANCE (5KG) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '44153', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('535', 'PROTEINE DE SOJA GROS (3KG) GRILLON D\'OR', '5.5%', ' Provinces Bio - Relais Vert', '29251', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 3kg 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('536', 'FARFALLE BLANCS (3KG) LORI BIO', '5.5%', ' Provinces Bio - Relais Vert', '44246', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 3kg 3 kg (x4)', null, null, null);
INSERT INTO `produits` VALUES ('537', 'FUSILLI 100% SARRASIN (500G) MA VIE SANS GLUTEN', '5.5%', ' Provinces Bio - Relais Vert', '36549', 'UNION EUROPÉENNE', null, 'Biologique', null, 'Conditionnement : 500g 500 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('538', 'LASAGNE BLANC (500G) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '43076', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 500g 500 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('539', 'MACARONIS DEMI-COMPLETS (5KG) LORI BIO', '5.5%', ' Provinces Bio - Relais Vert', '43850', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg (x2)', null, null, null);
INSERT INTO `produits` VALUES ('540', 'PATES ALPHABET BLANCHES (500G) LORI BIO', '5.5%', ' Provinces Bio - Relais Vert', '44244', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 500g 500 g (x24)', null, null, null);
INSERT INTO `produits` VALUES ('541', 'PENNE DEMI COMPLETES (5KG) LORI BIO', '5.5%', ' Provinces Bio - Relais Vert', '40423', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('542', 'SPAGHETTI BLANCS (5KG) LORI BIO', '5.5%', ' Provinces Bio - Relais Vert', '40563', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('543', 'SPAGHETTI DEMI COMPLETS (5KG) LORI BIO', '5.5%', ' Provinces Bio - Relais Vert', '40426', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('544', 'SPIRALES 3 COULEURS VRAC (5KG) BIO IDEA', '5.5%', ' Provinces Bio - Relais Vert', '30656', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('545', 'RIZ BASMATI BLANC (2X5KG) SELECTION RELAIS VERT', '5.5%', ' Provinces Bio - Relais Vert', '42772', 'PAKISTAN', null, 'Biologique', null, 'Conditionnement : 2x5kg 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('546', 'RIZ BASMATI SEMI COMPLET (2X5KG) SELECTION RELAIS VERT', '5.5%', ' Provinces Bio - Relais Vert', '42773', 'PAKISTAN', null, 'Biologique', null, 'Conditionnement : 2x5kg 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('547', 'RIZ BLANC ROND DE CAMARGUE IGP (1KG) HERIZTAGE', '5.5%', ' Provinces Bio - Relais Vert', '43165', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 1kg 500 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('548', 'RIZ JASMINE THAI BLANC (2X5KG) SELECTION RELAIS VERT', '5.5%', ' Provinces Bio - Relais Vert', '42775', 'CAMBODGE', null, 'Biologique', null, 'Conditionnement : 2x5kg 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('549', 'RIZ JASMINE THAI SEMI COMPLET (2X5KG) SELECTION RELAIS VERT', '5.5%', ' Provinces Bio - Relais Vert', '42774', 'CAMBODGE', null, 'Biologique', null, 'Conditionnement : 2x5kg 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('550', 'RIZ LONG BLANC DE CAMARGUE IGP (2X5KG) SELECTION RELAIS VERT', '5.5%', ' Provinces Bio - Relais Vert', '40628', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 2x5kg 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('551', 'RIZ LONG ETUVE BLANC (2X5KG) SELECTION RELAIS VERT', '5.5%', ' Provinces Bio - Relais Vert', '42780', 'PAKISTAN', null, 'Biologique', null, 'Conditionnement : 2x5kg 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('552', 'RIZ LONG SEMI COMPLET DE CAMARGUE IGP (2X5KG) SELECTION RELAIS VERT', '5.5%', ' Provinces Bio - Relais Vert', '40627', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 2x5kg 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('553', 'HUILE D\'OLIVE VIERGE EXTRA (1L) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '38669', 'TUNISIE', null, 'Biologique', null, 'Conditionnement : 1L 1 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('554', 'HUILE D\'OLIVE VIERGE EXTRA DOUCE OIL IN BOX (3L) BIOPLANETE', '5.5%', ' Provinces Bio - Relais Vert', '20810', 'TUNISIE', null, 'Biologique', null, 'Conditionnement : 3l 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('555', 'HUILE DE COCO VIERGE (1L) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '38890', 'UNION EUROPÉENNE', null, 'Biologique', null, 'Conditionnement : 1l 1 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('556', 'HUILE DE SESAME VIERGE (1L) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '44086', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 1l 1 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('557', 'HUILE OLIVE VIERGE EXTRA (5L) SELECTION RELAIS VERT BIDON PET', '5.5%', ' Provinces Bio - Relais Vert', '42597', 'TUNISIE', null, 'Biologique', null, 'Conditionnement : 5L 5 kg (x4)', null, null, null);
INSERT INTO `produits` VALUES ('558', 'DESSERT DE POMME (100G) CHARLES ET ALICE', '5.5%', ' Provinces Bio - Relais Vert', '43964', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 100g 100 g (x120)', null, null, null);
INSERT INTO `produits` VALUES ('559', 'DESSERT DE POMME BANANE (100G) CHARLES ET ALICE', '5.5%', ' Provinces Bio - Relais Vert', '43965', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 100g 100 g (x120)', null, null, null);
INSERT INTO `produits` VALUES ('560', 'DESSERT DE POMME FRAISE CASSIS (100G) CHARLES ET ALICE', '5.5%', ' Provinces Bio - Relais Vert', '43966', 'UNION EUROPÉENNE', null, 'Biologique', null, 'Conditionnement : 100g 100 g (x120)', null, null, null);
INSERT INTO `produits` VALUES ('561', 'DESSERT DE POMME PECHE (100G) CHARLES ET ALICE', '5.5%', ' Provinces Bio - Relais Vert', '43968', 'UNION EUROPÉENNE', null, 'Biologique', null, 'Conditionnement : 100g 100 g (x120)', null, null, null);
INSERT INTO `produits` VALUES ('562', 'DESSERT DE POMME POIRE (100G) CHARLES ET ALICE', '5.5%', ' Provinces Bio - Relais Vert', '43967', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 100g 100 g (x120)', null, null, null);
INSERT INTO `produits` VALUES ('563', 'DESSERT SO SOJA VANILLE UHT AROME BIO (530G) SOJADE', '5.5%', ' Provinces Bio - Relais Vert', '38062', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 530g 500 g (x8)', null, null, null);
INSERT INTO `produits` VALUES ('564', 'BETTERAVES ROUGES EN DES ASSAISONNEES 5/1 (4KG - PNE 2.655KG) D\'AUCY BIO', '5.5%', ' Provinces Bio - Relais Vert', '44129', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4kg - PNE 2.655kg 4 kg (x3)', null, null, null);
INSERT INTO `produits` VALUES ('565', 'CHATAIGNES MARRONS ENTIERS PELEES (420G) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '42051', 'UNION EUROPÉENNE', null, 'Biologique', null, 'Conditionnement : 420g 420 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('566', 'FLAGEOLETS VERTS AU NATUREL 5/1 (4KG - PNE 2.655KG) D\'AUCY BIO', '5.5%', ' Provinces Bio - Relais Vert', '44131', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4kg - PNE 2.655kg 4 kg (x3)', null, null, null);
INSERT INTO `produits` VALUES ('567', 'HARICOTS ROUGE AU NATUREL 5/1 (4KG - PNE 2.505KG) D\'AUCY BIO', '5.5%', ' Provinces Bio - Relais Vert', '44259', 'ÉTATS UNIS', null, 'Biologique', null, 'Conditionnement : 4kg - PNE 2.505kg 4 kg (x3)', null, null, null);
INSERT INTO `produits` VALUES ('568', 'HARICOTS VERTS EXTRA FINS AU NATUREL 5/1 (4KG - PNE 2.21KG) D\'AUCY BIO', '5.5%', ' Provinces Bio - Relais Vert', '43981', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4kg - PNE 2.21kg 4 kg (x3)', null, null, null);
INSERT INTO `produits` VALUES ('569', 'LENTILLES VERTES AU NATUREL 5/1 (4KG - PNE 2.655KG) D\'AUCY BIO', '5.5%', ' Provinces Bio - Relais Vert', '44132', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4kg - PNE 2.655kg 4 kg (x3)', null, null, null);
INSERT INTO `produits` VALUES ('570', 'MACEDOINE DE LEGUMES (4KG - PNE 2.655KG) BIO VIVER', '5.5%', ' Provinces Bio - Relais Vert', '20108C', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4kg - PNE 2.655kg 4 kg', null, null, null);
INSERT INTO `produits` VALUES ('571', 'MAIS DOUX EN GRAINS (340G) LUCE', '5.5%', ' Provinces Bio - Relais Vert', '39719', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 340g 400 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('572', 'PETITS POIS AU NATUREL 5/1 (4KG - PNE 2.655KG) D\'AUCY BIO', '5.5%', ' Provinces Bio - Relais Vert', '44134', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4kg - PNE 2.655kg 4 kg (x3)', null, null, null);
INSERT INTO `produits` VALUES ('573', 'PETITS POIS CAROTTES EN RONDELLES AU NATUREL 5/1 (4KG - PNE 2.655KG) D\'AUCY BIO', '5.5%', ' Provinces Bio - Relais Vert', '44135', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4kg - PNE 2.655kg 4 kg (x3)', null, null, null);
INSERT INTO `produits` VALUES ('574', 'POIS CHICHES AU NATUREL (660G - PNE 420G) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '40671', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 660g - PNE 420g 660 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('575', 'RATATOUILLE (4KG) BIO VIVER', '5.5%', ' Provinces Bio - Relais Vert', '20107C', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4Kg 4 kg', null, null, null);
INSERT INTO `produits` VALUES ('576', 'CONFITURE ABRICOT (690G) COTEAUX NANTAIS', '5.5%', ' Provinces Bio - Relais Vert', '36269', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 690g 690 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('577', 'CONFITURE EXTRA ABRICOT (500G) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '40450', null, null, 'Biologique', null, 'Conditionnement : 500g 500 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('578', 'CONFITURE EXTRA FRAISE (500G) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '40510', null, null, 'Biologique', null, 'Conditionnement : 500g 500 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('579', 'CONFITURE EXTRA MYRTILLE (500G) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '40512', null, null, 'Biologique', null, 'Conditionnement : 500g 500 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('580', 'CREME DE CHATAIGNE D\'ARDECHE NATURE (325G) PRIMEAL', '5.5%', ' Provinces Bio - Relais Vert', '33987', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 325g 325 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('581', 'CREME DE MARRONS AOP (325G) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '42052', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 325g 325 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('582', 'PECHES MOITIES AU SIROP LEGER 5/1 (4.6KG) BIO VIVER', '5.5%', ' Provinces Bio - Relais Vert', '31083', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4.6Kg 4.6 kg', null, null, null);
INSERT INTO `produits` VALUES ('583', 'POIRES WILLIAMS MOITIES AU SIROP (4.5KG) BIO VIVER', '5.5%', ' Provinces Bio - Relais Vert', '20008C', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4.5KG  - PNE 2.8KG 4.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('584', 'PUREE DE POMMES (825G) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '39280', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 825g 825 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('585', 'PUREE DE POMMES 13% (4.2KG) BIO VIVER', '5.5%', ' Provinces Bio - Relais Vert', '20001C', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4.2Kg 4.2 kg', null, null, null);
INSERT INTO `produits` VALUES ('586', 'PUREE DE POMMES ABRICOTS (915G) COTEAUX NANTAIS', '5.5%', ' Provinces Bio - Relais Vert', '41801', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 915g 915 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('587', 'PUREE POMMES POUCH UP (3KG) COTEAUX NANTAIS', '5.5%', ' Provinces Bio - Relais Vert', '34921', 'UNION EUROPÉENNE', null, 'Biologique', null, 'Conditionnement : 3kg 3 kg (x4)', null, null, null);
INSERT INTO `produits` VALUES ('588', 'SUCRE BUCHETTES (500X4G) BIODYSSEE', '5.5%', ' Provinces Bio - Relais Vert', '40836', 'AMÉRIQUE DU SUD', null, 'Biologique', null, 'Conditionnement : 2kg 2 kg', null, null, null);
INSERT INTO `produits` VALUES ('589', 'SUCRE CANNE BLOND (25KG) SELECTION RELAIS VERT', '5.5%', ' Provinces Bio - Relais Vert', '24123', 'AMÉRIQUE DU SUD', null, 'Biologique', null, 'Conditionnement : 25kg 25.05 kg', null, null, null);
INSERT INTO `produits` VALUES ('590', 'SUCRE DE CANNE BLOND SEMOULE (5KG) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '42489', 'COLOMBIE', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('591', 'SUCRE DE CANNE ROUX EN MORCEAUX BRESIL (1KG) LOIRET', '5.5%', ' Provinces Bio - Relais Vert', '27820', 'BRÉSIL', null, 'Biologique', null, 'Conditionnement : 1kg 1.05 kg (x12)', null, null, null);
INSERT INTO `produits` VALUES ('592', 'SUCRE DE CANNE ROUX SEMOULE (1KG) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '42574', 'INDE', null, 'Biologique', null, 'Conditionnement : 1kg 1 kg (x12)', null, null, null);
INSERT INTO `produits` VALUES ('593', 'SUCRE DE CANNE ROUX SEMOULE (25KG) SELECTION RELAIS VERT', '5.5%', ' Provinces Bio - Relais Vert', '34727', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 25kg 25 kg', null, null, null);
INSERT INTO `produits` VALUES ('594', 'SUCRE DE CANNE ROUX SEMOULE (5KG) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '42491', 'INDE', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('595', 'SUCRE MASCOBADO (5KG) ARTISANS DU MONDE', '5.5%', ' Provinces Bio - Relais Vert', '34796', 'PHILIPPINES', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('596', 'AIL POUDRE EGYPTE (500G) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '35738', 'EGYPTE', null, 'Biologique', null, 'Conditionnement : 500g 500 g', null, null, null);
INSERT INTO `produits` VALUES ('597', 'AIL SEMOULE CHINE (500G) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '43925', 'CHINE', null, 'Biologique', null, 'Conditionnement : 500g 500 g (x20)', null, null, null);
INSERT INTO `produits` VALUES ('598', 'AMIDON DE MAIS (500G) MOULIN DES MOINES', '5.5%', ' Provinces Bio - Relais Vert', '44279', 'UNION EUROPÉENNE', null, 'Biologique', null, 'Conditionnement : 500g 500 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('599', 'BOUILLON DE BOEUF CUBES (66G) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '39507', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 66g 66 g (x24)', null, null, null);
INSERT INTO `produits` VALUES ('600', 'BOUILLON DE LEGUME (72G) MA VIE SANS GLUTEN', '5.5%', ' Provinces Bio - Relais Vert', '36760', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 72g 72 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('601', 'BOUILLON DE POULE CUBES (66G) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '39241', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 66g 66 g (x24)', null, null, null);
INSERT INTO `produits` VALUES ('602', 'CANNELLE POUDRE (500G) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '22449', 'MADAGASCAR', null, 'Biologique', null, 'Conditionnement : 500g 500 g', null, null, null);
INSERT INTO `produits` VALUES ('603', 'CONCENTRE DE TOMATES 22% (190G) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '36148', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 190 g 190 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('604', 'CORNICHONS AU VINAIGRE DE CIDRE (660G - PNE 360G) BRAVO HUGO', '5.5%', ' Provinces Bio - Relais Vert', '37703', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 660g - PNE 360g 1.011 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('605', 'CUMIN POUDRE (500G) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '22450', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 500g 500 g', null, null, null);
INSERT INTO `produits` VALUES ('606', 'CURCUMA POUDRE (500G) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '23545', 'MADAGASCAR', null, 'Biologique', null, 'Conditionnement : 500g 500 g', null, null, null);
INSERT INTO `produits` VALUES ('607', 'CURRY POUDRE (500G) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '22770', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 500g 500 g', null, null, null);
INSERT INTO `produits` VALUES ('608', 'GINGEMBRE POUDRE (500G) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '22839', 'NON UE', null, 'Biologique', null, 'Conditionnement : 500g 500 g', null, null, null);
INSERT INTO `produits` VALUES ('609', 'GROS SEL DE CAMARGUE (1KG) LA BALEINE VERTE', '5.5%', ' Provinces Bio - Relais Vert', '42305', 'FRANCE', null, null, null, 'Conditionnement : 1kg 1 kg (x12)', null, null, null);
INSERT INTO `produits` VALUES ('610', 'HERBES DE PROVENCE FLOCONS SANS MARJOLAINE (250G) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '41675', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 250g 250 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('611', 'KETCHUP FLACON SOUPLE TOMATE FRANCE (560G) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '43665', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 560g 560 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('612', 'MAYONNAISE NATURE EN SQUEEZE (315G) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '41944', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 315g 315 g (x9)', null, null, null);
INSERT INTO `produits` VALUES ('613', 'MELANGE COUSCOUS POUDRE (500G) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '22769', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 500g 510 g', null, null, null);
INSERT INTO `produits` VALUES ('614', 'MUSCADE POUDRE (500G) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '22521', 'NON UE', null, 'Biologique', null, 'Conditionnement : 500g 510 g', null, null, null);
INSERT INTO `produits` VALUES ('615', 'OLIVES NOIRES DENOYAUTEES (400G) BELLE NATURE', '5.5%', ' Provinces Bio - Relais Vert', '30666', 'MAROC', null, 'Biologique', null, 'Conditionnement : 400g 400 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('616', 'OLIVES NOIRES DENOYAUTEES (5KG) BELLE NATURE', '5.5%', ' Provinces Bio - Relais Vert', '22205', 'MAROC', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('617', 'OLIVES VERTES DENOYAUTEES (5KG) BELLE NATURE', '5.5%', ' Provinces Bio - Relais Vert', '22203', 'MAROC', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('618', 'OLIVES VERTES DENOYAUTEES (600G - PNE 400G) BELLE NATURE', '5.5%', ' Provinces Bio - Relais Vert', '30598', 'MAROC', null, 'Biologique', null, 'Conditionnement : 600g - PNE 400g 400 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('619', 'PASSATA (680G) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '35852', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 680g 680 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('620', 'PIMENT DOUX POUDRE (500G) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '23248', 'ESPAGNE', null, 'Biologique', null, 'Conditionnement : 500g 520 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('621', 'POIVRE NOIR GRAIN (500G) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '22430', 'NON UE', null, 'Biologique', null, 'Conditionnement : 500g 520 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('622', 'POIVRE NOIR POUDRE (500G) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '22759', 'NON UE', null, 'Biologique', null, 'Conditionnement : 500g 500 g', null, null, null);
INSERT INTO `produits` VALUES ('623', 'PUR JUS DE CITRON (1L) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '35204', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 1l 1 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('624', 'SAUCE SOJA TAMARI (5L) AUTOUR DU RIZ', '5.5%', ' Provinces Bio - Relais Vert', '42673', 'THAÏLANDE', null, 'Biologique', null, 'Conditionnement : 5L 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('625', 'SAUCE TOMATE BASILIC (4.2KG) BIO VIVER', '5.5%', ' Provinces Bio - Relais Vert', '20104C', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4,2Kg 4.2 kg', null, null, null);
INSERT INTO `produits` VALUES ('626', 'SEL FIN DE GUERANDE IGP (1KG) LE PALUDIER', '5.5%', ' Provinces Bio - Relais Vert', '32099', 'FRANCE', null, null, null, 'Conditionnement : 1kg 1.03 kg (x10)', null, null, null);
INSERT INTO `produits` VALUES ('627', 'SEL FIN DE GUERANDE IGP (5KG) LE PALUDIER', '5.5%', ' Provinces Bio - Relais Vert', '25617', 'FRANCE', null, null, null, 'Conditionnement : 5kg 5.2 kg', null, null, null);
INSERT INTO `produits` VALUES ('628', 'TAMARI STRONG (1L) LIMA', '5.5%', ' Provinces Bio - Relais Vert', '29763', 'PAYS BAS', null, 'Biologique', null, 'Conditionnement : 1l 1.01 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('629', 'VANILLE BOURBON 2 GOUSSES ( 5GRS) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '36113', 'NON UE', null, 'Biologique', null, 'Conditionnement : environ 5g 7 g (x3)', null, null, null);
INSERT INTO `produits` VALUES ('630', 'VINAIGRE BALSAMIQUE DE MODENE 6% (75CL) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '38990', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 75cl 766 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('631', 'VINAIGRE BLANC D\'ALCOOL 10% AB  (5L) DELOUIS', '5.5%', ' Provinces Bio - Relais Vert', '27231', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 5l 800 g (x2)', null, null, null);
INSERT INTO `produits` VALUES ('632', 'VINAIGRE D\'ALCOOL 6% (1L) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '40433', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 1l 1 kg (x12)', null, null, null);
INSERT INTO `produits` VALUES ('633', 'VINAIGRE DE CIDRE 5% (5L) SELECTION RELAIS VERT', '5.5%', ' Provinces Bio - Relais Vert', '44275', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 5l 5 kg (x2)', null, null, null);
INSERT INTO `produits` VALUES ('634', 'VINAIGRE DE CIDRE NON PASTEURISÉ (1L) VIGEAN', '5.5%', ' Provinces Bio - Relais Vert', '24321', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 1l 1.5 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('635', 'VINAIGRE DE VIN 6% (5L) SELECTION RELAIS VERT', '5.5%', ' Provinces Bio - Relais Vert', '44276', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 5l 5 kg (x2)', null, null, null);
INSERT INTO `produits` VALUES ('636', 'VINAIGRE DE VIN ROUGE (75CL) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '38989', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 75cl 766 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('637', 'AMANDINA (1L) PERLAMANDE', '5.5%', ' Provinces Bio - Relais Vert', '39277', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 1l 1.06 kg (x8)', null, null, null);
INSERT INTO `produits` VALUES ('638', 'BOISSON AU SOJA NATURE (1L) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '42896', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 1l 1 kg (x8)', null, null, null);
INSERT INTO `produits` VALUES ('639', 'BOISSON D\'AVOINE (1L) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '39036', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 1L 1 kg (x10)', null, null, null);
INSERT INTO `produits` VALUES ('640', 'BOISSON RIZ NATURE (1L) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '38791', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 1L 1 kg (x10)', null, null, null);
INSERT INTO `produits` VALUES ('641', 'BOISSON SO SOJA VANILLE UHT (1L) SOJADE', '5.5%', ' Provinces Bio - Relais Vert', '33870', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 1l 1 kg (x8)', null, null, null);
INSERT INTO `produits` VALUES ('642', 'BOISSON TRIO RIZ EPEAUTRES NOISETTES(1L) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '43171', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 1L 1 kg (x10)', null, null, null);
INSERT INTO `produits` VALUES ('643', 'PUR JUS D\'ANANAS TETRA (1L) VITAMONT', '5.5%', ' Provinces Bio - Relais Vert', '33693', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 1l 1.08 kg (x8)', null, null, null);
INSERT INTO `produits` VALUES ('644', 'PUR JUS D\'ORANGE (1L) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '39815', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 1L 1.087 kg (x10)', null, null, null);
INSERT INTO `produits` VALUES ('645', 'PUR JUS D\'ORANGE MEDITERRANEE POUCH UP (3L) VITAMONT', '5.5%', ' Provinces Bio - Relais Vert', '37011', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 3l 3.2 kg (x4)', null, null, null);
INSERT INTO `produits` VALUES ('646', 'PUR JUS DE POMME TETRA (1L) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '40804', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 1l 1 kg (x10)', null, null, null);
INSERT INTO `produits` VALUES ('647', 'PUR JUS DE RAISIN ROUGE (1L) VITAMONT', '5.5%', ' Provinces Bio - Relais Vert', '24398', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 1l 1.34 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('648', 'SIROP DE CITRON (1L) MENEAU', '5.5%', ' Provinces Bio - Relais Vert', '23275', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 1l 1.3 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('649', 'SIROP DE FRAISE (50CL) MENEAU', '5.5%', ' Provinces Bio - Relais Vert', '27248', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 50cl 1 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('650', 'SIROP DE GRENADINE (1L) MENEAU', '5.5%', ' Provinces Bio - Relais Vert', '23273', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 1l 1.3 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('651', 'SIROP DE MENTHE (1L) MENEAU', '5.5%', ' Provinces Bio - Relais Vert', '23274', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 1l 1.3 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('652', 'CHOCOLUNE (375G) GRILLON D\'OR', '5.5%', ' Provinces Bio - Relais Vert', '29426', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 375g 375 g (x8)', null, null, null);
INSERT INTO `produits` VALUES ('653', 'CHOCOLUNE (3KG) GRILLON D\'OR', '5.5%', ' Provinces Bio - Relais Vert', '37937', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 3Kg 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('654', 'KROUNCHY FRUITS ROUGES (5KG) GRILLON D\'OR', '5.5%', ' Provinces Bio - Relais Vert', '37942', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 5kg 10 kg', null, null, null);
INSERT INTO `produits` VALUES ('655', 'GRAINES DE COURGE (250G) LE BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '43374', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 250g 250 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('656', 'GRAINES DE TOURNESOL DECORTIQUEES FRANCE (4KG) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '39556', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 4kg 4 kg', null, null, null);
INSERT INTO `produits` VALUES ('657', 'SARRASIN DECORTIQUE (3KG) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '43661', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 3kg 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('658', 'BISCUITS ENFANT TIGRE CHOCOLAT VANILLE VRAC (3KG) PAIN DE BELLEDONNE', '5.5%', ' Provinces Bio - Relais Vert', '34313', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 3kg 3 kg', null, null, null);
INSERT INTO `produits` VALUES ('659', 'BISCUITS FOURRES CREME DE CACAO (200G) GERMINAL', '5.5%', ' Provinces Bio - Relais Vert', '43381', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 200g 334 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('660', 'BISCUITS SPECULOOS (3KG) ECO NATURE', '5.5%', ' Provinces Bio - Relais Vert', '26026', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 3kg 3.05 kg', null, null, null);
INSERT INTO `produits` VALUES ('661', 'CAKE NATURE BIO CARTONS (90X30G) LA BOITE À CAKE', '5.5%', ' Provinces Bio - Relais Vert', '21782C', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 90 x 30g 2.7 kg', null, null, null);
INSERT INTO `produits` VALUES ('662', 'COOKIES AUX TROIS CHOCOLAT (175G) MOULIN DU PIVERT', '5.5%', ' Provinces Bio - Relais Vert', '41966', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 175g 240 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('663', 'COOKIES FOURRES CHOCOLAT VRAC (100 X 17,5G) MOULIN DU PIVERT', '5.5%', ' Provinces Bio - Relais Vert', '31673', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 100 x 17,5g 1.75 kg', null, null, null);
INSERT INTO `produits` VALUES ('664', 'COOKIES PEPITES CHOCOLAT AU LAIT (2X1.5KG) MOULIN DU PIVERT', '5.5%', ' Provinces Bio - Relais Vert', '39102', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 2x1.5kg 1.5 kg', null, null, null);
INSERT INTO `produits` VALUES ('665', 'GALETTES BRETONNES (100X15G) BIOROC\'HELOU', '5.5%', ' Provinces Bio - Relais Vert', '43980', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 100x15g 1.5 kg (x16)', null, null, null);
INSERT INTO `produits` VALUES ('666', 'MADELEINES AU BEURRE INDIVIDUELLE (30G) BIOROC\'HELOU', '5.5%', ' Provinces Bio - Relais Vert', '44183', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 30g 30 g (x60)', null, null, null);
INSERT INTO `produits` VALUES ('667', 'MINI CAKE PEPITES DE CHOCOLAT (30G) FRANCE CAKE TRADITION', '5.5%', ' Provinces Bio - Relais Vert', '43983', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 30g 30 g (x50)', null, null, null);
INSERT INTO `produits` VALUES ('668', 'PAIN D\'EPICES REGAMIEL (300G) BISSON', '5.5%', ' Provinces Bio - Relais Vert', '33981', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 300g 300 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('669', 'TWIBIO FOURRE CHOCOLAT (1.6KG) MOULIN DU PIVERT', '5.5%', ' Provinces Bio - Relais Vert', '23168C', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 1.6kg 16 g', null, null, null);
INSERT INTO `produits` VALUES ('670', 'AGAR AGAR BIO EN POUDRE (50G) NATALI', '5.5%', ' Provinces Bio - Relais Vert', '33054', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 50g 50 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('671', 'BIOFLAN CHOCOLAT AU SUCRE DE CANNE (DOYPACK 800G/10L) NATALI', '5.5%', ' Provinces Bio - Relais Vert', '23611', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 800g 860 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('672', 'EXTRAIT DE VANILLE (15ML) NATALI', '5.5%', ' Provinces Bio - Relais Vert', '30772', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 15ml 300 g (x9)', null, null, null);
INSERT INTO `produits` VALUES ('673', 'EXTRAIT DE VANILLE (40ML) COOK ARCADIE', '5.5%', ' Provinces Bio - Relais Vert', '36264', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 40ml 40 g (x3)', null, null, null);
INSERT INTO `produits` VALUES ('674', 'LAIT DE COCO 7% MG (400ML) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '41358', 'SRI LANKA', null, 'Biologique', null, 'Conditionnement : 400ml 400 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('675', 'POUDRE D\'AMANDE BLANCHE (150G) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '39521', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 150g 150 g (x8)', null, null, null);
INSERT INTO `produits` VALUES ('676', 'SOJA CUISINE (20CL) LIMA', '5.5%', ' Provinces Bio - Relais Vert', '36885', 'AUTRICHE', null, 'Biologique', null, 'Conditionnement : 20cl 60 g (x15)', null, null, null);
INSERT INTO `produits` VALUES ('677', 'TABLETTE CHOCOLAT NOIR DESSERT PATISSIER 58% CACAO (200G) KAOKA', '5.5%', ' Provinces Bio - Relais Vert', '26801', 'NON UE', null, 'Biologique', null, 'Conditionnement : 200g 200 g (x30)', null, null, null);
INSERT INTO `produits` VALUES ('678', 'TOMATES SECHEES (4,75KG) BIOVERDE', '5.5%', ' Provinces Bio - Relais Vert', '27321', 'ALLEMAGNE', null, 'Biologique', null, 'Conditionnement : 4,75kg 6.35 kg', null, null, null);
INSERT INTO `produits` VALUES ('679', 'TORTILLA DE BLE WRAP (4X50G) APERIBIO', '5.5%', ' Provinces Bio - Relais Vert', '42564', null, null, 'Biologique', null, 'Conditionnement : 4x50g 200 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('680', '7 PATES DE FRUITS ASSORTIES (220G) PROSAIN', '5.5%', ' Provinces Bio - Relais Vert', '21184', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 220g 220 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('681', 'BARRETTE CHOCOLAT NOIR 71% A CROQUER OU PATISSER SS GLUTEN (6KG) DARDENNE', '5.5%', ' Provinces Bio - Relais Vert', '31174', 'NON UE', null, 'Biologique', null, 'Conditionnement : 6kg 6 kg', null, null, null);
INSERT INTO `produits` VALUES ('682', 'BARRETTES CHOCOLAT AU LAIT 47% CACAO  (6KG) DARDENNE', '20%', ' Provinces Bio - Relais Vert', '40416', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 6kg 6 kg', null, null, null);
INSERT INTO `produits` VALUES ('683', 'MIEL TOUTES FLEURS (450G) JEAN HERVE', '5.5%', ' Provinces Bio - Relais Vert', '26405', 'MEXIQUE', null, 'Biologique', null, 'Conditionnement : 450g 450 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('684', 'MIEL TOUTES FLEURS (950G) JEAN HERVE', '5.5%', ' Provinces Bio - Relais Vert', '26406', 'MEXIQUE', null, 'Biologique', null, 'Conditionnement : 950g 950 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('685', 'PALETS DE CHOCOLAT NOIR EQUATEUR 72% (5KG) KAOKA', '5.5%', ' Provinces Bio - Relais Vert', '36586', 'NON UE', null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('686', 'PATE A TARTINER CHOCOLADE SS H PALME (350G) JEAN HERVE', '5.5%', ' Provinces Bio - Relais Vert', '28437', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 350g 350 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('687', 'PATE A TARTINER CHOKO NOIR (700G) NOISERAIE', '5.5%', ' Provinces Bio - Relais Vert', '42592', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 700g 700 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('688', 'PATE A TARTINER CHOKOLINETTE (700G) NOISERAIE', '5.5%', ' Provinces Bio - Relais Vert', '32560', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 700g 700 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('689', 'PATE A TARTINER NOISETTES ET CHOCOLAT \"CHOCOBELLA\" (4KG) DAMIANO', '5.5%', ' Provinces Bio - Relais Vert', '38877', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 4kg 4 kg', null, null, null);
INSERT INTO `produits` VALUES ('690', 'PEPITES DE CHOCOLAT NOIR 60% (5KG) KAOKA', '5.5%', ' Provinces Bio - Relais Vert', '34939', null, null, 'Biologique', null, 'Conditionnement : 5kg 5 kg', null, null, null);
INSERT INTO `produits` VALUES ('691', 'TABLETTE CHOCOLAT LAIT (100G) VIVANI', '20%', ' Provinces Bio - Relais Vert', '23721', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 100g 100 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('692', 'TABLETTE CHOCOLAT NOIR 71% (100G) VIVANI', '5.5%', ' Provinces Bio - Relais Vert', '23732', 'NON UE', null, 'Biologique', null, 'Conditionnement : 100g 100 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('693', 'CACAO MAIGRE EN POUDRE 10-12% (250G) KAOKA', '5.5%', ' Provinces Bio - Relais Vert', '35667', null, null, 'Biologique', null, 'Conditionnement : 250g 250 g (x18)', null, null, null);
INSERT INTO `produits` VALUES ('694', 'CAFE MOULU (1KG) BIO POUR TOUS', '5.5%', ' Provinces Bio - Relais Vert', '42301', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 1kg 1 kg (x6)', null, null, null);
INSERT INTO `produits` VALUES ('695', 'CAFE MOULU 100% ARABICA MEDIUM (500G) BIODYSSEE', '5.5%', ' Provinces Bio - Relais Vert', '39403', 'ETHIOPIE', null, 'Biologique', null, 'Conditionnement : 500g 500 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('696', 'CAFE MOULU 100% ARABICA ROBUSTA (250G) BIODYSSEE', '5.5%', ' Provinces Bio - Relais Vert', '44185', 'NON UE', null, 'Biologique', null, 'Conditionnement : 250g 250 g (x9)', null, null, null);
INSERT INTO `produits` VALUES ('697', 'INFUSETTES THE NOIR EARL GREY DE CEYLAN (20X2G) BIODYSSEE', '5.5%', ' Provinces Bio - Relais Vert', '39395', 'SRI LANKA', null, 'Biologique', null, 'Conditionnement : 20x2g 60 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('698', 'POUDRE CHOCOLATEE 20% CACAO \"SUPERCHOCO\" (800G) BIODYSSEE', '5.5%', ' Provinces Bio - Relais Vert', '40890', 'AMÉRIQUE DU SUD', null, 'Biologique', null, 'Conditionnement : 800g 800 g (x8)', null, null, null);
INSERT INTO `produits` VALUES ('699', 'THE NOIR MELANGE ENGLISH BREAKFAST (100G) LES JARDINS DE GAIA', '5.5%', ' Provinces Bio - Relais Vert', '31350', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 100g 100 g (x5)', null, null, null);
INSERT INTO `produits` VALUES ('700', 'VERVEINE MENTHE (20 INFUSETTES) LES JARDINS DE GAIA', '5.5%', ' Provinces Bio - Relais Vert', '43025', 'UNION EUROPÉENNE', null, 'Biologique', null, 'Conditionnement : 20x1,5g 30 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('701', 'ABRICOTS DOUX SECS DOYPACK (250G) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '38328', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 250g 250 g (x8)', null, null, null);
INSERT INTO `produits` VALUES ('702', 'BANANES SECHEES DOYPACK (200G) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '38339', 'PHILIPPINES', null, 'Biologique', null, 'Conditionnement : 200g 200 g (x8)', null, null, null);
INSERT INTO `produits` VALUES ('703', 'PRUNEAUX D\'AGEN DENOYAUTES TRES GROS 44/55 (250G) NATUR\'AVENIR', '5.5%', ' Provinces Bio - Relais Vert', '42226', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 250g 250 g (x10)', null, null, null);
INSERT INTO `produits` VALUES ('704', 'PRUNEAUX D\'AGEN DENOYAUTES TRES GROS 44/55 (500G) LOU PRUNEL', '5.5%', ' Provinces Bio - Relais Vert', '36077', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 500g 250 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('705', 'PUREE DE SESAME BLANC (700G) JEAN HERVE', '5.5%', ' Provinces Bio - Relais Vert', '20343', 'NON UE', null, 'Biologique', null, 'Conditionnement : 700g 700 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('706', 'PUREE DE SESAME DEMI COMPLET (700G) JEAN HERVE', '5.5%', ' Provinces Bio - Relais Vert', '20328', 'NON UE', null, 'Biologique', null, 'Conditionnement : 700g 700 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('707', 'PUREE D’AMANDES GRILLEES \"AMANDINO\" (750G) DAMIANO', '5.5%', ' Provinces Bio - Relais Vert', '39905', 'ITALIE', null, 'Biologique', null, 'Conditionnement : 750g 750 g (x6)', null, null, null);
INSERT INTO `produits` VALUES ('708', 'RAISIN SULTANINE (1KG) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '36344', 'TURQUIE', null, 'Biologique', null, 'Conditionnement : 1kg 1 kg (x4)', null, null, null);
INSERT INTO `produits` VALUES ('709', 'BISCOTTES COMPLETE (280G) LA CHANTERACOISE', '5.5%', ' Provinces Bio - Relais Vert', '36963', 'FRANCE', null, 'Biologique', null, 'Conditionnement : 280g 280 g (x8)', null, null, null);
INSERT INTO `produits` VALUES ('710', 'PAINS A HAMBURGER (4X62.5G) SCHNITZER', '5.5%', ' Provinces Bio - Relais Vert', '36925', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 4x62.5g 125 g (x5)', null, null, null);
INSERT INTO `produits` VALUES ('711', 'TARTINES AU SARRASIN (300G) LE PAIN DES FLEURS', '5.5%', ' Provinces Bio - Relais Vert', '28431', 'UNION EUROPÉENNE', null, 'Biologique', null, 'Conditionnement : 300g 300 g (x8)', null, null, null);
INSERT INTO `produits` VALUES ('712', 'SIROP D\'AGAVE (690G) PHILIA', '5.5%', ' Provinces Bio - Relais Vert', '39977', 'MEXIQUE', null, 'Biologique', null, 'Conditionnement : 690g 690 g (x12)', null, null, null);
INSERT INTO `produits` VALUES ('713', 'FOND BLANC DE VOLAILLE (600G) SOMABIO', '5.5%', ' Provinces Bio - Relais Vert', '44243', 'UE / NON UE', null, 'Biologique', null, 'Conditionnement : 600 g (x6)', null, null, null);

-- ----------------------------
-- Table structure for `produits_producteurs`
-- ----------------------------
DROP TABLE IF EXISTS `produits_producteurs`;
CREATE TABLE `produits_producteurs` (
  `id_produit` int(11) NOT NULL,
  `id_producteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of produits_producteurs
-- ----------------------------
INSERT INTO `produits_producteurs` VALUES ('2', '14');
INSERT INTO `produits_producteurs` VALUES ('3', '14');
INSERT INTO `produits_producteurs` VALUES ('4', '14');
INSERT INTO `produits_producteurs` VALUES ('5', '14');
INSERT INTO `produits_producteurs` VALUES ('6', '14');
INSERT INTO `produits_producteurs` VALUES ('7', '93');
INSERT INTO `produits_producteurs` VALUES ('8', '81');
INSERT INTO `produits_producteurs` VALUES ('9', '81');
INSERT INTO `produits_producteurs` VALUES ('10', '14');
INSERT INTO `produits_producteurs` VALUES ('11', '14');
INSERT INTO `produits_producteurs` VALUES ('12', '14');
INSERT INTO `produits_producteurs` VALUES ('13', '14');
INSERT INTO `produits_producteurs` VALUES ('14', '14');
INSERT INTO `produits_producteurs` VALUES ('15', '14');
INSERT INTO `produits_producteurs` VALUES ('16', '14');
INSERT INTO `produits_producteurs` VALUES ('16', '81');
INSERT INTO `produits_producteurs` VALUES ('17', '14');
INSERT INTO `produits_producteurs` VALUES ('18', '14');
INSERT INTO `produits_producteurs` VALUES ('18', '81');
INSERT INTO `produits_producteurs` VALUES ('19', '14');
INSERT INTO `produits_producteurs` VALUES ('20', '14');
INSERT INTO `produits_producteurs` VALUES ('21', '14');
INSERT INTO `produits_producteurs` VALUES ('22', '14');
INSERT INTO `produits_producteurs` VALUES ('22', '48');
INSERT INTO `produits_producteurs` VALUES ('22', '71');
INSERT INTO `produits_producteurs` VALUES ('23', '14');
INSERT INTO `produits_producteurs` VALUES ('23', '48');
INSERT INTO `produits_producteurs` VALUES ('23', '71');
INSERT INTO `produits_producteurs` VALUES ('24', '84');
INSERT INTO `produits_producteurs` VALUES ('25', '93');
INSERT INTO `produits_producteurs` VALUES ('27', '80');
INSERT INTO `produits_producteurs` VALUES ('28', '93');
INSERT INTO `produits_producteurs` VALUES ('29', '14');
INSERT INTO `produits_producteurs` VALUES ('30', '14');
INSERT INTO `produits_producteurs` VALUES ('31', '80');
INSERT INTO `produits_producteurs` VALUES ('31', '84');
INSERT INTO `produits_producteurs` VALUES ('32', '7');
INSERT INTO `produits_producteurs` VALUES ('32', '14');
INSERT INTO `produits_producteurs` VALUES ('33', '7');
INSERT INTO `produits_producteurs` VALUES ('33', '14');
INSERT INTO `produits_producteurs` VALUES ('34', '14');
INSERT INTO `produits_producteurs` VALUES ('35', '80');
INSERT INTO `produits_producteurs` VALUES ('36', '48');
INSERT INTO `produits_producteurs` VALUES ('37', '48');
INSERT INTO `produits_producteurs` VALUES ('38', '8');
INSERT INTO `produits_producteurs` VALUES ('38', '48');
INSERT INTO `produits_producteurs` VALUES ('39', '8');
INSERT INTO `produits_producteurs` VALUES ('39', '48');
INSERT INTO `produits_producteurs` VALUES ('40', '17');
INSERT INTO `produits_producteurs` VALUES ('40', '48');
INSERT INTO `produits_producteurs` VALUES ('40', '84');
INSERT INTO `produits_producteurs` VALUES ('41', '14');
INSERT INTO `produits_producteurs` VALUES ('41', '17');
INSERT INTO `produits_producteurs` VALUES ('41', '48');
INSERT INTO `produits_producteurs` VALUES ('41', '82');
INSERT INTO `produits_producteurs` VALUES ('42', '14');
INSERT INTO `produits_producteurs` VALUES ('42', '17');
INSERT INTO `produits_producteurs` VALUES ('42', '48');
INSERT INTO `produits_producteurs` VALUES ('42', '84');
INSERT INTO `produits_producteurs` VALUES ('43', '14');
INSERT INTO `produits_producteurs` VALUES ('43', '48');
INSERT INTO `produits_producteurs` VALUES ('43', '84');
INSERT INTO `produits_producteurs` VALUES ('44', '14');
INSERT INTO `produits_producteurs` VALUES ('44', '17');
INSERT INTO `produits_producteurs` VALUES ('44', '48');
INSERT INTO `produits_producteurs` VALUES ('44', '84');
INSERT INTO `produits_producteurs` VALUES ('45', '14');
INSERT INTO `produits_producteurs` VALUES ('45', '17');
INSERT INTO `produits_producteurs` VALUES ('45', '48');
INSERT INTO `produits_producteurs` VALUES ('46', '14');
INSERT INTO `produits_producteurs` VALUES ('46', '17');
INSERT INTO `produits_producteurs` VALUES ('46', '48');
INSERT INTO `produits_producteurs` VALUES ('46', '82');
INSERT INTO `produits_producteurs` VALUES ('47', '14');
INSERT INTO `produits_producteurs` VALUES ('47', '17');
INSERT INTO `produits_producteurs` VALUES ('47', '48');
INSERT INTO `produits_producteurs` VALUES ('47', '84');
INSERT INTO `produits_producteurs` VALUES ('48', '14');
INSERT INTO `produits_producteurs` VALUES ('49', '14');
INSERT INTO `produits_producteurs` VALUES ('50', '80');
INSERT INTO `produits_producteurs` VALUES ('51', '14');
INSERT INTO `produits_producteurs` VALUES ('52', '4');
INSERT INTO `produits_producteurs` VALUES ('53', '4');
INSERT INTO `produits_producteurs` VALUES ('54', '4');
INSERT INTO `produits_producteurs` VALUES ('55', '4');
INSERT INTO `produits_producteurs` VALUES ('56', '4');
INSERT INTO `produits_producteurs` VALUES ('57', '4');
INSERT INTO `produits_producteurs` VALUES ('58', '4');
INSERT INTO `produits_producteurs` VALUES ('59', '4');
INSERT INTO `produits_producteurs` VALUES ('60', '4');
INSERT INTO `produits_producteurs` VALUES ('61', '4');
INSERT INTO `produits_producteurs` VALUES ('62', '4');
INSERT INTO `produits_producteurs` VALUES ('63', '4');
INSERT INTO `produits_producteurs` VALUES ('64', '4');
INSERT INTO `produits_producteurs` VALUES ('65', '4');
INSERT INTO `produits_producteurs` VALUES ('66', '4');
INSERT INTO `produits_producteurs` VALUES ('67', '4');
INSERT INTO `produits_producteurs` VALUES ('68', '4');
INSERT INTO `produits_producteurs` VALUES ('69', '4');
INSERT INTO `produits_producteurs` VALUES ('70', '4');
INSERT INTO `produits_producteurs` VALUES ('71', '4');
INSERT INTO `produits_producteurs` VALUES ('72', '4');
INSERT INTO `produits_producteurs` VALUES ('73', '4');
INSERT INTO `produits_producteurs` VALUES ('74', '4');
INSERT INTO `produits_producteurs` VALUES ('75', '4');
INSERT INTO `produits_producteurs` VALUES ('76', '3');
INSERT INTO `produits_producteurs` VALUES ('77', '3');
INSERT INTO `produits_producteurs` VALUES ('78', '3');
INSERT INTO `produits_producteurs` VALUES ('79', '3');
INSERT INTO `produits_producteurs` VALUES ('80', '3');
INSERT INTO `produits_producteurs` VALUES ('81', '3');
INSERT INTO `produits_producteurs` VALUES ('82', '3');
INSERT INTO `produits_producteurs` VALUES ('83', '79');
INSERT INTO `produits_producteurs` VALUES ('83', '83');
INSERT INTO `produits_producteurs` VALUES ('84', '79');
INSERT INTO `produits_producteurs` VALUES ('84', '83');
INSERT INTO `produits_producteurs` VALUES ('85', '14');
INSERT INTO `produits_producteurs` VALUES ('86', '49');
INSERT INTO `produits_producteurs` VALUES ('87', '49');
INSERT INTO `produits_producteurs` VALUES ('88', '49');
INSERT INTO `produits_producteurs` VALUES ('89', '49');
INSERT INTO `produits_producteurs` VALUES ('90', '75');
INSERT INTO `produits_producteurs` VALUES ('91', '75');
INSERT INTO `produits_producteurs` VALUES ('92', '13');
INSERT INTO `produits_producteurs` VALUES ('93', '13');
INSERT INTO `produits_producteurs` VALUES ('94', '36');
INSERT INTO `produits_producteurs` VALUES ('95', '36');
INSERT INTO `produits_producteurs` VALUES ('96', '36');
INSERT INTO `produits_producteurs` VALUES ('97', '36');
INSERT INTO `produits_producteurs` VALUES ('98', '36');
INSERT INTO `produits_producteurs` VALUES ('99', '36');
INSERT INTO `produits_producteurs` VALUES ('100', '36');
INSERT INTO `produits_producteurs` VALUES ('101', '36');
INSERT INTO `produits_producteurs` VALUES ('101', '51');
INSERT INTO `produits_producteurs` VALUES ('102', '36');
INSERT INTO `produits_producteurs` VALUES ('103', '100');
INSERT INTO `produits_producteurs` VALUES ('104', '100');
INSERT INTO `produits_producteurs` VALUES ('105', '100');
INSERT INTO `produits_producteurs` VALUES ('106', '13');
INSERT INTO `produits_producteurs` VALUES ('106', '112');
INSERT INTO `produits_producteurs` VALUES ('107', '13');
INSERT INTO `produits_producteurs` VALUES ('107', '112');
INSERT INTO `produits_producteurs` VALUES ('108', '55');
INSERT INTO `produits_producteurs` VALUES ('109', '55');
INSERT INTO `produits_producteurs` VALUES ('110', '36');
INSERT INTO `produits_producteurs` VALUES ('110', '48');
INSERT INTO `produits_producteurs` VALUES ('110', '51');
INSERT INTO `produits_producteurs` VALUES ('110', '56');
INSERT INTO `produits_producteurs` VALUES ('111', '36');
INSERT INTO `produits_producteurs` VALUES ('112', '13');
INSERT INTO `produits_producteurs` VALUES ('113', '13');
INSERT INTO `produits_producteurs` VALUES ('114', '72');
INSERT INTO `produits_producteurs` VALUES ('115', '13');
INSERT INTO `produits_producteurs` VALUES ('116', '55');
INSERT INTO `produits_producteurs` VALUES ('116', '72');
INSERT INTO `produits_producteurs` VALUES ('116', '100');
INSERT INTO `produits_producteurs` VALUES ('117', '56');
INSERT INTO `produits_producteurs` VALUES ('117', '100');
INSERT INTO `produits_producteurs` VALUES ('118', '72');
INSERT INTO `produits_producteurs` VALUES ('119', '55');
INSERT INTO `produits_producteurs` VALUES ('119', '56');
INSERT INTO `produits_producteurs` VALUES ('119', '100');
INSERT INTO `produits_producteurs` VALUES ('119', '112');
INSERT INTO `produits_producteurs` VALUES ('120', '55');
INSERT INTO `produits_producteurs` VALUES ('120', '100');
INSERT INTO `produits_producteurs` VALUES ('121', '55');
INSERT INTO `produits_producteurs` VALUES ('121', '72');
INSERT INTO `produits_producteurs` VALUES ('121', '100');
INSERT INTO `produits_producteurs` VALUES ('122', '55');
INSERT INTO `produits_producteurs` VALUES ('122', '100');
INSERT INTO `produits_producteurs` VALUES ('123', '112');
INSERT INTO `produits_producteurs` VALUES ('124', '112');
INSERT INTO `produits_producteurs` VALUES ('125', '55');
INSERT INTO `produits_producteurs` VALUES ('126', '55');
INSERT INTO `produits_producteurs` VALUES ('127', '55');
INSERT INTO `produits_producteurs` VALUES ('128', '55');
INSERT INTO `produits_producteurs` VALUES ('129', '55');
INSERT INTO `produits_producteurs` VALUES ('130', '55');
INSERT INTO `produits_producteurs` VALUES ('131', '55');
INSERT INTO `produits_producteurs` VALUES ('132', '55');
INSERT INTO `produits_producteurs` VALUES ('133', '55');
INSERT INTO `produits_producteurs` VALUES ('133', '56');
INSERT INTO `produits_producteurs` VALUES ('133', '112');
INSERT INTO `produits_producteurs` VALUES ('134', '55');
INSERT INTO `produits_producteurs` VALUES ('135', '55');
INSERT INTO `produits_producteurs` VALUES ('135', '56');
INSERT INTO `produits_producteurs` VALUES ('135', '72');
INSERT INTO `produits_producteurs` VALUES ('136', '55');
INSERT INTO `produits_producteurs` VALUES ('137', '55');
INSERT INTO `produits_producteurs` VALUES ('137', '56');
INSERT INTO `produits_producteurs` VALUES ('137', '72');
INSERT INTO `produits_producteurs` VALUES ('138', '55');
INSERT INTO `produits_producteurs` VALUES ('139', '56');
INSERT INTO `produits_producteurs` VALUES ('140', '56');
INSERT INTO `produits_producteurs` VALUES ('141', '56');
INSERT INTO `produits_producteurs` VALUES ('142', '55');
INSERT INTO `produits_producteurs` VALUES ('143', '56');
INSERT INTO `produits_producteurs` VALUES ('144', '56');
INSERT INTO `produits_producteurs` VALUES ('144', '64');
INSERT INTO `produits_producteurs` VALUES ('145', '64');
INSERT INTO `produits_producteurs` VALUES ('146', '56');
INSERT INTO `produits_producteurs` VALUES ('147', '56');
INSERT INTO `produits_producteurs` VALUES ('148', '56');
INSERT INTO `produits_producteurs` VALUES ('149', '76');
INSERT INTO `produits_producteurs` VALUES ('150', '56');
INSERT INTO `produits_producteurs` VALUES ('151', '76');
INSERT INTO `produits_producteurs` VALUES ('152', '55');
INSERT INTO `produits_producteurs` VALUES ('153', '55');
INSERT INTO `produits_producteurs` VALUES ('154', '76');
INSERT INTO `produits_producteurs` VALUES ('155', '56');
INSERT INTO `produits_producteurs` VALUES ('156', '76');
INSERT INTO `produits_producteurs` VALUES ('157', '112');
INSERT INTO `produits_producteurs` VALUES ('158', '22');
INSERT INTO `produits_producteurs` VALUES ('159', '22');
INSERT INTO `produits_producteurs` VALUES ('160', '36');
INSERT INTO `produits_producteurs` VALUES ('160', '52');
INSERT INTO `produits_producteurs` VALUES ('160', '56');
INSERT INTO `produits_producteurs` VALUES ('160', '112');
INSERT INTO `produits_producteurs` VALUES ('161', '22');
INSERT INTO `produits_producteurs` VALUES ('161', '36');
INSERT INTO `produits_producteurs` VALUES ('162', '52');
INSERT INTO `produits_producteurs` VALUES ('163', '52');
INSERT INTO `produits_producteurs` VALUES ('164', '36');
INSERT INTO `produits_producteurs` VALUES ('164', '52');
INSERT INTO `produits_producteurs` VALUES ('164', '56');
INSERT INTO `produits_producteurs` VALUES ('164', '112');
INSERT INTO `produits_producteurs` VALUES ('165', '22');
INSERT INTO `produits_producteurs` VALUES ('165', '36');
INSERT INTO `produits_producteurs` VALUES ('166', '13');
INSERT INTO `produits_producteurs` VALUES ('166', '36');
INSERT INTO `produits_producteurs` VALUES ('167', '13');
INSERT INTO `produits_producteurs` VALUES ('167', '36');
INSERT INTO `produits_producteurs` VALUES ('168', '13');
INSERT INTO `produits_producteurs` VALUES ('168', '36');
INSERT INTO `produits_producteurs` VALUES ('168', '52');
INSERT INTO `produits_producteurs` VALUES ('168', '56');
INSERT INTO `produits_producteurs` VALUES ('168', '95');
INSERT INTO `produits_producteurs` VALUES ('168', '96');
INSERT INTO `produits_producteurs` VALUES ('168', '112');
INSERT INTO `produits_producteurs` VALUES ('169', '13');
INSERT INTO `produits_producteurs` VALUES ('169', '36');
INSERT INTO `produits_producteurs` VALUES ('169', '52');
INSERT INTO `produits_producteurs` VALUES ('169', '56');
INSERT INTO `produits_producteurs` VALUES ('169', '95');
INSERT INTO `produits_producteurs` VALUES ('169', '96');
INSERT INTO `produits_producteurs` VALUES ('169', '112');
INSERT INTO `produits_producteurs` VALUES ('170', '48');
INSERT INTO `produits_producteurs` VALUES ('171', '13');
INSERT INTO `produits_producteurs` VALUES ('172', '13');
INSERT INTO `produits_producteurs` VALUES ('173', '100');
INSERT INTO `produits_producteurs` VALUES ('174', '36');
INSERT INTO `produits_producteurs` VALUES ('174', '52');
INSERT INTO `produits_producteurs` VALUES ('174', '100');
INSERT INTO `produits_producteurs` VALUES ('175', '52');
INSERT INTO `produits_producteurs` VALUES ('175', '100');
INSERT INTO `produits_producteurs` VALUES ('176', '13');
INSERT INTO `produits_producteurs` VALUES ('176', '36');
INSERT INTO `produits_producteurs` VALUES ('176', '51');
INSERT INTO `produits_producteurs` VALUES ('176', '52');
INSERT INTO `produits_producteurs` VALUES ('176', '56');
INSERT INTO `produits_producteurs` VALUES ('176', '95');
INSERT INTO `produits_producteurs` VALUES ('176', '112');
INSERT INTO `produits_producteurs` VALUES ('177', '13');
INSERT INTO `produits_producteurs` VALUES ('177', '52');
INSERT INTO `produits_producteurs` VALUES ('177', '56');
INSERT INTO `produits_producteurs` VALUES ('177', '95');
INSERT INTO `produits_producteurs` VALUES ('177', '112');
INSERT INTO `produits_producteurs` VALUES ('178', '100');
INSERT INTO `produits_producteurs` VALUES ('179', '100');
INSERT INTO `produits_producteurs` VALUES ('180', '100');
INSERT INTO `produits_producteurs` VALUES ('181', '36');
INSERT INTO `produits_producteurs` VALUES ('182', '36');
INSERT INTO `produits_producteurs` VALUES ('182', '96');
INSERT INTO `produits_producteurs` VALUES ('183', '36');
INSERT INTO `produits_producteurs` VALUES ('184', '36');
INSERT INTO `produits_producteurs` VALUES ('185', '36');
INSERT INTO `produits_producteurs` VALUES ('186', '36');
INSERT INTO `produits_producteurs` VALUES ('186', '72');
INSERT INTO `produits_producteurs` VALUES ('187', '100');
INSERT INTO `produits_producteurs` VALUES ('187', '112');
INSERT INTO `produits_producteurs` VALUES ('188', '100');
INSERT INTO `produits_producteurs` VALUES ('189', '96');
INSERT INTO `produits_producteurs` VALUES ('189', '100');
INSERT INTO `produits_producteurs` VALUES ('189', '112');
INSERT INTO `produits_producteurs` VALUES ('190', '100');
INSERT INTO `produits_producteurs` VALUES ('191', '100');
INSERT INTO `produits_producteurs` VALUES ('192', '36');
INSERT INTO `produits_producteurs` VALUES ('192', '100');
INSERT INTO `produits_producteurs` VALUES ('193', '36');
INSERT INTO `produits_producteurs` VALUES ('193', '72');
INSERT INTO `produits_producteurs` VALUES ('193', '100');
INSERT INTO `produits_producteurs` VALUES ('194', '72');
INSERT INTO `produits_producteurs` VALUES ('195', '36');
INSERT INTO `produits_producteurs` VALUES ('196', '36');
INSERT INTO `produits_producteurs` VALUES ('197', '52');
INSERT INTO `produits_producteurs` VALUES ('198', '36');
INSERT INTO `produits_producteurs` VALUES ('199', '36');
INSERT INTO `produits_producteurs` VALUES ('200', '52');
INSERT INTO `produits_producteurs` VALUES ('201', '36');
INSERT INTO `produits_producteurs` VALUES ('202', '36');
INSERT INTO `produits_producteurs` VALUES ('203', '36');
INSERT INTO `produits_producteurs` VALUES ('204', '36');
INSERT INTO `produits_producteurs` VALUES ('205', '52');
INSERT INTO `produits_producteurs` VALUES ('206', '112');
INSERT INTO `produits_producteurs` VALUES ('207', '112');
INSERT INTO `produits_producteurs` VALUES ('208', '110');
INSERT INTO `produits_producteurs` VALUES ('209', '110');
INSERT INTO `produits_producteurs` VALUES ('210', '110');
INSERT INTO `produits_producteurs` VALUES ('211', '110');
INSERT INTO `produits_producteurs` VALUES ('212', '110');
INSERT INTO `produits_producteurs` VALUES ('213', '110');
INSERT INTO `produits_producteurs` VALUES ('214', '110');
INSERT INTO `produits_producteurs` VALUES ('215', '110');
INSERT INTO `produits_producteurs` VALUES ('216', '110');
INSERT INTO `produits_producteurs` VALUES ('217', '110');
INSERT INTO `produits_producteurs` VALUES ('218', '110');
INSERT INTO `produits_producteurs` VALUES ('219', '110');
INSERT INTO `produits_producteurs` VALUES ('220', '110');
INSERT INTO `produits_producteurs` VALUES ('221', '110');
INSERT INTO `produits_producteurs` VALUES ('222', '92');
INSERT INTO `produits_producteurs` VALUES ('223', '92');
INSERT INTO `produits_producteurs` VALUES ('224', '92');
INSERT INTO `produits_producteurs` VALUES ('225', '92');
INSERT INTO `produits_producteurs` VALUES ('226', '8');
INSERT INTO `produits_producteurs` VALUES ('227', '8');
INSERT INTO `produits_producteurs` VALUES ('228', '8');
INSERT INTO `produits_producteurs` VALUES ('229', '92');
INSERT INTO `produits_producteurs` VALUES ('230', '92');
INSERT INTO `produits_producteurs` VALUES ('231', '8');
INSERT INTO `produits_producteurs` VALUES ('232', '8');
INSERT INTO `produits_producteurs` VALUES ('233', '8');
INSERT INTO `produits_producteurs` VALUES ('234', '8');
INSERT INTO `produits_producteurs` VALUES ('235', '65');
INSERT INTO `produits_producteurs` VALUES ('236', '65');
INSERT INTO `produits_producteurs` VALUES ('237', '65');
INSERT INTO `produits_producteurs` VALUES ('238', '65');
INSERT INTO `produits_producteurs` VALUES ('239', '65');
INSERT INTO `produits_producteurs` VALUES ('240', '65');
INSERT INTO `produits_producteurs` VALUES ('241', '65');
INSERT INTO `produits_producteurs` VALUES ('242', '65');
INSERT INTO `produits_producteurs` VALUES ('243', '65');
INSERT INTO `produits_producteurs` VALUES ('244', '65');
INSERT INTO `produits_producteurs` VALUES ('245', '65');
INSERT INTO `produits_producteurs` VALUES ('246', '66');
INSERT INTO `produits_producteurs` VALUES ('247', '66');
INSERT INTO `produits_producteurs` VALUES ('248', '66');
INSERT INTO `produits_producteurs` VALUES ('249', '66');
INSERT INTO `produits_producteurs` VALUES ('250', '66');
INSERT INTO `produits_producteurs` VALUES ('251', '66');
INSERT INTO `produits_producteurs` VALUES ('252', '66');
INSERT INTO `produits_producteurs` VALUES ('253', '66');
INSERT INTO `produits_producteurs` VALUES ('254', '66');
INSERT INTO `produits_producteurs` VALUES ('255', '66');
INSERT INTO `produits_producteurs` VALUES ('256', '66');
INSERT INTO `produits_producteurs` VALUES ('257', '66');
INSERT INTO `produits_producteurs` VALUES ('258', '66');
INSERT INTO `produits_producteurs` VALUES ('259', '66');
INSERT INTO `produits_producteurs` VALUES ('260', '66');
INSERT INTO `produits_producteurs` VALUES ('261', '66');
INSERT INTO `produits_producteurs` VALUES ('262', '66');
INSERT INTO `produits_producteurs` VALUES ('263', '66');
INSERT INTO `produits_producteurs` VALUES ('264', '66');
INSERT INTO `produits_producteurs` VALUES ('265', '66');
INSERT INTO `produits_producteurs` VALUES ('266', '66');
INSERT INTO `produits_producteurs` VALUES ('267', '54');
INSERT INTO `produits_producteurs` VALUES ('268', '54');
INSERT INTO `produits_producteurs` VALUES ('269', '54');
INSERT INTO `produits_producteurs` VALUES ('270', '54');
INSERT INTO `produits_producteurs` VALUES ('271', '54');
INSERT INTO `produits_producteurs` VALUES ('272', '88');
INSERT INTO `produits_producteurs` VALUES ('273', '88');
INSERT INTO `produits_producteurs` VALUES ('274', '88');
INSERT INTO `produits_producteurs` VALUES ('275', '88');
INSERT INTO `produits_producteurs` VALUES ('276', '88');
INSERT INTO `produits_producteurs` VALUES ('277', '88');
INSERT INTO `produits_producteurs` VALUES ('278', '88');
INSERT INTO `produits_producteurs` VALUES ('279', '88');
INSERT INTO `produits_producteurs` VALUES ('280', '54');
INSERT INTO `produits_producteurs` VALUES ('281', '88');
INSERT INTO `produits_producteurs` VALUES ('282', '88');
INSERT INTO `produits_producteurs` VALUES ('283', '54');
INSERT INTO `produits_producteurs` VALUES ('284', '88');
INSERT INTO `produits_producteurs` VALUES ('285', '112');
INSERT INTO `produits_producteurs` VALUES ('286', '88');
INSERT INTO `produits_producteurs` VALUES ('287', '112');
INSERT INTO `produits_producteurs` VALUES ('288', '88');
INSERT INTO `produits_producteurs` VALUES ('289', '112');
INSERT INTO `produits_producteurs` VALUES ('290', '54');
INSERT INTO `produits_producteurs` VALUES ('291', '88');
INSERT INTO `produits_producteurs` VALUES ('292', '54');
INSERT INTO `produits_producteurs` VALUES ('293', '88');
INSERT INTO `produits_producteurs` VALUES ('294', '88');
INSERT INTO `produits_producteurs` VALUES ('295', '88');
INSERT INTO `produits_producteurs` VALUES ('296', '88');
INSERT INTO `produits_producteurs` VALUES ('297', '88');
INSERT INTO `produits_producteurs` VALUES ('298', '88');
INSERT INTO `produits_producteurs` VALUES ('299', '54');
INSERT INTO `produits_producteurs` VALUES ('300', '88');
INSERT INTO `produits_producteurs` VALUES ('301', '88');
INSERT INTO `produits_producteurs` VALUES ('302', '88');
INSERT INTO `produits_producteurs` VALUES ('303', '54');
INSERT INTO `produits_producteurs` VALUES ('304', '54');
INSERT INTO `produits_producteurs` VALUES ('305', '88');
INSERT INTO `produits_producteurs` VALUES ('306', '88');
INSERT INTO `produits_producteurs` VALUES ('307', '88');
INSERT INTO `produits_producteurs` VALUES ('308', '88');
INSERT INTO `produits_producteurs` VALUES ('309', '88');
INSERT INTO `produits_producteurs` VALUES ('310', '88');
INSERT INTO `produits_producteurs` VALUES ('311', '88');
INSERT INTO `produits_producteurs` VALUES ('312', '88');
INSERT INTO `produits_producteurs` VALUES ('313', '54');
INSERT INTO `produits_producteurs` VALUES ('314', '88');
INSERT INTO `produits_producteurs` VALUES ('315', '88');
INSERT INTO `produits_producteurs` VALUES ('316', '88');
INSERT INTO `produits_producteurs` VALUES ('317', '88');
INSERT INTO `produits_producteurs` VALUES ('318', '88');
INSERT INTO `produits_producteurs` VALUES ('319', '88');
INSERT INTO `produits_producteurs` VALUES ('320', '88');
INSERT INTO `produits_producteurs` VALUES ('321', '112');
INSERT INTO `produits_producteurs` VALUES ('322', '88');
INSERT INTO `produits_producteurs` VALUES ('323', '88');
INSERT INTO `produits_producteurs` VALUES ('324', '88');
INSERT INTO `produits_producteurs` VALUES ('325', '112');
INSERT INTO `produits_producteurs` VALUES ('326', '88');
INSERT INTO `produits_producteurs` VALUES ('327', '88');
INSERT INTO `produits_producteurs` VALUES ('328', '88');
INSERT INTO `produits_producteurs` VALUES ('329', '88');
INSERT INTO `produits_producteurs` VALUES ('330', '88');
INSERT INTO `produits_producteurs` VALUES ('331', '112');
INSERT INTO `produits_producteurs` VALUES ('332', '54');
INSERT INTO `produits_producteurs` VALUES ('333', '88');
INSERT INTO `produits_producteurs` VALUES ('334', '88');
INSERT INTO `produits_producteurs` VALUES ('335', '88');
INSERT INTO `produits_producteurs` VALUES ('336', '88');
INSERT INTO `produits_producteurs` VALUES ('337', '88');
INSERT INTO `produits_producteurs` VALUES ('338', '88');
INSERT INTO `produits_producteurs` VALUES ('339', '88');
INSERT INTO `produits_producteurs` VALUES ('340', '88');
INSERT INTO `produits_producteurs` VALUES ('341', '88');
INSERT INTO `produits_producteurs` VALUES ('342', '88');
INSERT INTO `produits_producteurs` VALUES ('343', '88');
INSERT INTO `produits_producteurs` VALUES ('344', '54');
INSERT INTO `produits_producteurs` VALUES ('344', '88');
INSERT INTO `produits_producteurs` VALUES ('345', '54');
INSERT INTO `produits_producteurs` VALUES ('345', '88');
INSERT INTO `produits_producteurs` VALUES ('346', '88');
INSERT INTO `produits_producteurs` VALUES ('347', '88');
INSERT INTO `produits_producteurs` VALUES ('348', '88');
INSERT INTO `produits_producteurs` VALUES ('349', '73');
INSERT INTO `produits_producteurs` VALUES ('350', '54');
INSERT INTO `produits_producteurs` VALUES ('351', '88');
INSERT INTO `produits_producteurs` VALUES ('352', '88');
INSERT INTO `produits_producteurs` VALUES ('353', '88');
INSERT INTO `produits_producteurs` VALUES ('354', '73');
INSERT INTO `produits_producteurs` VALUES ('355', '73');
INSERT INTO `produits_producteurs` VALUES ('356', '54');
INSERT INTO `produits_producteurs` VALUES ('356', '73');
INSERT INTO `produits_producteurs` VALUES ('357', '88');
INSERT INTO `produits_producteurs` VALUES ('358', '88');
INSERT INTO `produits_producteurs` VALUES ('359', '88');
INSERT INTO `produits_producteurs` VALUES ('360', '88');
INSERT INTO `produits_producteurs` VALUES ('361', '88');
INSERT INTO `produits_producteurs` VALUES ('362', '88');
INSERT INTO `produits_producteurs` VALUES ('363', '88');
INSERT INTO `produits_producteurs` VALUES ('364', '88');
INSERT INTO `produits_producteurs` VALUES ('365', '88');
INSERT INTO `produits_producteurs` VALUES ('366', '88');
INSERT INTO `produits_producteurs` VALUES ('367', '88');
INSERT INTO `produits_producteurs` VALUES ('368', '88');
INSERT INTO `produits_producteurs` VALUES ('369', '62');
INSERT INTO `produits_producteurs` VALUES ('370', '62');
INSERT INTO `produits_producteurs` VALUES ('371', '62');
INSERT INTO `produits_producteurs` VALUES ('372', '62');
INSERT INTO `produits_producteurs` VALUES ('373', '62');
INSERT INTO `produits_producteurs` VALUES ('374', '94');
INSERT INTO `produits_producteurs` VALUES ('375', '94');
INSERT INTO `produits_producteurs` VALUES ('376', '94');
INSERT INTO `produits_producteurs` VALUES ('377', '94');
INSERT INTO `produits_producteurs` VALUES ('378', '95');
INSERT INTO `produits_producteurs` VALUES ('379', '95');
INSERT INTO `produits_producteurs` VALUES ('380', '109');
INSERT INTO `produits_producteurs` VALUES ('381', '109');
INSERT INTO `produits_producteurs` VALUES ('382', '109');
INSERT INTO `produits_producteurs` VALUES ('383', '109');
INSERT INTO `produits_producteurs` VALUES ('384', '109');
INSERT INTO `produits_producteurs` VALUES ('385', '89');
INSERT INTO `produits_producteurs` VALUES ('386', '89');
INSERT INTO `produits_producteurs` VALUES ('387', '89');
INSERT INTO `produits_producteurs` VALUES ('388', '89');
INSERT INTO `produits_producteurs` VALUES ('389', '89');
INSERT INTO `produits_producteurs` VALUES ('390', '89');
INSERT INTO `produits_producteurs` VALUES ('391', '89');
INSERT INTO `produits_producteurs` VALUES ('392', '89');
INSERT INTO `produits_producteurs` VALUES ('393', '89');
INSERT INTO `produits_producteurs` VALUES ('394', '89');
INSERT INTO `produits_producteurs` VALUES ('395', '89');
INSERT INTO `produits_producteurs` VALUES ('396', '89');
INSERT INTO `produits_producteurs` VALUES ('397', '89');
INSERT INTO `produits_producteurs` VALUES ('398', '89');
INSERT INTO `produits_producteurs` VALUES ('399', '89');
INSERT INTO `produits_producteurs` VALUES ('400', '89');
INSERT INTO `produits_producteurs` VALUES ('401', '89');
INSERT INTO `produits_producteurs` VALUES ('402', '89');
INSERT INTO `produits_producteurs` VALUES ('403', '89');
INSERT INTO `produits_producteurs` VALUES ('404', '89');
INSERT INTO `produits_producteurs` VALUES ('405', '89');
INSERT INTO `produits_producteurs` VALUES ('406', '89');
INSERT INTO `produits_producteurs` VALUES ('407', '89');
INSERT INTO `produits_producteurs` VALUES ('408', '89');
INSERT INTO `produits_producteurs` VALUES ('409', '89');
INSERT INTO `produits_producteurs` VALUES ('410', '89');
INSERT INTO `produits_producteurs` VALUES ('411', '89');
INSERT INTO `produits_producteurs` VALUES ('412', '89');
INSERT INTO `produits_producteurs` VALUES ('413', '89');
INSERT INTO `produits_producteurs` VALUES ('414', '89');
INSERT INTO `produits_producteurs` VALUES ('415', '89');
INSERT INTO `produits_producteurs` VALUES ('416', '89');
INSERT INTO `produits_producteurs` VALUES ('417', '89');
INSERT INTO `produits_producteurs` VALUES ('418', '89');
INSERT INTO `produits_producteurs` VALUES ('419', '89');
INSERT INTO `produits_producteurs` VALUES ('420', '89');
INSERT INTO `produits_producteurs` VALUES ('421', '89');
INSERT INTO `produits_producteurs` VALUES ('422', '89');
INSERT INTO `produits_producteurs` VALUES ('423', '89');
INSERT INTO `produits_producteurs` VALUES ('424', '89');
INSERT INTO `produits_producteurs` VALUES ('425', '89');
INSERT INTO `produits_producteurs` VALUES ('426', '89');
INSERT INTO `produits_producteurs` VALUES ('427', '89');
INSERT INTO `produits_producteurs` VALUES ('428', '89');
INSERT INTO `produits_producteurs` VALUES ('429', '89');
INSERT INTO `produits_producteurs` VALUES ('430', '89');
INSERT INTO `produits_producteurs` VALUES ('431', '89');
INSERT INTO `produits_producteurs` VALUES ('432', '89');
INSERT INTO `produits_producteurs` VALUES ('433', '89');
INSERT INTO `produits_producteurs` VALUES ('434', '89');
INSERT INTO `produits_producteurs` VALUES ('435', '89');
INSERT INTO `produits_producteurs` VALUES ('436', '89');
INSERT INTO `produits_producteurs` VALUES ('437', '89');
INSERT INTO `produits_producteurs` VALUES ('438', '89');
INSERT INTO `produits_producteurs` VALUES ('439', '89');
INSERT INTO `produits_producteurs` VALUES ('440', '89');
INSERT INTO `produits_producteurs` VALUES ('441', '89');
INSERT INTO `produits_producteurs` VALUES ('442', '89');
INSERT INTO `produits_producteurs` VALUES ('443', '89');
INSERT INTO `produits_producteurs` VALUES ('444', '89');
INSERT INTO `produits_producteurs` VALUES ('445', '89');
INSERT INTO `produits_producteurs` VALUES ('446', '89');
INSERT INTO `produits_producteurs` VALUES ('447', '89');
INSERT INTO `produits_producteurs` VALUES ('448', '89');
INSERT INTO `produits_producteurs` VALUES ('449', '89');
INSERT INTO `produits_producteurs` VALUES ('450', '89');
INSERT INTO `produits_producteurs` VALUES ('451', '89');
INSERT INTO `produits_producteurs` VALUES ('452', '89');
INSERT INTO `produits_producteurs` VALUES ('453', '89');
INSERT INTO `produits_producteurs` VALUES ('454', '89');
INSERT INTO `produits_producteurs` VALUES ('455', '89');
INSERT INTO `produits_producteurs` VALUES ('456', '89');
INSERT INTO `produits_producteurs` VALUES ('457', '89');
INSERT INTO `produits_producteurs` VALUES ('458', '89');
INSERT INTO `produits_producteurs` VALUES ('459', '89');
INSERT INTO `produits_producteurs` VALUES ('460', '89');
INSERT INTO `produits_producteurs` VALUES ('461', '89');
INSERT INTO `produits_producteurs` VALUES ('462', '89');
INSERT INTO `produits_producteurs` VALUES ('463', '89');
INSERT INTO `produits_producteurs` VALUES ('464', '89');
INSERT INTO `produits_producteurs` VALUES ('465', '89');
INSERT INTO `produits_producteurs` VALUES ('466', '89');
INSERT INTO `produits_producteurs` VALUES ('467', '89');
INSERT INTO `produits_producteurs` VALUES ('468', '89');
INSERT INTO `produits_producteurs` VALUES ('469', '89');
INSERT INTO `produits_producteurs` VALUES ('470', '89');
INSERT INTO `produits_producteurs` VALUES ('471', '89');
INSERT INTO `produits_producteurs` VALUES ('472', '89');
INSERT INTO `produits_producteurs` VALUES ('473', '89');
INSERT INTO `produits_producteurs` VALUES ('474', '89');
INSERT INTO `produits_producteurs` VALUES ('475', '89');
INSERT INTO `produits_producteurs` VALUES ('476', '89');
INSERT INTO `produits_producteurs` VALUES ('477', '89');
INSERT INTO `produits_producteurs` VALUES ('478', '89');
INSERT INTO `produits_producteurs` VALUES ('479', '89');
INSERT INTO `produits_producteurs` VALUES ('480', '89');
INSERT INTO `produits_producteurs` VALUES ('481', '89');
INSERT INTO `produits_producteurs` VALUES ('482', '89');
INSERT INTO `produits_producteurs` VALUES ('483', '89');
INSERT INTO `produits_producteurs` VALUES ('484', '89');
INSERT INTO `produits_producteurs` VALUES ('485', '89');
INSERT INTO `produits_producteurs` VALUES ('486', '89');
INSERT INTO `produits_producteurs` VALUES ('487', '89');
INSERT INTO `produits_producteurs` VALUES ('488', '89');
INSERT INTO `produits_producteurs` VALUES ('489', '89');
INSERT INTO `produits_producteurs` VALUES ('490', '89');
INSERT INTO `produits_producteurs` VALUES ('491', '89');
INSERT INTO `produits_producteurs` VALUES ('492', '89');
INSERT INTO `produits_producteurs` VALUES ('493', '89');
INSERT INTO `produits_producteurs` VALUES ('494', '89');
INSERT INTO `produits_producteurs` VALUES ('495', '89');
INSERT INTO `produits_producteurs` VALUES ('496', '89');
INSERT INTO `produits_producteurs` VALUES ('497', '89');
INSERT INTO `produits_producteurs` VALUES ('498', '89');
INSERT INTO `produits_producteurs` VALUES ('499', '89');
INSERT INTO `produits_producteurs` VALUES ('500', '89');
INSERT INTO `produits_producteurs` VALUES ('501', '89');
INSERT INTO `produits_producteurs` VALUES ('502', '89');
INSERT INTO `produits_producteurs` VALUES ('503', '89');
INSERT INTO `produits_producteurs` VALUES ('504', '89');
INSERT INTO `produits_producteurs` VALUES ('505', '89');
INSERT INTO `produits_producteurs` VALUES ('506', '89');
INSERT INTO `produits_producteurs` VALUES ('507', '89');
INSERT INTO `produits_producteurs` VALUES ('508', '89');
INSERT INTO `produits_producteurs` VALUES ('509', '89');
INSERT INTO `produits_producteurs` VALUES ('510', '89');
INSERT INTO `produits_producteurs` VALUES ('511', '89');
INSERT INTO `produits_producteurs` VALUES ('512', '89');
INSERT INTO `produits_producteurs` VALUES ('513', '89');
INSERT INTO `produits_producteurs` VALUES ('514', '89');
INSERT INTO `produits_producteurs` VALUES ('515', '89');
INSERT INTO `produits_producteurs` VALUES ('516', '89');
INSERT INTO `produits_producteurs` VALUES ('517', '89');
INSERT INTO `produits_producteurs` VALUES ('518', '89');
INSERT INTO `produits_producteurs` VALUES ('519', '89');
INSERT INTO `produits_producteurs` VALUES ('520', '89');
INSERT INTO `produits_producteurs` VALUES ('521', '89');
INSERT INTO `produits_producteurs` VALUES ('522', '89');
INSERT INTO `produits_producteurs` VALUES ('523', '89');
INSERT INTO `produits_producteurs` VALUES ('524', '89');
INSERT INTO `produits_producteurs` VALUES ('525', '89');
INSERT INTO `produits_producteurs` VALUES ('526', '89');
INSERT INTO `produits_producteurs` VALUES ('527', '89');
INSERT INTO `produits_producteurs` VALUES ('528', '89');
INSERT INTO `produits_producteurs` VALUES ('529', '89');
INSERT INTO `produits_producteurs` VALUES ('530', '89');
INSERT INTO `produits_producteurs` VALUES ('531', '89');
INSERT INTO `produits_producteurs` VALUES ('532', '89');
INSERT INTO `produits_producteurs` VALUES ('533', '89');
INSERT INTO `produits_producteurs` VALUES ('534', '89');
INSERT INTO `produits_producteurs` VALUES ('535', '89');
INSERT INTO `produits_producteurs` VALUES ('536', '89');
INSERT INTO `produits_producteurs` VALUES ('537', '89');
INSERT INTO `produits_producteurs` VALUES ('538', '89');
INSERT INTO `produits_producteurs` VALUES ('539', '89');
INSERT INTO `produits_producteurs` VALUES ('540', '89');
INSERT INTO `produits_producteurs` VALUES ('541', '89');
INSERT INTO `produits_producteurs` VALUES ('542', '89');
INSERT INTO `produits_producteurs` VALUES ('543', '89');
INSERT INTO `produits_producteurs` VALUES ('544', '89');
INSERT INTO `produits_producteurs` VALUES ('545', '89');
INSERT INTO `produits_producteurs` VALUES ('546', '89');
INSERT INTO `produits_producteurs` VALUES ('547', '89');
INSERT INTO `produits_producteurs` VALUES ('548', '89');
INSERT INTO `produits_producteurs` VALUES ('549', '89');
INSERT INTO `produits_producteurs` VALUES ('550', '89');
INSERT INTO `produits_producteurs` VALUES ('551', '89');
INSERT INTO `produits_producteurs` VALUES ('552', '89');
INSERT INTO `produits_producteurs` VALUES ('553', '89');
INSERT INTO `produits_producteurs` VALUES ('554', '89');
INSERT INTO `produits_producteurs` VALUES ('555', '89');
INSERT INTO `produits_producteurs` VALUES ('556', '89');
INSERT INTO `produits_producteurs` VALUES ('557', '89');
INSERT INTO `produits_producteurs` VALUES ('558', '89');
INSERT INTO `produits_producteurs` VALUES ('559', '89');
INSERT INTO `produits_producteurs` VALUES ('560', '89');
INSERT INTO `produits_producteurs` VALUES ('561', '89');
INSERT INTO `produits_producteurs` VALUES ('562', '89');
INSERT INTO `produits_producteurs` VALUES ('563', '89');
INSERT INTO `produits_producteurs` VALUES ('564', '89');
INSERT INTO `produits_producteurs` VALUES ('565', '89');
INSERT INTO `produits_producteurs` VALUES ('566', '89');
INSERT INTO `produits_producteurs` VALUES ('567', '89');
INSERT INTO `produits_producteurs` VALUES ('568', '89');
INSERT INTO `produits_producteurs` VALUES ('569', '89');
INSERT INTO `produits_producteurs` VALUES ('570', '89');
INSERT INTO `produits_producteurs` VALUES ('571', '89');
INSERT INTO `produits_producteurs` VALUES ('572', '89');
INSERT INTO `produits_producteurs` VALUES ('573', '89');
INSERT INTO `produits_producteurs` VALUES ('574', '89');
INSERT INTO `produits_producteurs` VALUES ('575', '89');
INSERT INTO `produits_producteurs` VALUES ('576', '89');
INSERT INTO `produits_producteurs` VALUES ('577', '89');
INSERT INTO `produits_producteurs` VALUES ('578', '89');
INSERT INTO `produits_producteurs` VALUES ('579', '89');
INSERT INTO `produits_producteurs` VALUES ('580', '89');
INSERT INTO `produits_producteurs` VALUES ('581', '89');
INSERT INTO `produits_producteurs` VALUES ('582', '89');
INSERT INTO `produits_producteurs` VALUES ('583', '89');
INSERT INTO `produits_producteurs` VALUES ('584', '89');
INSERT INTO `produits_producteurs` VALUES ('585', '89');
INSERT INTO `produits_producteurs` VALUES ('586', '89');
INSERT INTO `produits_producteurs` VALUES ('587', '89');
INSERT INTO `produits_producteurs` VALUES ('588', '89');
INSERT INTO `produits_producteurs` VALUES ('589', '89');
INSERT INTO `produits_producteurs` VALUES ('590', '89');
INSERT INTO `produits_producteurs` VALUES ('591', '89');
INSERT INTO `produits_producteurs` VALUES ('592', '89');
INSERT INTO `produits_producteurs` VALUES ('593', '89');
INSERT INTO `produits_producteurs` VALUES ('594', '89');
INSERT INTO `produits_producteurs` VALUES ('595', '89');
INSERT INTO `produits_producteurs` VALUES ('596', '89');
INSERT INTO `produits_producteurs` VALUES ('597', '89');
INSERT INTO `produits_producteurs` VALUES ('598', '89');
INSERT INTO `produits_producteurs` VALUES ('599', '89');
INSERT INTO `produits_producteurs` VALUES ('600', '89');
INSERT INTO `produits_producteurs` VALUES ('601', '89');
INSERT INTO `produits_producteurs` VALUES ('602', '89');
INSERT INTO `produits_producteurs` VALUES ('603', '89');
INSERT INTO `produits_producteurs` VALUES ('604', '89');
INSERT INTO `produits_producteurs` VALUES ('605', '89');
INSERT INTO `produits_producteurs` VALUES ('606', '89');
INSERT INTO `produits_producteurs` VALUES ('607', '89');
INSERT INTO `produits_producteurs` VALUES ('608', '89');
INSERT INTO `produits_producteurs` VALUES ('609', '89');
INSERT INTO `produits_producteurs` VALUES ('610', '89');
INSERT INTO `produits_producteurs` VALUES ('611', '89');
INSERT INTO `produits_producteurs` VALUES ('612', '89');
INSERT INTO `produits_producteurs` VALUES ('613', '89');
INSERT INTO `produits_producteurs` VALUES ('614', '89');
INSERT INTO `produits_producteurs` VALUES ('615', '89');
INSERT INTO `produits_producteurs` VALUES ('616', '89');
INSERT INTO `produits_producteurs` VALUES ('617', '89');
INSERT INTO `produits_producteurs` VALUES ('618', '89');
INSERT INTO `produits_producteurs` VALUES ('619', '89');
INSERT INTO `produits_producteurs` VALUES ('620', '89');
INSERT INTO `produits_producteurs` VALUES ('621', '89');
INSERT INTO `produits_producteurs` VALUES ('622', '89');
INSERT INTO `produits_producteurs` VALUES ('623', '89');
INSERT INTO `produits_producteurs` VALUES ('624', '89');
INSERT INTO `produits_producteurs` VALUES ('625', '89');
INSERT INTO `produits_producteurs` VALUES ('626', '89');
INSERT INTO `produits_producteurs` VALUES ('627', '89');
INSERT INTO `produits_producteurs` VALUES ('628', '89');
INSERT INTO `produits_producteurs` VALUES ('629', '89');
INSERT INTO `produits_producteurs` VALUES ('630', '89');
INSERT INTO `produits_producteurs` VALUES ('631', '89');
INSERT INTO `produits_producteurs` VALUES ('632', '89');
INSERT INTO `produits_producteurs` VALUES ('633', '89');
INSERT INTO `produits_producteurs` VALUES ('634', '89');
INSERT INTO `produits_producteurs` VALUES ('635', '89');
INSERT INTO `produits_producteurs` VALUES ('636', '89');
INSERT INTO `produits_producteurs` VALUES ('637', '89');
INSERT INTO `produits_producteurs` VALUES ('638', '89');
INSERT INTO `produits_producteurs` VALUES ('639', '89');
INSERT INTO `produits_producteurs` VALUES ('640', '89');
INSERT INTO `produits_producteurs` VALUES ('641', '89');
INSERT INTO `produits_producteurs` VALUES ('642', '89');
INSERT INTO `produits_producteurs` VALUES ('643', '89');
INSERT INTO `produits_producteurs` VALUES ('644', '89');
INSERT INTO `produits_producteurs` VALUES ('645', '89');
INSERT INTO `produits_producteurs` VALUES ('646', '89');
INSERT INTO `produits_producteurs` VALUES ('647', '89');
INSERT INTO `produits_producteurs` VALUES ('648', '89');
INSERT INTO `produits_producteurs` VALUES ('649', '89');
INSERT INTO `produits_producteurs` VALUES ('650', '89');
INSERT INTO `produits_producteurs` VALUES ('651', '89');
INSERT INTO `produits_producteurs` VALUES ('652', '89');
INSERT INTO `produits_producteurs` VALUES ('653', '89');
INSERT INTO `produits_producteurs` VALUES ('654', '89');
INSERT INTO `produits_producteurs` VALUES ('655', '89');
INSERT INTO `produits_producteurs` VALUES ('656', '89');
INSERT INTO `produits_producteurs` VALUES ('657', '89');
INSERT INTO `produits_producteurs` VALUES ('658', '89');
INSERT INTO `produits_producteurs` VALUES ('659', '89');
INSERT INTO `produits_producteurs` VALUES ('660', '89');
INSERT INTO `produits_producteurs` VALUES ('661', '89');
INSERT INTO `produits_producteurs` VALUES ('662', '89');
INSERT INTO `produits_producteurs` VALUES ('663', '89');
INSERT INTO `produits_producteurs` VALUES ('664', '89');
INSERT INTO `produits_producteurs` VALUES ('665', '89');
INSERT INTO `produits_producteurs` VALUES ('666', '89');
INSERT INTO `produits_producteurs` VALUES ('667', '89');
INSERT INTO `produits_producteurs` VALUES ('668', '89');
INSERT INTO `produits_producteurs` VALUES ('669', '89');
INSERT INTO `produits_producteurs` VALUES ('670', '89');
INSERT INTO `produits_producteurs` VALUES ('671', '89');
INSERT INTO `produits_producteurs` VALUES ('672', '89');
INSERT INTO `produits_producteurs` VALUES ('673', '89');
INSERT INTO `produits_producteurs` VALUES ('674', '89');
INSERT INTO `produits_producteurs` VALUES ('675', '89');
INSERT INTO `produits_producteurs` VALUES ('676', '89');
INSERT INTO `produits_producteurs` VALUES ('677', '89');
INSERT INTO `produits_producteurs` VALUES ('678', '89');
INSERT INTO `produits_producteurs` VALUES ('679', '89');
INSERT INTO `produits_producteurs` VALUES ('680', '89');
INSERT INTO `produits_producteurs` VALUES ('681', '89');
INSERT INTO `produits_producteurs` VALUES ('682', '89');
INSERT INTO `produits_producteurs` VALUES ('683', '89');
INSERT INTO `produits_producteurs` VALUES ('684', '89');
INSERT INTO `produits_producteurs` VALUES ('685', '89');
INSERT INTO `produits_producteurs` VALUES ('686', '89');
INSERT INTO `produits_producteurs` VALUES ('687', '89');
INSERT INTO `produits_producteurs` VALUES ('688', '89');
INSERT INTO `produits_producteurs` VALUES ('689', '89');
INSERT INTO `produits_producteurs` VALUES ('690', '89');
INSERT INTO `produits_producteurs` VALUES ('691', '89');
INSERT INTO `produits_producteurs` VALUES ('692', '89');
INSERT INTO `produits_producteurs` VALUES ('693', '89');
INSERT INTO `produits_producteurs` VALUES ('694', '89');
INSERT INTO `produits_producteurs` VALUES ('695', '89');
INSERT INTO `produits_producteurs` VALUES ('696', '89');
INSERT INTO `produits_producteurs` VALUES ('697', '89');
INSERT INTO `produits_producteurs` VALUES ('698', '89');
INSERT INTO `produits_producteurs` VALUES ('699', '89');
INSERT INTO `produits_producteurs` VALUES ('700', '89');
INSERT INTO `produits_producteurs` VALUES ('701', '89');
INSERT INTO `produits_producteurs` VALUES ('702', '89');
INSERT INTO `produits_producteurs` VALUES ('703', '89');
INSERT INTO `produits_producteurs` VALUES ('704', '89');
INSERT INTO `produits_producteurs` VALUES ('705', '89');
INSERT INTO `produits_producteurs` VALUES ('706', '89');
INSERT INTO `produits_producteurs` VALUES ('707', '89');
INSERT INTO `produits_producteurs` VALUES ('708', '89');
INSERT INTO `produits_producteurs` VALUES ('709', '89');
INSERT INTO `produits_producteurs` VALUES ('710', '89');
INSERT INTO `produits_producteurs` VALUES ('711', '89');
INSERT INTO `produits_producteurs` VALUES ('712', '89');
INSERT INTO `produits_producteurs` VALUES ('713', '89');
INSERT INTO `produits_producteurs` VALUES ('714', '89');

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'ROLE_PRODUCTEUR', 'PRODUCTEUR');
INSERT INTO `roles` VALUES ('2', 'ROLE_ORGANISATEUR', 'ORGANISATEUR');
INSERT INTO `roles` VALUES ('3', 'ROLE_ADMIN', 'ADMINISTRATEUR');
INSERT INTO `roles` VALUES ('6', null, 'ROLE_ADMIN');
INSERT INTO `roles` VALUES ('7', null, 'ROLE_USER');

-- ----------------------------
-- Table structure for `roles_priviliges`
-- ----------------------------
DROP TABLE IF EXISTS `roles_priviliges`;
CREATE TABLE `roles_priviliges` (
  `role_id` bigint(20) NOT NULL,
  `privilege_id` bigint(20) NOT NULL,
  KEY `FKb0qj59ltep10cs7w692kf1brt` (`privilege_id`),
  KEY `FKkpn3nxud6reolqo6v3t0pxbbn` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of roles_priviliges
-- ----------------------------
INSERT INTO `roles_priviliges` VALUES ('1', '1');
INSERT INTO `roles_priviliges` VALUES ('2', '2');
INSERT INTO `roles_priviliges` VALUES ('3', '3');
INSERT INTO `roles_priviliges` VALUES ('2', '0');
INSERT INTO `roles_priviliges` VALUES ('3', '0');
INSERT INTO `roles_priviliges` VALUES ('6', '1');
INSERT INTO `roles_priviliges` VALUES ('6', '2');
INSERT INTO `roles_priviliges` VALUES ('7', '1');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`) USING HASH,
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2', '$2a$10$KMcZJLPrjWbBjcR1RrUgtel6l9a0P0/ujGXYONuV4GcP5BKFuCW9u', null, 'martin', 'martin.neron@free.fr');
INSERT INTO `users` VALUES ('3', '$2a$10$cQfuEliiNf2KZapPDOXCOeIPiBg3SV57BXpmNvBM3TgcR2GdOdlVi', null, 'test', 'test@test.com');
INSERT INTO `users` VALUES ('4', '$2a$10$eQMDw/Ml4BXjTR8TkhqObupZ.wniz.Z0bwkgmRtjXtogcxzV5rJYi', null, 'nassim', 'nassimlnd37@gmail.com');
INSERT INTO `users` VALUES ('5', '$2a$10$l05HllJtjJ1ljNKA6XszMOLh1Ju/EE/7hR0Ob2.c7UhiZR5gp7i1O', null, 'pierre', 'pierre.deport@etu.univ-tours.fr');

-- ----------------------------
-- Table structure for `user_roles`
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('1', '3');
INSERT INTO `user_roles` VALUES ('2', '2');
INSERT INTO `user_roles` VALUES ('2', '3');
INSERT INTO `user_roles` VALUES ('3', '1');
INSERT INTO `user_roles` VALUES ('4', '3');
INSERT INTO `user_roles` VALUES ('5', '3');

-- ----------------------------
-- Table structure for `vehicules`
-- ----------------------------
DROP TABLE IF EXISTS `vehicules`;
CREATE TABLE `vehicules` (
  `id_vehicule` bigint(20) NOT NULL AUTO_INCREMENT,
  `capacite` float DEFAULT NULL,
  `id_producteur` int(11) DEFAULT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_vehicule`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of vehicules
-- ----------------------------
