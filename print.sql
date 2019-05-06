
select G.number, CONCAT(P.fname,P.lname) as Player, Sc.score as Total
from Players P, Games G, ScoreTypes St, Scores Sc, Seasons Se, GameScores Gs, SeasonGames Sg
where
    Sg.gameId = G.id and
    Sg.seasonId = Se.id and
    Gs.gameId = G.id and
    Gs.scoreId = Sc.id and
    Sc.scoreTypeId = St.id and
    St.type = 'Total' and
    Sc.playerId = P.id
order by G.number;