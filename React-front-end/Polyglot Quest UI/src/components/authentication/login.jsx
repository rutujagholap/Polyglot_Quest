import React, { useState, useEffect } from 'react';
import { Input, Stack, Box, FormControl, FormLabel, Button, HStack, Icon, Select } from '@chakra-ui/react';
import { MdSwapHoriz } from 'react-icons/md';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

function Login() {
  const [userName, setName] = useState('');
  const [email, setEmail] = useState('');
  const [language, setLanguage] = useState(''); 
  const [languageOptions, setLanguageOptions] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    
    axios.get('http://100.89.144.198:8080/languages')
      .then(response => {
        setLanguageOptions(response.data);
      })
      .catch(error => {
        console.error('Error fetching language options:', error);
      });
  }, []);

  
  const handleSubmit = (e) => {
    e.preventDefault();
    axios.post('http://100.89.144.198:8080/users/register', { userName, email, language })
      .then(result => {
        console.log(result);
        navigate('/selectopt', { state: { userName, email, language } });
      })
      .catch(err => console.log(err));
  };

  return (
    <Box p={5} shadow="md" borderWidth="1px">
      <form onSubmit={handleSubmit}>
        <Stack spacing={4}>
          <FormControl isRequired>
            <FormLabel htmlFor="userName">Username</FormLabel>
            <Input id="userName" placeholder="Enter Your Username " value={userName} autoComplete="off" onChange={(e) => setName(e.target.value)} />
          </FormControl>
          <FormControl isRequired>
            <FormLabel htmlFor="email">Email</FormLabel>
            <Input id="email" placeholder="Enter Your Email" type="email" value={email} autoComplete="off" onChange={(e) => setEmail(e.target.value)} />
          </FormControl>
          <FormControl isRequired>
            <FormLabel htmlFor="language">Select a Language</FormLabel>
            <HStack>
              <Input value="English" isReadOnly />
              {/* <Icon as={MdSwapHoriz} w={6} h={6} alignSelf="center" /> */}
              <span>➪</span>
              <Select placeholder="Select" value={language} onChange={(e) => setLanguage(e.target.value)}>
                {languageOptions.map(option => (
                  <option key={option} value={option}>
                    {option}
                  </option>
                ))}
              </Select>
            </HStack>
          </FormControl>
          <Button colorScheme="yellow" width="full" type="submit">
            SUBMIT
          </Button>
        </Stack>
      </form>
    </Box>
  );
}

export default Login;
