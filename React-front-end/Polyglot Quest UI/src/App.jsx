import { Button } from "@chakra-ui/react"
import { Route ,Routes} from "react-router-dom"
import Homepg from "../pages/homepg"
import NextPage from "./components/authentication/nextpage"
import Learn from "../pages/learn"
import Game from "../pages/game"
import Quiz from "../pages/Quiz"
import "./App.css"
import Choopt from "../pages/choopt"
import ScoreTable from "../pages/ScoreTable"
function App() {

  return (
    <div className="App">
      <Routes>
      <Route path="/" element={<Homepg></Homepg>}></Route>
      <Route path="/selectopt" element={<NextPage />} />
      <Route path ="/learn" element={<Learn/>}></Route>

      <Route path ="/startgame" element={<Game/>}></Route>
      <Route path ="/choopt" element={<Choopt/>}></Route>
      <Route path ="/quiz" element={<Quiz/>}></Route>
      <Route path="/quit" element ={<Homepg></Homepg>}></Route>
      <Route path="/scoresTable" element ={<ScoreTable></ScoreTable>}></Route>


      
      </Routes>

    </div>
  )
}

export default App
