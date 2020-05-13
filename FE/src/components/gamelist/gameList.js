import React, { useState, useEffect } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import { withRouter } from 'react-router-dom';
const useStyles = makeStyles((theme) => ({

    playTeams: {
        backgroundColor: '#b5b5b6',
        width: 500,
        height: 120,
        marginTop: 30,
        borderRadius: 15,
        marginBottom: 20,
        marginLeft: 'auto',
        marginRight: 'auto',
    },
    gameNumber: {
        color: '#C20000',
        marginBottom: 20,
        paddingTop: 5,
    },
    teamWrapper: {
        width: '550px',
        margin:'0 auto',
        height: '450px',
        overflowY : 'scroll',
        borderRadius: '15px',
        '::-webkit-scrollbar-button': { 
            display: 'none' 
        },
    },
    teamNameWrapper: {
        display: 'flex',
        // justifyContent:'space-between',
    },
    homeTeam: {
        width: 230,
        color: '#000000',
        fontSize: 35,
        fontWeight: 'bold',
        "&:hover": {
            color: "#C20000",
          },
        cursor: "pointer",
    },
    vs: {
        marginRight: 'auto',
        maringLeft: 'auto',
        fontSize: 35,
        fontWeight: 'bold',
    },
    awayTeam: {
        width: 230,
        color: '#000000',
        fontSize: 35,
        fontWeight: 'bold',
        "&:hover": {
            color: "#C20000",
          },
        cursor: "pointer",
    }

  }));
export function GameList({id, homeTeam, awayTeam, history}) {
    const classes = useStyles();
    const [gameId, setGameId] = useState(0);
    const [playTeamName, setPlayTeamName] = useState('');

    const selectHomeTeam = () => {
        setGameId(id);
        setPlayTeamName(homeTeam.name);
        console.log(gameId);
        console.log('playTeam >' , playTeamName);
        requestGame();
    };

    const selectAwayTeam = () => {
        setGameId(id);
        setPlayTeamName(awayTeam.Name);
        console.log('playTeam >' , playTeamName);
    };

    const requestGame = async () => {
        const options = {
            method: "GET",
            headers: {
                Accept: "application/json",
                "Content-Type": "application/json",
                "Access-Control-Allow-Origin": "*",
            }
        };
        try {
            const response = await fetch(`https://a2ce38a7-8dc6-4960-847e-fd40393fe743.mock.pstmn.io/games/${gameId}`, options);
            console.log(response);
            selectTeam();
        }catch(err) {
            console.log(err);
        }
    }

    const selectTeam = async () => {
        const options = {
            method: "PATCH",
            headers: {
                Accept: "application/json",
                "Content-Type": "application/json",
                "Access-Control-Allow-Origin": "*",
            }
        };
        try  {
            const response = await fetch(`https://a2ce38a7-8dc6-4960-847e-fd40393fe743.mock.pstmn.io/games/${gameId}/${playTeamName}`, options);
            // const status = await response.json();
            console.log("result check >" , response.statusText);
            if(response.statusText === "OK") {
                history.push('/play');
            }
        } catch (err) {
            console.log(err);
        }
    }

    return (
        <div className={classes.playTeams} key={id}> 
            <div className={classes.gameNumber}>GAME {id}</div>
            <div className={classes.teamNameWrapper}>
                <div className={classes.homeTeam} onClick={selectHomeTeam}>{homeTeam.name}</div> 
                <div className={classes.vs}>VS</div>
                <div className={classes.awayTeam} onClick={selectAwayTeam}>{awayTeam.name}</div>
            </div>
        </div>
    )

}
export default withRouter(GameList);