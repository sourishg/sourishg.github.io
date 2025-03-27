---
title: Research
permalink: research/
profile: true
---

<div class="research-item">
	<div class="img">
		<img src="{{ site.baseurl }}/assets/images/research/fod/fod.gif" alt="Aircraft Detection" />
	</div>
	<div class="info">
		<h1>Long-range Aircraft Detection and Tracking</h1>
		<span class="authors">Sourish Ghosh, Jay Patrikar, Brady Moon, Ojit Mehta, Sebastian Scherer</span>
		<br>
		<span class="conf">Current research at the Air Lab, Robotics Institute, CMU</span>
		<p class="desc">
			The detect-and-avoid problem is the “holy grail” for small aircrafts and drones that need to fly beyond line-of-sight. Delivery drones in particular need to ensure self-separation from other aircraft to ensure safety. While it may seem that aircrafts could be detected via transponders, they are often not available on many aircrafts and even if they are, the rules and regulations do not make it necessary for them to be switched on at all times. Additionally, other flying objects such as birds, balloons, and other drones don’t have transponders. Therefore it is necessary to detect and avoid these objects for fully autonomous flights. Currently, the only effective sensor for aircraft detection is radar, but it is too heavy and expensive for small drones which have size, weight, and power (SWaP) constraints. These constraints even limit LiDAR ranges to be around 100m. For high-speed obstacle avoidance in dynamic environments, objects must be detected at long ranges (>= 500m) to allow sufficient reaction time. Thus, the aim of this project is to create a vision-based aircraft detection and tracking system that focuses primarily on long-range detection.
		</p>
		<ul>
			<li><a href="https://arxiv.org/pdf/2209.12849">Paper</a></li>
			<li><a href="https://theairlab.org/aircraft-detection/">Blog</a></li>
		</ul>
	</div>
</div>

<div class="research-item">
	<div class="img">
		<img src="{{ site.baseurl }}/assets/images/research/trf/minitaur.jpeg" alt="p-ACE" />
	</div>
	<div class="info">
		<h1>Learning task-relevant features for model predictive control</h1>
		<span class="authors">Sourish Ghosh, Anirudha Majumdar</span>
		<br>
		<span class="conf">Research Internship at Princeton University, 2018</span>
		<p class="desc">
			Model-based control techniques for systems such as legged robots and unmanned aerial vehicles
have the ability to explicitly reason about the nonlinearity and uncertainty in the robots' dynamics
and potentially even provide guarantees on their safety. However, a fundamental and outstanding
challenge is their limited ability to reason about rich sensory inputs such as depth images or vision.
Model-based control techniques often treat the robot's perceptual system as a black box and make
unrealistic assumptions about the perceptual system's output. The goal of this project is to address
these challenges by leveraging data-driven approaches for learning dynamical models of <i>task-relevant</i>
perceptual features extracted from rich sensory inputs and using these models for agile and safe robot
navigation.
		</p>
	</div>
</div>

<div class="research-item">
	<div class="img">
		<img src="{{ site.baseurl }}/assets/images/research/pace/m2020.jpg" alt="p-ACE" />
	</div>
	<div class="info">
		<h1>Probabilistic Kinematic State Estimation for Motion Planning of Planetary Rovers</h1>
		<span class="authors">Sourish Ghosh, Kyohei Otsu, Masahiro Ono</span>
		<br>
		<span class="conf">IROS 2018 (Madrid, Spain)</span>
		<p class="desc">
			p-ACE: a probabilistic extension to ACE is a light-weight state estimation algorithm for planetary rovers with kinematically constrained articulated suspension systems. ACE's conservative safety check approach can sometimes lead to over-pessimism: feasible states are often reported as infeasible, thus resulting in frequent false positive detection. p-ACE estimates probability distributions over states instead of deterministic bounds to provide more flexible and less pessimistic worst-case evaluation with probabilistic safety guarantees.
		</p>
		<ul>
			<li><a href="https://souri.sh/publications/pACE_IROS18.pdf">Paper</a></li>
		</ul>
	</div>
</div>

<div class="research-item">
	<div class="img">
		<img src="{{ site.baseurl }}/assets/images/research/ace/curiosity.jpg" alt="ACE" />
	</div>
	<div class="info">
		<h1>Fast Approximate Clearance Evaluation for Rovers with Articulated Suspension Systems</h1>
		<span class="authors">Kyohei Otsu, Guillaume Matheron, Sourish Ghosh, Olivier Toupet, Masahiro Ono</span>
		<br>
		<span class="conf">Journal of Field Robotics, 2019</span>
		<p class="desc">
			ACE is a light-weight collision detection algorithm for motion planning of planetary rovers with articulated suspension systems.
			Solving the exact collision detection problem for articulated suspension systems requires simulating the vehicle settling on the terrain, which involves an inverse-kinematics problem with iterative nonlinear optimization under geometric constraints. We propose the Approximate Clearance Evaluation (ACE) algorithm, which obtains conservative bounds on vehicle clearance, attitude, and suspension angles without iterative computation.
		</p>
		<ul>
			<li><a href="https://onlinelibrary.wiley.com/doi/abs/10.1002/rob.21892">Paper</a></li>
		</ul>
	</div>
</div>

<div class="research-item" style="border-bottom: none;">
	<div class="img">
		<img src="{{ site.baseurl }}/assets/images/research/jpp/visualcache4rrt.png" alt="JPP" />
	</div>
	<div class="info">
		<h1>Joint Perception And Planning For Efficient Obstacle Avoidance Using Stereo Vision</h1>
		<span class="authors">Sourish Ghosh, Joydeep Biswas</span>
		<br>
		<span class="conf">IROS 2017 (Vancouver, Canada)</span>
		<p class="desc"> We introduce an approach to Joint Perception and Planning
(JPP) using stereo vision, which performs disparity checks
on demand, only as necessary while searching on a planning
graph. Furthermore, obstacle checks for navigation planning
do not require full 3D reconstruction: we present in this paper
how obstacle queries can be decomposed into a sequence of
confident positive stereo matches and confident negative stereo
matches, which are significantly faster to compute than the
exact depth of points.</p>
		<ul>
			<li><a href="https://www.joydeepb.com/Publications/jpp.pdf">Paper</a></li>
			<li><a href="https://github.com/umass-amrl/jpp">Code</a></li>
		</ul>
	</div>
</div>
