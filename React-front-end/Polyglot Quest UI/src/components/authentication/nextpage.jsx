import React from 'react';
import { useLocation } from 'react-router-dom';
import { Button, VStack,Grid, Center, Heading } from '@chakra-ui/react';
import { useNavigate } from 'react-router-dom';


function NextPage() {
  const score=0;
  const location = useLocation();
  const { userName, email, language } = location.state; 
  const Navigate = useNavigate();

  return (
    <Center height="80vh">
      <div>
        <Heading as="h2" size="4xl" color="#f2f7f4" textAlign="center" mb={6} style={{marginTop:"140px"}}>
          Welcome, {userName} !
        </Heading>
      <VStack spacing={2}>
      <Button  style={{marginTop: "50px", marginLeft:"650px",width:"200px",height:"85px"}}colorScheme="blue" onClick={() => Navigate("/learn",{state:{language,userName}})}>Learn</Button>
        
        <Button style={{marginTop: "50px",marginLeft:"650px",width:"200px",height:"85px"}}colorScheme="green" onClick={() => Navigate("/choopt",{state:{language,userName}})}>Start Game</Button>




        <Button style={{marginTop:"50px", marginLeft:"650px",width:"200px",height:"85px"}}colorScheme="red" onClick={() =>Navigate("/scoresTable",{state:{language,userName,score}}) }>Check Score</Button>
        <Button style={{marginTop:"50px",marginLeft:"650px",width:"200px",height:"85px"}} colorScheme="purple" onClick={() => Navigate("/quit")}>Quit</Button>

        


      </VStack>
    </div>
    </Center>
  );
}

export default NextPage;
