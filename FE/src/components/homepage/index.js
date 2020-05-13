import React, { useState, useEffect, useReducer } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import teamData from '../../teamMock';
import GameList from '../gamelist/gameList';

const useStyles = makeStyles((theme) => ({
    paper: {
        width: '100%',
        height: '100vh',
        backgroundColor: '#000000',
        opacity: 0.8,

    },
    title: {
        color: '#ffffff',
        fontSize: 70,
        fontWeight: 'bold',
        paddingTop: 50,
    },
    notice: {
        color: '#ffffff',
        fontSize: 40,
        fontWeight: 'bold',
        paddingTop: 70,
    },
    teamWrapper: {
        width: '550px',
        margin: '0 auto',
        height: '450px',
        overflowY: 'scroll',
        borderRadius: '15px',
        '::-webkit-scrollbar-button': {
            display: 'none'
        },
    },

}));
export function HomePage() {
    const classes = useStyles();
    const [gameList, setGameList] = useState([]);

    const getTeamData = async () => {
        const options = {
            method: "GET",
            headers: {
                Accept: "application/json",
                "Content-Type": "application/json",
                "Access-Control-Allow-Origin": "*",
            }
        };
        try {
            const response = await fetch('https://a2ce38a7-8dc6-4960-847e-fd40393fe743.mock.pstmn.io/games', options);
            const result = await response.json();
            console.log("result check >", result);
            setGameList([result]);
        } catch (err) {
            console.log(err);
        }
    }

    useEffect(() => {
        getTeamData();
    }, []);

    return (
        <div className={classes.root}>
            <Paper className={classes.paper}>
                <div className={classes.title}>BASEBALL GAME ONLINE</div>
                <div className={classes.notice}>참가할 게임을 선택하세요!</div>
                <div className={classes.teamWrapper}>
                    {teamData && teamData.map(team => (
                        team.games.map(game => (
                            <GameList id={game.id} homeTeam={game.home_team} awayTeam={game.away_team} key={game.id} />
                        ))
                    ))}
                </div>
            </Paper>
        </div>
    )

}
export default HomePage;