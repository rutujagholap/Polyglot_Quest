// ScoreTable.js
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './ScoreTable.css';
import { useLocation } from 'react-router-dom';
import { Button } from '@chakra-ui/react';
import { useNavigate } from 'react-router-dom';
const ScoreTable = () => {
 const location = useLocation();
 const navigate = useNavigate();
  const [data, setData] = useState(0);
  const [highestScoreData, setHighestScoreData] = useState(0);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState('');
  const { score,language ,userName} = location.state ;
  const ne=data+score;



  

  useEffect(() => {
    axios.get(`http://100.89.144.198:8080/scores/latest/${userName}/${language}`)
      .then(response => {
        console.log("Latest Score API Response " + response.data);
        // const array1 = Array.from(response);
        setData(response.data);
        setIsLoading(false);
      })
      .catch(error => {
        console.error(error.response.data)
        setIsLoading(false);
      });
  }, []);

  useEffect(() => {
    axios.get(`http://100.89.144.198:8080/scores/highest/${userName}/${language}`)
      .then(highestScoreResponse => {
        console.log("Highest Score API Response " + highestScoreResponse.data);
        // const array1 = Array.from(highestScoreResponse);
        setHighestScoreData(highestScoreResponse.data);
        setIsLoading(false);
      })
      .catch(error => {
        console.error(error.highestScoreResponse.data)
        setIsLoading(false);
      });
  }, []);

  if (isLoading) return <div>Loading...</div>;
  if (error) return <div>{error}</div>;


  const asda=()=>{
    navigate('/selectopt', { state:{userName,language}});
  }

  return (
    <div className="score-table-container">
      <h2><b>Scoreboard</b></h2>
      <table className="score-table">
        <thead>
          <tr>
            <th>Username</th>
            <th>Language</th>
            <th>Latest Score</th>
            <th>Highest Score</th>
          </tr>
        </thead>
        <tbody>
         
            <tr >
                
              <td st><b>{userName}</b></td>
              <td><b>{language}</b></td>
              <td><b>{data}</b></td>
              <td><b>{highestScoreData}</b></td>
              
              {/* <td>{data+score}</td> */}
            </tr>
        
        </tbody>
      </table>
      <br></br>
      <div><Button onClick={asda}color="#1871b5">Main Menu</Button></div>
    </div>
    
  );
};

export default ScoreTable;
