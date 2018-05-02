const countdown = document.querySelector('.horloge');

// SET LAUNCHDATE
const launchDate =  new Date('Jul 1, 2018 00:00:00').getTime();

// Update every seconds
const intervale = setInterval(() => {

  // Set todays date and time
  const today = new Date().getTime();

  // Time distance between today and launchdate
  const distance = launchDate - today;

  // Time calculation
  const days = Math.floor(distance / (1000 * 60 * 60 * 24));
  const hours = Math.floor(distance % (1000 * 60 * 60 * 24) / (1000 * 60 * 60));
  const mins = Math.floor(distance % (1000 * 60 * 60) / (1000 * 60));
  const secs = Math.floor(distance % (1000 * 60) / 1000);

  // Display result
  countdown.innerHTML = `
    <div><span>${days}</span><p>jrs.</p></div>
    <div><span>${hours}</span><p>hrs.</p></div>
    <div><span>${mins}</span><p>mins.</p></div>
    <div><span>${secs}</span><p>secs.</p></div>
  `;

  // If launchDate past
  if(distance < 0 ){
    clearInterval(intervale);
  }
}, 1000);
