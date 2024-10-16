-- Create PRICE table
CREATE TABLE PRICE (
    PRICE_CODE INTEGER PRIMARY KEY,
    PRICE_DESCRIPTION TEXT,
    PRICE_RENTFEE REAL,
    PRICE_DAILYLATEFEE REAL
);

-- Create RENTAL table
CREATE TABLE RENTAL (
    RENT_NUM INTEGER PRIMARY KEY,
    RENT_DATE DATE,
    MEM_NUM INTEGER,
    FOREIGN KEY (MEM_NUM) REFERENCES MEMBERSHIP (MEM_NUM)
);

-- Create VIDEO table
CREATE TABLE VIDEO (
    VID_NUM INTEGER PRIMARY KEY,
    VID_INDATE DATE,
    MOVIE_NUM INTEGER,
    FOREIGN KEY (MOVIE_NUM) REFERENCES MOVIE (MOVIE_NUM)
);

-- Create MOVIE table
CREATE TABLE MOVIE (
    MOVIE_NUM INTEGER PRIMARY KEY,
    MOVIE_TITLE TEXT,
    MOVIE_YEAR INTEGER,
    MOVIE_COST REAL,
    MOVIE_GENRE TEXT,
    PRICE_CODE INTEGER,
    FOREIGN KEY (PRICE_CODE) REFERENCES PRICE (PRICE_CODE)
);

-- Create MEMBERSHIP table
CREATE TABLE MEMBERSHIP (
    MEM_NUM INTEGER PRIMARY KEY,
    MEM_FNAME TEXT,
    MEM_LNAME TEXT,
    MEM_STREET TEXT,
    MEM_CITY TEXT,
    MEM_STATE TEXT,
    MEM_ZIP INTEGER,
    MEM_BALANCE REAL
);

-- Create DETAILRENTAL table
CREATE TABLE DETAILRENTAL (
    RENT_NUM INTEGER,
    VID_NUM INTEGER,
    DETAIL_FEE REAL,
    DETAIL_DUEDATE DATE,
    DETAIL_RETURNDATE DATE,
    DETAIL_DAILYLATEFEE REAL,
    PRIMARY KEY (RENT_NUM, VID_NUM),
    FOREIGN KEY (RENT_NUM) REFERENCES RENTAL (RENT_NUM),
    FOREIGN KEY (VID_NUM) REFERENCES VIDEO (VID_NUM)
);
