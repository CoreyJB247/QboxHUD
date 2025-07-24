window.addEventListener('message', function (event) {
  if (event.data.type === "updateNeeds") {
    const { hunger, thirst } = event.data;

    document.getElementById('hungerBar').style.width = hunger + '%';
    document.getElementById('thirstBar').style.width = thirst + '%';
  }
});
