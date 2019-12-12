
DROP TABLE transaction;
DROP TABLE product;
DROP TABLE users;
DROP TABLE account;
DROP TABLE users_history;
DROP TABLE product_history;

DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_transaction_tran_no;


CREATE SEQUENCE seq_product_prod_no	 	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_transaction_tran_no	 INCREMENT BY 1 START WITH 10000;


CREATE TABLE users ( 
	user_id 				VARCHAR2(20)		NOT NULL,
	user_name 				VARCHAR2(50)		NOT NULL,
	password 				VARCHAR2(10)		NOT NULL,
	role 					VARCHAR2(5) 		DEFAULT 'user',
	ssn 					VARCHAR2(13),
	cell_phone				 VARCHAR2(14),
	addr 					VARCHAR2(100),
	email 					VARCHAR2(50),
	reg_date 				DATE,
	cart				 	VARCHAR2(200)
	PRIMARY KEY(user_id)
);

CREATE TABLE account (
	user_id  				VARCHAR2(20)		 NOT NULL REFERENCES users(user_id), 
	user_name 				VARCHAR2(50)		 NOT NULL, 
	balance				 	NUMBER				 DEFAULT 0,
	PRIMARY KEY(user_id)
);

CREATE TABLE product ( 
	prod_no 					NUMBER 			NOT NULL,
	prod_name 					VARCHAR2(100) 	NOT NULL,
	prod_detail 				VARCHAR2(200),
	manufacture_day			 	VARCHAR2(8),
	price 						NUMBER(10),
	image_file 					VARCHAR2(100),
	reg_date 					DATE,
	flag					 CHAR(3)			 	NOT NULL,
	PRIMARY KEY(prod_no)
);

CREATE TABLE transaction ( 
	tran_no 					NUMBER 			NOT NULL,
	prod_no 					NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	buyer_id 					VARCHAR2(20)	NOT NULL REFERENCES users(user_id),
	payment_option				 CHAR(3),
	receiver_name 				VARCHAR2(20),
	receiver_phone			 	VARCHAR2(14),
	demailaddr 					VARCHAR2(100),
	dlvy_request 				VARCHAR2(100),
	tran_status_code		 	CHAR(3),
	order_data 					DATE,
	dlvy_date 					DATE,
	PRIMARY KEY(tran_no)
);

CREATE TABLE users_history (
	user_id 				VARCHAR2(20)		NOT NULL,
	user_name 				VARCHAR2(50)		NOT NULL,
	ssn 					VARCHAR2(13),
	cell_phone				 VARCHAR2(14),
	addr 					VARCHAR2(100),
	email 					VARCHAR2(50),
	reg_date 				DATE,
	left_date 				DATE
);

CREATE TABLE product_history (
	prod_no			 		NUMBER			 	NOT NULL,
	prod_name		 		VARCHAR2(100)	 	NOT NULL,
	prod_detail		 		VARCHAR2(200), 
	manufacture_day	 		VARCHAR2(8), 
	price			 		NUMBER(10), 
	image_file		 		VARCHAR2(100), 
	buyer_id		 		VARCHAR2(20)	 	NOT NULL,
	sale_date		 		DATE
);

tran_status_code			CHAR(3),		NOT NULL REFERENCES transaction(tran_status_code),

INSERT
INTO transaction
VALUES(seq_product_prod_no.nextval,10119,'admin','3','name','phone','addr','request','3',sysdate,'2019-10-24');

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'admin', 'admin', '1234', 'admin', NULL, NULL, '����� ���ʱ�', 'admin@mvc.com',to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS')); 

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'manager', 'manager', '1234', 'admin', NULL, NULL, NULL, 'manager@mvc.com', to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));          

