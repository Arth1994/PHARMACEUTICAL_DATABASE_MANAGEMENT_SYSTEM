CREATE TABLE `buys` (
  `BUY_DATE` date NOT NULL,
  `QUANTITY` int(20) NOT NULL,
  `P_ID` varchar(20) DEFAULT NULL,
  `BATCH_NO` varchar(20) DEFAULT NULL
) 

CREATE TABLE `doctor` (
  `DR_NO` varchar(20) NOT NULL,
  `F_NAME` varchar(50) NOT NULL,
  `M_NAME` varchar(50) DEFAULT NULL,
  `L_NAME` varchar(50) DEFAULT NULL,
  `PHONE` int(10) NOT NULL,
  `SEX` varchar(10) NOT NULL,
  `SPECIALITY` varchar(20) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `STREET` varchar(30) DEFAULT NULL,
  `STATE` varchar(50) DEFAULT NULL
) 

CREATE TABLE `drug` (
  `DRUG_ID` varchar(20) NOT NULL,
  `DRUG_NAME` varchar(50) NOT NULL
) 

CREATE TABLE `drug_manufacturer` (
  `COMPANY_ID` varchar(20) NOT NULL,
  `CITY` varchar(20) NOT NULL,
  `C_NAME` varchar(20) NOT NULL,
  `STATE` varchar(20) NOT NULL,
  `STREET` varchar(20) NOT NULL
) 

CREATE TABLE `includes` (
  `DOSE` varchar(20) NOT NULL,
  `QUANTITY` int(20) NOT NULL,
  `DIRECTION` varchar(20) DEFAULT NULL,
  `PRESC_DATE` date NOT NULL,
  `DRUG_ID` varchar(20) DEFAULT NULL,
  `DURATION` varchar(20) NOT NULL
) 

CREATE TABLE `medicinal_batch` (
  `BATCH_NO` varchar(20) NOT NULL,
  `QUANTITY` int(10) NOT NULL,
  `EXP_DATE` date NOT NULL,
  `PRICE` varchar(20) NOT NULL,
  `DRUG_ID` varchar(20) DEFAULT NULL,
  `COMPANY` varchar(20) NOT NULL
) 

CREATE TABLE `patient` (
  `P_ID` varchar(20) NOT NULL,
  `F_NAME` varchar(50) NOT NULL,
  `M_NAME` varchar(50) DEFAULT NULL,
  `L_NAME` varchar(50) DEFAULT NULL,
  `PHONE` int(10) NOT NULL,
  `SEX` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `INSURANCE_NAME` varchar(20) NOT NULL,
  `INSURANCE_NO` varchar(20) NOT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `STREET` varchar(30) DEFAULT NULL,
  `STATE` varchar(50) DEFAULT NULL
) 

CREATE TABLE `prescription` (
  `PRESC_ID` varchar(20) NOT NULL,
  `P_ID` varchar(20) DEFAULT NULL,
  `DR_NO` varchar(20) DEFAULT NULL,
  `PRESC_DATE` date NOT NULL,
  `EXP_DATE` date NOT NULL
) 

CREATE TABLE `seen_by` (
  `P_ID` varchar(20) DEFAULT NULL,
  `DR_NO` varchar(20) DEFAULT NULL,
  `CURR_DATE` date NOT NULL
) 

CREATE TABLE `supplies` (
  `SUPPLY_DATE` date NOT NULL,
  `BATCH_NO` varchar(20) DEFAULT NULL,
  `COMPANY_ID` varchar(20) DEFAULT NULL,
  `SUPPLY_QUANTITY` int(20) NOT NULL
) 


ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DR_NO`);

ALTER TABLE `drug`
  ADD PRIMARY KEY (`DRUG_ID`);

ALTER TABLE `drug_manufacturer`
  ADD PRIMARY KEY (`COMPANY_ID`);

ALTER TABLE `medicinal_batch`
  ADD PRIMARY KEY (`BATCH_NO`),
  ADD KEY `FK_BATCH` (`DRUG_ID`);

ALTER TABLE `patient`
  ADD PRIMARY KEY (`P_ID`);

ALTER TABLE `prescription`
  ADD PRIMARY KEY (`PRESC_ID`),
  ADD KEY `FK_PATIENT` (`P_ID`),
  ADD KEY `FK_DOCTOR` (`DR_NO`);

ALTER TABLE `seen_by`
  ADD KEY `FK_SEEN1` (`P_ID`),
  ADD KEY `FK_SEEN2` (`DR_NO`);

ALTER TABLE `supplies`
  ADD KEY `FK_SUPPLY1` (`BATCH_NO`),
  ADD KEY `FK_SUPPLY2` (`COMPANY_ID`);


ALTER TABLE `medicinal_batch`
  ADD CONSTRAINT `FK_BATCH` FOREIGN KEY (`DRUG_ID`) REFERENCES `drug` (`DRUG_ID`);

ALTER TABLE `prescription`
  ADD CONSTRAINT `FK_DOCTOR` FOREIGN KEY (`DR_NO`) REFERENCES `doctor` (`DR_NO`),
  ADD CONSTRAINT `FK_PATIENT` FOREIGN KEY (`P_ID`) REFERENCES `patient` (`P_ID`);

ALTER TABLE `seen_by`
  ADD CONSTRAINT `FK_SEEN1` FOREIGN KEY (`P_ID`) REFERENCES `patient` (`P_ID`),
  ADD CONSTRAINT `FK_SEEN2` FOREIGN KEY (`DR_NO`) REFERENCES `doctor` (`DR_NO`);

ALTER TABLE `supplies`
  ADD CONSTRAINT `FK_SUPPLY1` FOREIGN KEY (`BATCH_NO`) REFERENCES `medicinal_batch` (`BATCH_NO`),
  ADD CONSTRAINT `FK_SUPPLY2` FOREIGN KEY (`COMPANY_ID`) REFERENCES `drug_manufacturer` (`COMPANY_ID`);

