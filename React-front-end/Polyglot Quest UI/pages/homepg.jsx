import React from 'react'
import {Container,Box,Text,Tabs, TabList, TabPanels, Tab, TabPanel} from "@chakra-ui/react"
import Login from "../src/components/authentication/login"

function Homepg() {
  return (
    <Container maxW="x1" centerContent>
    <Box
    d="flex"
    justifyContent="center"
    p={3}
    bg={"#d1d1d1"}
    W="100%"
    m="40px 0 15px 0"
    borderRadius="1g"
    borderWidth="1px"
    >
   <Text fontSize="4xl" fontFamily="sans-serif" color="black" ><b>POLYGLOT QUEST</b></Text>
</Box>
<Box bg="#f0f0f0" w="40%" p={4} borderRadius="lg" borderWidth="15px" height="65% ">
<Tabs variant='soft-rounded' colorScheme='blue'>
  <TabList>
    <Tab width="100%">ENTER YOUR DETAILS</Tab>
    
  </TabList>
  <TabPanels>
    <TabPanel>
      <Login></Login>
    </TabPanel>
    
  </TabPanels>
</Tabs>
</Box>
</Container>
  );
}

export default Homepg