INSERT INTO users 
VALUES ( 'user01', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user02', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user03', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user04', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user05', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user06', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user07', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user08', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user09', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user10', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user11', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user12', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user13', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user14', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user15', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user16', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user17', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user18', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user19', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);
           
	insert into product values (seq_product_prod_no.nextval,'1','�Ҵ� ���̿� ��Ʈ�� �ŵ�ǰ','20120514',2000000, '1.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'2','������ ���ƿ�~','20120514',10000, '2.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'3','�ְ� ������ ��ǰ','20120201',1170000, '3.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'4','�ѽ��� �ۿ� �Ƚ���ϴ�. ������ �ӱݰ� ������ ��.��','20120217', 200000, '4.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'5','���ƿ�','20120819', 20000, '5.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'6','sens �޸� 2Giga','20121121',800000, '6.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'7','������ ���㺸����','20121022',232300, '7.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'8','��Ʈ��','20120212',600000, '8.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'9','�Ҵ� ���̿� ��Ʈ�� �ŵ�ǰ','20120514',2000000, '9.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'10','������ ���ƿ�~','20120514',10000, '10.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'11','�ְ� ������ ��ǰ','20120201',1170000, '11.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'12','�ѽ��� �ۿ� �Ƚ���ϴ�. ������ �ӱݰ� ������ ��.��','20120217', 200000, '12.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'13','���ƿ�','20120819', 20000, '13.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'14','sens �޸� 2Giga','20121121',800000, '14.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'15','������ ���㺸����','20121022',232300, '15.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'16','��Ʈ��','20120212',600000, '16.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'17','�Ҵ� ���̿� ��Ʈ�� �ŵ�ǰ','20120514',2000000, '17.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'18','������ ���ƿ�~','20120514',10000, '18.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'19','�ְ� ������ ��ǰ','20120201',1170000, '19.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'20','�ѽ��� �ۿ� �Ƚ���ϴ�. ������ �ӱݰ� ������ ��.��','20120217', 200000, '20.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'21','���ƿ�','20120819', 20000, '21.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'22','sens �޸� 2Giga','20121121',800000, '22.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'23','������ ���㺸����','20121022',232300, '23.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'24','��Ʈ��','20120212',600000, '24.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'25','�Ҵ� ���̿� ��Ʈ�� �ŵ�ǰ','20120514',2000000, '25.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'26','������ ���ƿ�~','20120514',10000, '26.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'27','�ְ� ������ ��ǰ','20120201',1170000, '27.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'28','�ѽ��� �ۿ� �Ƚ���ϴ�. ������ �ӱݰ� ������ ��.��','20120217', 200000, '28.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'29','���ƿ�','20120819', 20000, '29.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'30','sens �޸� 2Giga','20121121',800000, '30.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'31','������ ���㺸����','20121022',232300, '31.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'32','��Ʈ��','20120212',600000, '32.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'33','�Ҵ� ���̿� ��Ʈ�� �ŵ�ǰ','20120514',2000000, '33.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'34','������ ���ƿ�~','20120514',10000, '34.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'35','�ְ� ������ ��ǰ','20120201',1170000, '35.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'36','�ѽ��� �ۿ� �Ƚ���ϴ�. ������ �ӱݰ� ������ ��.��','20120217', 200000, '36.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'37','���ƿ�','20120819', 20000, '37.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'38','sens �޸� 2Giga','20121121',800000, '38.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'39','������ ���㺸����','20121022',232300, '39.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'40','��Ʈ��','20120212',600000, '40.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'41','�Ҵ� ���̿� ��Ʈ�� �ŵ�ǰ','20120514',2000000, '11.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'42','������ ���ƿ�~','20120514',10000, '42.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'43','�ְ� ������ ��ǰ','20120201',1170000, '43.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'44','�ѽ��� �ۿ� �Ƚ���ϴ�. ������ �ӱݰ� ������ ��.��','20120217', 200000, '44.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'45','���ƿ�','20120819', 20000, '45.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'46','sens �޸� 2Giga','20121121',800000, '46.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'47','������ ���㺸����','20121022',232300, '47.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'48','��Ʈ��','20120212',600000, '48.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'49','�Ҵ� ���̿� ��Ʈ�� �ŵ�ǰ','20120514',2000000, '49.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'50','������ ���ƿ�~','20120514',10000, '50.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'51','�ְ� ������ ��ǰ','20120201',1170000, '51.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'52','�ѽ��� �ۿ� �Ƚ���ϴ�. ������ �ӱݰ� ������ ��.��','20120217', 200000, '52.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'53','���ƿ�','20120819', 20000, '53.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'54','sens �޸� 2Giga','20121121',800000, '54.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'55','������ ���㺸����','20121022',232300, '55.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'56','��Ʈ��','20120212',600000, '56.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'57','�Ҵ� ���̿� ��Ʈ�� �ŵ�ǰ','20120514',2000000, '57.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'58','������ ���ƿ�~','20120514',10000, '58.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'59','�ְ� ������ ��ǰ','20120201',1170000, '59.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'60','�ѽ��� �ۿ� �Ƚ���ϴ�. ������ �ӱݰ� ������ ��.��','20120217', 200000, '60.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'61','���ƿ�','20120819', 20000, '61.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'62','sens �޸� 2Giga','20121121',800000, '62.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'63','������ ���㺸����','20121022',232300, '63.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'64','��Ʈ��','20120212',600000, '64.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'65','�Ҵ� ���̿� ��Ʈ�� �ŵ�ǰ','20120514',2000000, '65.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'66','������ ���ƿ�~','20120514',10000, '66.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'67','�ְ� ������ ��ǰ','20120201',1170000, '67.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'68','�ѽ��� �ۿ� �Ƚ���ϴ�. ������ �ӱݰ� ������ ��.��','20120217', 200000, '68.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'69','���ƿ�','20120819', 20000, '69.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'70','sens �޸� 2Giga','20121121',800000, '70.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'71','������ ���㺸����','20121022',232300, '71.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'72','��Ʈ��','20120212',600000, '72.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'73','�Ҵ� ���̿� ��Ʈ�� �ŵ�ǰ','20120514',2000000, '73.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'74','������ ���ƿ�~','20120514',10000, '74.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'75','�ְ� ������ ��ǰ','20120201',1170000, '75.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'76','�ѽ��� �ۿ� �Ƚ���ϴ�. ������ �ӱݰ� ������ ��.��','20120217', 200000, '76.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'77','���ƿ�','20120819', 20000, '77.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'78','sens �޸� 2Giga','20121121',800000, '78.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'79','������ ���㺸����','20121022',232300, '79.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'80','��Ʈ��','20120212',600000, '80.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'81','�Ҵ� ���̿� ��Ʈ�� �ŵ�ǰ','20120514',2000000, '81.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'82','������ ���ƿ�~','20120514',10000, '82.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'83','�ְ� ������ ��ǰ','20120201',1170000, '83.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'84','�ѽ��� �ۿ� �Ƚ���ϴ�. ������ �ӱݰ� ������ ��.��','20120217', 200000, '84.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'85','���ƿ�','20120819', 20000, '85.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'86','sens �޸� 2Giga','20121121',800000, '86.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'87','������ ���㺸����','20121022',232300, '87.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'88','��Ʈ��','20120212',600000, '88.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'89','���ƿ�','20120819', 20000, '89.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'90','sens �޸� 2Giga','20121121',800000, '90.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'91','������ ���㺸����','20121022',232300, '91.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'92','��Ʈ��','20120212',600000, '92.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'93','���ƿ�','20120819', 20000, '93.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'94','sens �޸� 2Giga','20121121',800000, '94.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'95','������ ���㺸����','20121022',232300, '95.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'94','��Ʈ��','20120212',600000, '96.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'97','���ƿ�','20120819', 20000, '97.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'98','sens �޸� 2Giga','20121121',800000, '98.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'99','������ ���㺸����','20121022',232300, '99.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'100','��Ʈ��','20120212',600000, '100.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'101','sens �޸� 2Giga','20121121',800000, '101.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	
	insert into product values (seq_product_prod_no.nextval,'102','������ ���㺸����','20121022',232300, '102.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'103','��Ʈ��','20120212',600000, '103.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'104','���ƿ�','20120819', 20000, '104.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'105','sens �޸� 2Giga','20121121',800000, '105.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'106','������ ���㺸����','20121022',232300, '106.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'107','��Ʈ��','20120212',600000, '107.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'108','sens �޸� 2Giga','20121121',800000, '108.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'109','������ ���㺸����','20121022',232300, '109.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'110','��Ʈ��','20120212',600000, '110.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'111','���ƿ�','20120819', 20000, '111.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'112','sens �޸� 2Giga','20121121',800000, '112.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'113','������ ���㺸����','20121022',232300, '113.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'114','��Ʈ��','20120212',600000, '114.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'115','sens �޸� 2Giga','20121121',800000, '115.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'116','������ ���㺸����','20121022',232300, '116.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'117','��Ʈ��','20120212',600000, '117.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'118','���ƿ�','20120819', 20000, '118.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'119','sens �޸� 2Giga','20121121',800000, '119.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'120','������ ���㺸����','20121022',232300, '120.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'121','��Ʈ��','20120212',600000, '121.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'122','sens �޸� 2Giga','20121121',800000, '122.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'123','������ ���㺸����','20121022',232300, '123.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'124','��Ʈ��','20120212',600000, '124.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'125','���ƿ�','20120819', 20000, '125.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'126','sens �޸� 2Giga','20121121',800000, '126.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'127','������ ���㺸����','20121022',232300, '127.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'128','��Ʈ��','20120212',600000, '128.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'129','sens �޸� 2Giga','20121121',800000, '129.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'130','������ ���㺸����','20121022',232300, '130.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'131','��Ʈ��','20120212',600000, '131.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'132','���ƿ�','20120819', 20000, '132.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'133','sens �޸� 2Giga','20121121',800000, '133.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'134','������ ���㺸����','20121022',232300, '134.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'135','��Ʈ��','20120212',600000, '135.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'136','sens �޸� 2Giga','20121121',800000, '136.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'137','������ ���㺸����','20121022',232300, '137.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'138','��Ʈ��','20120212',600000, '138.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'139','���ƿ�','20120819', 20000, '139.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'140','sens �޸� 2Giga','20121121',800000, '140.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'141','������ ���㺸����','20121022',232300, '141.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'142','��Ʈ��','20120212',600000, '142.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'143','sens �޸� 2Giga','20121121',800000, '143.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'144','������ ���㺸����','20121022',232300, '144.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'145','��Ʈ��','20120212',600000, '145.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'146','���ƿ�','20120819', 20000, '146.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'147','sens �޸� 2Giga','20121121',800000, '147.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'148','������ ���㺸����','20121022',232300, '148.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'149','��Ʈ��','20120212',600000, '149.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'150','sens �޸� 2Giga','20121121',800000, '150.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'151','������ ���㺸����','20121022',232300, '151.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'152','��Ʈ��','20120212',600000, '152.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'153','���ƿ�','20120819', 20000, '153.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'154','sens �޸� 2Giga','20121121',800000, '154.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'155','������ ���㺸����','20121022',232300, '155.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'156','��Ʈ��','20120212',600000, '156.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'157','sens �޸� 2Giga','20121121',800000, '157.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'158','������ ���㺸����','20121022',232300, '158.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'159','��Ʈ��','20120212',600000, '159.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'160','���ƿ�','20120819', 20000, '160.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'161','sens �޸� 2Giga','20121121',800000, '161.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'162','������ ���㺸����','20121022',232300, '162.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'163','��Ʈ��','20120212',600000, '163.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'164','sens �޸� 2Giga','20121121',800000, '164.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'165','������ ���㺸����','20121022',232300, '165.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'166','��Ʈ��','20120212',600000, '166.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'167','���ƿ�','20120819', 20000, '167.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'168','sens �޸� 2Giga','20121121',800000, '168.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'169','������ ���㺸����','20121022',232300, '169.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'170','��Ʈ��','20120212',600000, '170.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'171','sens �޸� 2Giga','20121121',800000, '171.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'172','������ ���㺸����','20121022',232300, '172.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'173','��Ʈ��','20120212',600000, '173.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'174','���ƿ�','20120819', 20000, '174.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'175','sens �޸� 2Giga','20121121',800000, '175.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'176','������ ���㺸����','20121022',232300, '176.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'177','��Ʈ��','20120212',600000, '177.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'178','sens �޸� 2Giga','20121121',800000, '178.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'179','������ ���㺸����','20121022',232300, '179.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'180','��Ʈ��','20120212',600000, '180.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'181','���ƿ�','20120819', 20000, '181.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'182','sens �޸� 2Giga','20121121',800000, '182.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'183','������ ���㺸����','20121022',232300, '183.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'184','��Ʈ��','20120212',600000, '184.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'185','sens �޸� 2Giga','20121121',800000, '185.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'186','������ ���㺸����','20121022',232300, '186.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'187','��Ʈ��','20120212',600000, '187.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'188','���ƿ�','20120819', 20000, '188.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'189','sens �޸� 2Giga','20121121',800000, '189.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'190','������ ���㺸����','20121022',232300, '190.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'191','��Ʈ��','20120212',600000, '191.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'192','sens �޸� 2Giga','20121121',800000, '192.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'193','������ ���㺸����','20121022',232300, '193.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'194','��Ʈ��','20120212',600000, '194.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'195','���ƿ�','20120819', 20000, '195.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'196','sens �޸� 2Giga','20121121',800000, '196.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'197','������ ���㺸����','20121022',232300, '197.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'198','��Ʈ��','20120212',600000, '198.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'199','sens �޸� 2Giga','20121121',800000, '199.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'200','sens �޸� 2Giga','20121121',800000, '200.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'201','sens �޸� 2Giga','20121121',800000, '201.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'202','sens �޸� 2Giga','20121121',800000, '202.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'203','sens �޸� 2Giga','20121121',800000, '203.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'204','sens �޸� 2Giga','20121121',800000, '204.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	insert into product values (seq_product_prod_no.nextval,'205','sens �޸� 2Giga','20121121',800000, '205.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),'0');
	
	
	
	commit;
	
	
	ALTER TABLE USERS ADD(CART VARCHAR2(200));
	
	ALTER TABLE USERS DROP COLUMN cart;	
	ALTER TABLE USERS ADD (cart VARCHAR2(200));
	
