<!DOCTYPE html>
<html>
<head>
	<title>Oops !</title>
	<style type="text/css">
		:root {
  font-size: calc(1vw + 1vh + 1.5vmin);
}

	body {
	  background-color: black;
	  background-image: url("{{ asset('assets/img/404.gif') }}");
	  font-size: 1rem;
	  background-position: left;
	  background-attachment: fixed;
	  background-repeat: no-repeat;
	}

	h1 {
	  font-weight: 400;
	  text-align: center;
	  text-transform: uppercase;
	  font-size:150px;
	}

	h5 {
	  font-weight: 400;
	  text-align: center;
	  text-transform: uppercase;
	  font-size:50px;
	}

	.neon {
	  color: #fff;
	  text-shadow:
	    0 0 5px #fff,
	    0 0 10px #fff,
	    0 0 20px #fff,
	    0 0 40px #0ff,
	    0 0 80px #0ff,
	    0 0 90px #0ff,
	    0 0 100px #0ff,
	    0 0 150px #0ff;
	}
	</style>
</head>
<body>

  <div class="neon">
	  <h1>404</h1>
	  <h5>Not Found</h5>
  </div>


</body>
</html>

