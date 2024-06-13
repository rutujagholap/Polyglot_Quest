import React from 'react';

import { Button, VStack,Grid, Center, Heading } from '@chakra-ui/react';
import { useNavigate } from 'react-router-dom';
import { useLocation } from 'react-router-dom';
function Choopt() {
    const location = useLocation();
    const {language,userName} = location.state; 
    const Navigate=useNavigate();

    const returnToMenu=()=>{
      Navigate('/selectopt', { state:{userName,language}});
    }
  return (
    <Center height="80vh">
    <div>
    <VStack spacing={4}>
      <Button style={{marginTop:"50px", marginLeft:"430px",width:"480px",height:"112px"}}colorScheme="purple" onClick={() =>Navigate("/startgame",{state:{language,userName}}) }>Let's Play</Button>
      {/* <Button style={{marginTop:"50px",marginLeft:"500px",width:"600px",height:"140px"}} colorScheme="yellow" onClick={() => Navigate("/quiz",{state:{language,userName}})}>QUIZ</Button> */}
      <div><Button style={{marginLeft: "70px"}} onClick={returnToMenu}color="#1871b5">Main Menu</Button></div>
    </VStack>
  </div>
  </Center>
  )
}

export default Choopt