INSERT INTO users_history
VALUES ( 'test01', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test02', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test03', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test04', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test05', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test06', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test07', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test08', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test09', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test10', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test11', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users 
VALUES ( 'user20', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user21', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user22', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user23', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user24', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user25', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user26', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user27', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user28', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user29', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user30', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user31', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user32', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user33', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user34', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user35', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user36', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user37', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user38', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user39', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user40', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user41', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user42', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user43', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user44', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user45', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user46', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user47', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user48', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user49', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user50', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user51', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user52', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user53', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user54', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user55', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user56', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user57', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);


INSERT INTO users_history
VALUES ( 'test99', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test98', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test97', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test96', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test95', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test94', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test93', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test92', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test91', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test90', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users_history
VALUES ( 'test89', 'TEST', NULL, NULL, NULL, NULL, sysdate, '2019-11-01');

INSERT INTO users 
VALUES ( 'user88', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user87', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user76', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user75', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user74', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user73', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user72', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user71', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user70', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user69', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user59', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user58', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user99', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user98', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user97', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user96', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user95', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user94', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user93', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user92', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user91', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user90', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user89', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user00', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user101', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user102', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user103', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user104', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user105', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate, NULL); 

INSERT INTO users 
VALUES ( 'user106', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user107', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user108', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user109', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user110', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user111', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user112', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user113', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user114', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);


INSERT INTO users 
VALUES ( 'user200', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user201', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user202', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user203', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user204', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user205', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);
INSERT INTO users 
VALUES ( 'user207', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user208', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user209', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user210', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user211', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user212', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);
INSERT INTO users 
VALUES ( 'user213', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user290', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user291', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user292', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user293', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user294', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);





















