-- --------------------------------------------------
--          Papa Database
-- --------------------------------------------------

create table Users (
    id         varchar(36)  not null,
    email      varchar(255) not null,
    password   varchar(255) not null,
    createdAt  timestamp    not null,
    updatedAt  timestamp    not null,
    constraint Users_PK
      primary key (id)
);

create table Players (
    id    varchar(36)  not null,
    fname varchar(20)  not null,
    lname varchar(20)  not null,
    createdAt  timestamp  not null,
    updatedAt  timestamp  not null,
    userId     varchar(20)  not null,
    constraint Players_PK
      primary key (id),
    constraint Players_Users_FK
      foreign key (userId) references Users(id)
);

create table Games (
    id          varchar(36)  not null,
    number      int not null,
    date        timestamp not null,
    createdAt   timestamp not null,
    updatedAt   timestamp not null,
    location    varchar(255),
    summary     varchar(255),
    constraint Games_PK
      primary key (id)
);

create table ScoreTypes (
    id    varchar(36)  not null,
    type  varchar(9)   not null,
    constraint ScoreType_PK
      primary key (id)
);

create table Scores (
    id           varchar(36) not null,
    scoreTypeId  varchar(36) not null,
    score        int not null,
    playerId     varchar(36) not null,
    betAgainstPlayerId  varchar(36),
    createdAt   timestamp not null,
    updatedAt   timestamp not null,
    constraint Score_PK
      primary key (id),
    constraint Score_Type_FK
      foreign key (scoreTypeId) references ScoreTypes(id),
    constraint Scores_Player1_FK
      foreign key (playerId) references Players(id),
    constraint Scores_Player2_FK
      foreign key (betAgainstPlayerId) references Players(id)
);

create table GameScores (
    id        varchar(36)  not null,
    scoreId   varchar(36)  not null,
    gameId    varchar(36)  not null,
    constraint GameScores_PK
      primary key (id),
    constraint GameScores_Score_FK
      foreign key (scoreId) references Scores(id),
    constraint GameScores_Game_FK
      foreign key (gameId) references Games(id)
);

create table Seasons (
    id          varchar(36) not null,
    startDate   date not null,
    endDate     date not null,
    createdAt   timestamp not null,
    updatedAt   timestamp not null,
    number      int not null,
    constraint Seasons_PK
      primary key (id)    
);

create table SeasonGames (
    id        varchar(36) not null,
    gameId    varchar(36) not null,
    seasonId  varchar(36) not null,
    constraint SeasonGames_PK
      primary key (id),
    constraint SeasonGames_Game_FK
      foreign key (gameId) references Games(id),
    constraint SeasonGames_Season_FK
      foreign key (seasonId) references Seasons(id)
);
