import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import { Box, Button, Text, VStack } from '@chakra-ui/react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import "./learn.css"

function Learn() {
  const location = useLocation();
  const { language, userName } = location.state;
  const [data, setData] = useState([]);
  const [currentIndex, setCurrentIndex] = useState(0);

  const isLastWord = currentIndex === data.length - 1;
  const navigate = useNavigate();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get(`http://100.89.144.198:8080/learn/${language}`);
        setData(response.data);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    fetchData();
  }, [language]);

  const handleNext = () => {
    if (!isLastWord) {
      setCurrentIndex((prevIndex) => prevIndex + 1);
    }
  };

  const handlePrevious = () => {
    if (currentIndex > 0) {
      setCurrentIndex((prevIndex) => prevIndex - 1);
    }
  };

  const handleQuit = () => {
    navigate('/selectopt', { state: { userName, language } });
  };

  return (
    <VStack spacing={4} align='center' justify='center' height='100vh'>
      <b><Text className="language-text" fontSize='4xl' fontWeight='bold' color='black' alignContent="center" style={{ marginLeft: "60px" }}>
        Language: English ➪ {language}
      </Text></b>
      <Box
        minHeight='300px'
        style={{ marginLeft: '250%', width: '200%' }}
        p={10}
        shadow='xl'
        borderWidth='1px'
        borderRadius='lg'
        bg='whiteAlpha.800'
        display='flex'
        flexDirection='column'
        justifyContent='center'
        width={['80%', '60%', '40%']}
      >
        <Text className="english-word-text" fontSize='2xl' fontWeight='bold' color="black">
          ENGLISH WORD : {data[currentIndex]?.englishWord}
        </Text>
        <br></br>
        <Text className="translated-word-text" fontSize='2xl' mg={4} fontWeight='bold' color="green">
          TRANSLATED WORD : {data[currentIndex]?.translatedWord}
        </Text>
        <Text mt={4} fontSize='md'>
          {currentIndex + 1}/{data.length}
        </Text>
      </Box>
      <Button
        style={{ marginLeft: '250%', width: '50%' }}
        colorScheme='teal'
        onClick={handlePrevious}
        isDisabled={currentIndex === 0}
      >
        Previous
      </Button>
      <Button
        style={{ marginLeft: '250%', width: '50%' }}
        colorScheme='teal'
        onClick={handleNext}
        isDisabled={isLastWord}
      >
        Next
      </Button>
      <Button
        style={{ marginLeft: '250%', width: '50%' }}
        colorScheme='red'
        onClick={handleQuit}
      >
        Quit
      </Button>
    </VStack>
  );
}

export default Learn;
