import React, { useState } from 'react';
import PropTypes from 'prop-types';
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';

const useStyles = makeStyles((theme) => ({
    paper: {
      width: '100%',
      height: '100vh',
      backgroundColor: '#000000',
    //   opacity: 0.8,
    },  
    topWrapper: {
        display: 'flex',
        // border: '2px solid #ffffff',
        // justifyContent: 'center',
    },
    slide: {
        height: 30,
    },
    titleWrapper: {
        border: '2px solid #ffffff',
        width: '80%',
        marginLeft: 0,
    },
    title: {
        color: '#ffffff',
        fontSize: 30,
        fontWeight: 'bold',
    },
    teamScore: {
        display: 'flex',
        color: '#ffffff',
        justifyContent: 'center',
        fontSize: 50,
        fontWeight: 'bold',
    },
    awayTeam: {
        display: 'flex',
        marginRight: 30,
    },
    awayScore: {
        marginLeft: 30,
    },
    vs: {
        color: '#7D7D7D',
        marginRight: 30,
    },
    playTeamTop: {
        display: 'flex',
    },
    homeTeamScore: {
        marginRight: 30,
    },
    playTeam: {
        fontSize: 20,
        color: 'red',
        fontWeight: 'bolder',
        marginLeft: 60,
        paddingBottom: 20,
    },
    players: {
        borderRight: '2px solid #ffffff',
        borderBottom: '2px solid #ffffff',
        borderTop: '2px solid #ffffff',
        width: '18%',
        padding: 20,
    },
    pitcher: {
        fontSize: 25,
        fontWeight: 'bold',
        color: '#ffffff',
        textAlign: 'left',
    },
    pitcherName:{
        color: '#CCECF3',
        fontSize: 20,
        fontWeight: 'bold',
        textAlign: 'left',
        marginBottom: 10,
    },
    hitter: {
        fontSize: 25,
        fontWeight: 'bold',
        color: '#ffffff',
        textAlign: 'left',
    },
    hitterName: {
        color: '#CCECF3',
        fontSize: 20,
        fontWeight: 'bold',
        textAlign: 'left',
    }
  }));

export function PlayGround() {
    const classes = useStyles();
    
    const showSlide = () => {
        console.log('slide');
    }
    return (
        <Paper className={classes.paper}>
            <div className={classes.topWrapper}>
                <div className={classes.titleWrapper}>
                <div className={classes.slide} onMouseOver={showSlide}>dfdf</div>
                    <div className={classes.title}>
                        BASEBALL GAME ONLINE
                    </div>
                    <div className={classes.teamScore}>
                        <div className={classes.awayTeam}>
                            Captain <div className={classes.awayScore}>1</div>
                        </div>
                        <div className={classes.vs}>vs</div>
                        <div className={classes.homeTeam}>
                            <div className={classes.playTeamTop}>
                                <div className={classes.homeTeamScore}>5</div> Marvel
                            </div>
                            <div className={classes.playTeam}>player</div>
                        </div>
                    </div>
                </div>
                <div className={classes.players}>
                    <div className={classes.pitcherWrapper}>
                        <div className={classes.pitcher}>투수</div>
                        <div className={classes.pitcherName}>최동원 <span className={classes.pitcherNumber}>#39</span></div>
                    </div>
                    <div className={classes.hitterWrapper}>
                        <div className={classes.hitter}>타자</div>
                        <div className={classes.hitterName}>류현진 <span className={classes.hitterInfo}>1타석 0안타</span></div>
                    </div>
                </div>
            </div>
            <div className={classes.bottomWrapper}>
                <div className={classes.playGroundWrapper}>
                    <div className={classes.pitchStatus}>
                        <div className={classes.strike}>S</div>
                        <div className={classes.ball}>B</div>
                        <div className={classes.out}>O</div>
                    </div>
                    <div className={classes.playGround}></div>
                    <div className={classes.playStatus}>2회초 수비</div>
                </div>
                <div className={classes.playStatusWrapper}>

                </div>
            </div>
        </Paper>
    )

}
export default PlayGround;