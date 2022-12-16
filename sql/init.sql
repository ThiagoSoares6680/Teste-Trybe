CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";


CREATE TABLE IF NOT EXISTS Accounts(
    id uuid DEFAULT uuid_generate_v4(),
    balance FLOAT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Users(
    id uuid DEFAULT uuid_generate_v4(),
    username VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    accountId uuid NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT FK_UsersAccounts FOREIGN KEY (accountId) REFERENCES Accounts(id)

);

CREATE TABLE IF NOT EXISTS Transactions(
    id uuid DEFAULT uuid_generate_v4(),
    debitedAccountId  uuid NOT NULL,
    creditedAccountId uuid NOT NULL,
    value FLOAT NOT NULL,
    createdAt VARCHAR NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (debitedAccountId) REFERENCES Accounts(id),
    FOREIGN KEY (creditedAccountId) REFERENCES Accounts(id)
);

INSERT INTO aplication_user(username, password) VALUES('thiago',crypt('admin','my_salt'));
