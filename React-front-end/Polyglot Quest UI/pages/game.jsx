import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useLocation, useNavigate } from 'react-router-dom';
import './Game.css';
import { color } from 'framer-motion';
import { Center } from '@chakra-ui/react';

const Game = () => {
    const [questions, setQuestions] = useState([]);
    const [currentQuestion, setCurrentQuestion] = useState(0);
    const [score, setScore] = useState(0);
    const [selectedAnswer, setSelectedAnswer] = useState('');
    const [showAnswer, setShowAnswer] = useState(false);
    const location = useLocation();
    const { language, userName } = location.state;
    const navigate = useNavigate();
    const Navigate=useNavigate();

    useEffect(() => {
        const fetchQuestions = async () => {
            const response = await axios.get(`http://100.89.144.198:8080/play/${language}`);
            setQuestions(response.data.slice(0, 8)); 
        };
        fetchQuestions();
    }, [language]);

    const saveScoreToDatabase = (userName, language, userScore) => {
        axios.post('http://100.89.144.198:8080/scores', {
          userName: userName,
          language: language,
          score: userScore
        })
        .then(response => {
          navigate("/scoresTable", { state: { userName, score: 0, language } })
        })
        .catch(error => {
          console.error("There was an error saving the score!", error.response.data);
        });
      };

    const handleAnswerOptionClick = (answer) => {
        const isCorrect = answer === questions[currentQuestion].correctAnswer;
        setSelectedAnswer(answer);
        setShowAnswer(true);
        let updatedScore = score;

        if (isCorrect) {
            updatedScore += 1;
            setScore(updatedScore);
        }

        setTimeout(() => {
            setShowAnswer(false);
            setSelectedAnswer('');
            const nextQuestion = currentQuestion + 1;
            if (nextQuestion < questions.length) {
                setCurrentQuestion(nextQuestion);
            } else {
                saveScoreToDatabase(userName, language, updatedScore);
                navigate('/scoresTable',{ state:{userName,language,score: updatedScore}}); 
            }
        }, 2000); 
    };

    const returnToMenu=()=>{
        Navigate('/selectopt', { state:{userName,language}});
      }

    return (
        <>
            <div style={{fontSize:"40px",alignContent:"center",color:"#171b1f"}}>MCQ</div>
            <span className="re" style={{fontSize:"20px",color:"black",fontFamily:"sans-serif", margin: "20px"}}>
                <span style={{color:"black",marginRight:"8px"}}>Language:</span> <span>English ➪ {language}</span>
            </span>
            <div className='game' style={{alignContent:"center",marginLeft:"30px"}}>
                {questions.length > 0 ? (
                    <div className='question-container'>
                        <div className='score-section'>Score: {score}</div>
                        <div className='question-section'>
                            <div className='question-count'>
                                <span>Question {currentQuestion + 1}</span>/{questions.length}
                            </div>
                            <div className='question-text'>
                                <span style={{color:"#438c7f"}}>English Word : </span>{questions[currentQuestion].englishWord}
                            </div>
                            <div className='answer-section'>
                                {questions[currentQuestion].allLangTranslationWords.map((answerOption, index) => (
                                    <button
                                        key={index}
                                        className={showAnswer ? (answerOption === selectedAnswer ? (answerOption === questions[currentQuestion].correctAnswer ? 'correct' : 'incorrect') : '') : ''}
                                        onClick={() => handleAnswerOptionClick(answerOption)}
                                        disabled={showAnswer}
                                    >
                                        {answerOption}
                                    </button>
                                ))}
                            </div>
                            {showAnswer && (
                                <div className='correct-answer'>
                                    Correct Answer: {questions[currentQuestion].correctAnswer}
                                </div>
                            )}
                        </div>
                        <div><button style={{backgroundColor: "#edf2f2", position: 'relative', border: '1px solid black', borderRadius: '4px', padding: '8px 16px', color: "#1871b5"}} onClick={returnToMenu}>Main Menu</button></div>
                    </div>
                ) : (
                    <p>Loading questions...</p>
                )}
            </div>
        </>
    );
};

export default Game;
