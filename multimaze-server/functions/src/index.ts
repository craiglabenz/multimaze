import * as functions from "firebase-functions";
import * as firebase from "firebase-admin";

firebase.initializeApp();

export const checkVictoryCondition = functions.database
    .ref("position")
    .onUpdate((change, _) => {
      const victorySquare = firebase.database().ref("/victory");
      return victorySquare.once("value").then((snapshot) => {
        const victoryCoordinates = snapshot.val();
        const playerCoordinates = change.after.val();
        if (
          victoryCoordinates.x === playerCoordinates.x &&
        victoryCoordinates.y === playerCoordinates.y
        ) {
          console.log("Victory detected! Resetting the game");
          const startTime = new Date();
          startTime.setSeconds(startTime.getSeconds() + 7);
          return new Promise((resolve, reject) => setTimeout(() => {
            firebase.database().ref("/position").set({
              x: 21,
              y: 1,
              lastMove: null,
              moves: 0,
              startTime: startTime.toISOString(),
            });
            resolve(200);
          }, 3000));
        }
        return 200;
      });
    });
