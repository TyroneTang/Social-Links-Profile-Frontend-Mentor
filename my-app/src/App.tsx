import './App.css'
import picture from "./assets/images/avatar-jessica.jpeg"

function App() {
  return (
    <>
      <div className="container">
        <div className="card">
          <div className="profile-pic">
            <img src={picture} alt="Profile-Picture" />
          </div>
          <div className="name-location">
            <h1>Jessica Randall</h1>
            <p>London, United Kingdom</p>
          </div>
          <div className="bio">"Front-end developer and avid reader."</div>
          <div className="links">
            <a className="button" href="#">GitHub</a>
            <a className="button" href="#">Frontend Mentor</a>
            <a className="button" href="#">LinkedIn</a>
            <a className="button" href="#">Twitter</a>
            <a className="button" href="#">Instagram</a>
          </div>
        </div>
      </div>
    </>
  )
}

export default App
