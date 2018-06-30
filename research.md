---
title: Research
permalink: research/
profile: true
---

<div class="research-item">
	<div class="img">
		<img src="{{ site.baseurl }}/assets/images/research/pace/m2020.jpg" alt="p-ACE" />
	</div>
	<div class="info">
		<h1>Probabilistic Kinematic State Estimation for Motion Planning of Planetary Rovers</h1>
		<span class="authors">Sourish Ghosh, Kyohei Otsu, Masahiro Ono</span>
		<br>
		<span class="conf">IROS 2018 (Madrid, Spain) (To Appear)</span>
		<p class="desc">
			p-ACE: a probabilistic extension to ACE is a light-weight state estimation algorithm for planetary rovers with kinematically constrained articulated suspension systems. ACE's conservative safety check approach can sometimes lead to over-pessimism: feasible states are often reported as infeasible, thus resulting in frequent false positive detection. p-ACE estimates probability distributions over states instead of deterministic bounds to provide more flexible and less pessimistic worst-case evaluation with probabilistic safety guarantees.
		</p>
	</div>
</div>

<div class="research-item">
	<div class="img">
		<img src="{{ site.baseurl }}/assets/images/research/ace/curiosity.jpg" alt="ACE" />
	</div>
	<div class="info">
		<h1>Fast Approximate Collision Detection for Kinematically Constrained Articulated Suspension Systems</h1>
		<span class="authors">Kyohei Otsu, Guillaume Matheron, Sourish Ghosh, Olivier Toupet, Masahiro Ono</span>
		<p class="desc">
			ACE is a light-weight collision detection algorithm for motion planning of planetary rovers with articulated suspension systems. 
			Solving the exact collision detection problem for articulated suspension systems requires simulating the vehicle settling on the terrain, which involves an inverse-kinematics problem with iterative nonlinear optimization under geometric constraints. We propose the Approximate Clearance Evaluation (ACE) algorithm, which obtains conservative bounds on vehicle clearance, attitude, and suspension angles without iterative computation.
		</p>
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
			<li><a href="https://www.joydeepb.com/Publications/jpp.pdf" target="blank">PDF</a></li>
			<li><a href="https://github.com/umass-amrl/jpp" target="blank">Code</a></li>
		</ul>
	</div>
</div>
