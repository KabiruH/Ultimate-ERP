import './App.css'
import SignIn from './components/Signin';
import ProfitLossDetails from './components/ProfitandLoss';
import HomePage from './components/Homepage';

function App() {
  return (
    <div className="App">
      <HomePage/>
     <SignIn/>
     <ProfitLossDetails/>
    </div>
  );
}

export default App;
