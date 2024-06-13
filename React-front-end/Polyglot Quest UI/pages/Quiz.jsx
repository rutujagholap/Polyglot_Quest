import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate, useLocation } from 'react-router-dom';
import { Button, VStack, Text, useToast, Center, Heading } from '@chakra-ui/react';
import "./Quiz.css";

const Quiz = () => {
  const [questions, setQuestions] = useState([]);
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0);
  const [userAnswer, setUserAnswer] = useState('');
  const [score, setScore] = useState(0);
  const [feedback, setFeedback] = useState('');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const navigate = useNavigate();
  const toast = useToast();
  const location = useLocation();
  const { language, userName } = location.state;

  useEffect(() => {
    axios.get(`http://100.89.144.198:8080/play/${language}`)
      .then(response => {
        setQuestions(response.data.slice(0, 5));
        setLoading(false);
      })
      .catch(error => {
        setError('Error fetching questions');
        setLoading(false);
      });
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

  const handleSubmit = () => {
    const isCorrect = userAnswer.toLowerCase() === questions[currentQuestionIndex].correctAnswer.toLowerCase();
    let updatedScore = score;
    if (isCorrect) {
      updatedScore += 1;
      setScore(updatedScore);
      setFeedback('Correct!');
    } else {
      setFeedback('Wrong Answer');
    }

    setTimeout(() => {
      if (currentQuestionIndex < questions.length - 1) {
        setCurrentQuestionIndex(currentQuestionIndex + 1);
        setUserAnswer('');
        setFeedback('');
      } else {
        toast({
          title: `Quiz Completed!`,
          description: `Your score is ${updatedScore}/${questions.length}`,
          status: 'info',
          duration: 7000,
          isClosable: true,
          position: 'top',
        });
        
        saveScoreToDatabase(userName, language, updatedScore);
      }
    }, 2000);

    setTimeout(() => {
      if (currentQuestionIndex < questions.length - 1) {
        setCurrentQuestionIndex(currentQuestionIndex + 1);
      } else {
        alert(`Game Over! Your score: ${updatedScore}`);
        navigate('/selectopt', { state: { userName, language } });
      }
    }, 2000);
  };

  if (loading) return <Center>Loading...</Center>;
  if (error) return <Center>{error}</Center>;

  return (
    <div className='fr'>
      <VStack spacing={4} align='stretch'>
        <b><Text fontSize='2xl' color='purple'>Language: English ➪ {language}</Text></b>
        <Heading as='h2' size='xl'>{questions[currentQuestionIndex]?.englishWord}</Heading>
        <input
          className='answer-input'
          type='text'
          value={userAnswer}
          onChange={(e) => setUserAnswer(e.target.value)}
          placeholder='Type your answer here'
        />
        <Button colorScheme='red' onClick={handleSubmit}>Submit Answer</Button>
        {feedback && (
          <Text color={feedback === 'Correct!' ? 'green.500' : 'red.500'}>{feedback}</Text>
        )}
        <Text fontSize='xl'>Score: {score}</Text>
      </VStack>
    </div>
  );
};

export default Quiz;
