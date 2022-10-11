-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2022 at 05:52 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Cat_name` varchar(30) NOT NULL,
  `Cat_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Cat_name`, `Cat_ID`) VALUES
('', ''),
('Vegetable', '01'),
('Fruits', '02'),
('Milk', '03'),
('Fish', '04'),
('Meat', '05'),
('Oil', '06'),
('Personal Care', '07'),
('Snacks', '08'),
('Daily Cooking', '09');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `C_name` varchar(25) NOT NULL,
  `C_ID` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Phone no.` char(11) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`C_name`, `C_ID`, `Address`, `Phone no.`, `Email`) VALUES
('Shajid', '20101024', 'Noakhali', '234354', '20101024@uap-bd.edu'),
('Shawon', '20101025', 'Road1,Dhanmondi', '01671518722', '20101025@uap-bd.edu'),
('Nasiba', '20101026', 'Green Road', '34567567', '20101026@uap-bd.edu'),
('Jannat', '20101028', 'Barisal', '345678', '20101028@uap-bd.edu'),
('Oythi', '20101033', 'Puran Dhaka', '345677', '20101033@uap-bd.edu'),
('Mahir', '20101034', 'Narayanganj', '345678', '20101034@uap-bd.edu'),
('Fayaj Nakib ', '20101036', 'Mirpur 10,Dhaka', '0167885892', '20101036@uap-bd.edu'),
('Tasfia', '20101037', 'Uttara', '2345678', '20101037@uap-bd.edu'),
('Razia', '20101039', 'Mirpur', '2345678', '20101039@uap-bd.edu'),
('Ayan', '20101042', 'Mymensingh', '352678992', '20101042@uap-bd.edu');

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `P_ID` varchar(10) NOT NULL,
  `P_name` varchar(30) NOT NULL,
  `Discount` int(5) NOT NULL,
  `New_price` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `online shop`
--

CREATE TABLE `online shop` (
  `Name` varchar(25) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Phone no` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `Order_num` varchar(10) NOT NULL,
  `P_name` varchar(30) NOT NULL,
  `P_ID` varchar(10) NOT NULL,
  `price` varchar(5) NOT NULL,
  `date` date NOT NULL,
  `Quantity` varchar(5) NOT NULL,
  `C_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Pay_ID` varchar(5) NOT NULL,
  `Pay_type` varchar(10) NOT NULL,
  `Amount` int(10) NOT NULL,
  `Order_num` varchar(5) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `P_name` varchar(30) NOT NULL,
  `P_ID` varchar(10) NOT NULL,
  `Brand` varchar(30) NOT NULL,
  `Cat_ID` char(10) NOT NULL,
  `Exp. Date` date NOT NULL,
  `S_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `S_name` varchar(25) NOT NULL,
  `S_ID` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Phone no.` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`S_name`, `S_ID`, `Address`, `Phone no.`) VALUES
('Tarek', '101001', 'Mirpur', '53637809345'),
('Mubassir', '101002', 'Uttara', '54279401743'),
('Abdullah', '101003', 'Puran Dhaka', '35467298730'),
('Ramjan', '101004', 'Gulshan', '36829019828'),
('Naziruddin', '101005', 'Savar', '23984576091'),
('Rakibul', '101006', 'Banani', '53029842909'),
('Ibrahim', '101007', 'Dhanmondi', '43670987989'),
('Rahman', '101008', 'Mohammadpur', '34876589023');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Cat_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`C_ID`);

--
-- Indexes for table `offer`
--
ALTER TABLE `offer`
  ADD KEY `FK` (`P_ID`);

--
-- Indexes for table `online shop`
--
ALTER TABLE `online shop`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Order_num`),
  ADD KEY `FK` (`P_ID`),
  ADD KEY `C_ID` (`C_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Pay_ID`),
  ADD KEY `FK` (`Order_num`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`P_ID`),
  ADD KEY `FK` (`S_ID`),
  ADD KEY `Cat_ID` (`Cat_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`S_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `offer`
--
ALTER TABLE `offer`
  ADD CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `product` (`P_ID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `product` (`P_ID`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`C_ID`) REFERENCES `customer` (`C_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Order_num`) REFERENCES `order` (`Order_num`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`S_ID`) REFERENCES `supplier` (`S_ID`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`Cat_ID`) REFERENCES `category` (`Cat_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
