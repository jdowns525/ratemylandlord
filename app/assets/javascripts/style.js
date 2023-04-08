// Get the header elements and add some styles
let headers = document.querySelectorAll('.card-header h1, .card-header h2');
headers.forEach(header => {
  header.style.color = 'blue';
  header.style.textAlign = 'center';
});

// Get the buttons and add some styles
let buttons = document.querySelectorAll('.btn');
buttons.forEach(button => {
  button.style.backgroundColor = 'blue';
  button.style.color = 'white';
  button.style.borderRadius = '5px';
  button.style.padding = '10px 20px';
  button.style.margin = '5px';
});

// Get the form labels and add some styles
let labels = document.querySelectorAll('form label');
labels.forEach(label => {
  label.style.color = 'blue';
  label.style.fontWeight = 'bold';
});

// Get the form input fields and add some styles
let inputs = document.querySelectorAll('form input[type="text"], form textarea');
inputs.forEach(input => {
  input.style.borderRadius = '5px';
  input.style.padding = '5px';
  input.style.margin = '5px';
  input.style.width = '100%';
  input.style.boxSizing = 'border-box';
});
javascript_include_tag
