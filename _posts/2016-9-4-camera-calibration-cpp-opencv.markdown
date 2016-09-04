---
title:  "Camera calibration using C++ and OpenCV"
date:   2016-9-4 10:00:00
description: Tool to calibrate intrinsics/extrinsics of cameras efficiently
---

# Introduction

Often for complicated tasks in computer vision it is required that a camera be **calibrated**. Camera calibration is a necessary step in 3D computer vision in order to
extract metric information from 2D images. If you're just looking for the code, you can find the full code here: [https://github.com/sourishg/stereo-calibration](https://github.com/sourishg/stereo-calibration)

# What is meant by calibrating a camera?

There are many lens models but for this tutorial we will assume the most commonly used **pinhole model**. The model is described by the two images below:

|![]({{ site.baseurl }}assets/images/blog/camera_calibration/pinhole_model.png)|![]({{ site.baseurl }}assets/images/blog/camera_calibration/pinhole_model_extrinsic.png)|

The task of camera calibration is to determine the parameters of the transformation between an object in 3D space and the 2D image observed by the camera from visual information (images).

Let $\mathbf{X} = (X,Y,Z,1)^T$ be the coordinate of the point in 3D world coordinates. Then the 3D coordinate of the same point in camera frame $ \mathbf{X}_{cam} $ is transformed as:

<center>
$ \mathbf{X}_{cam} = \begin{bmatrix} \mathbf{R} & \mathbf{t} \end{bmatrix}\mathbf{X} \\ $
</center>

where $\mathbf{R}$ is 3x3 rotation matrix and $\mathbf{t}$ is 3x1 translation matrix. Now, let $\mathbf{x}=(x,y,1)^T$ be the image coordinate of that 3D point, then the 3D to 2D mapping becomes:

<center>
$ \mathbf{x} = \mathbf{K}\begin{bmatrix} \mathbf{R} & \mathbf{t} \end{bmatrix}\mathbf{X} \\ $
</center>

where $\mathbf{K}$ is a 3x3 matrix containing the intrinsic parameters of the camera.

<center>
$\mathbf{K} = \begin{bmatrix}
f_x & 0 & c_x \\
0 & f_y & c_y \\
0 & 0 & 1
\end{bmatrix}\\$
</center>

$f_x$ and $f_y$ are the focal length of the camera in the x-axis and the y-axis respectively. $(c_x, c_y)$ is coordinate of the principal point.

- **Intrinsic parameters**: The $\mathbf{K}$ matrix consists of all the intrinsic parameters of the camera.
- **Extrinsic parameters**: The $\mathbf{R}$ and $\mathbf{t}$ matrices constitutes the extrinsic parameters of the camera.

<br>

> Finding out these unknown parameters is known as camera calibration. We will not delve into the complicated linear algebra involved in finding out these parameters. Here is a gist of what we'll do to calibrate - we will take multiple images of a checkerboard with a fixed square size and find all the corner points in each image. These corner points in the image correspond to some 3D point in the world (which is easy to calculate, since the checkerboard has a very well defined geometry). We'll store these point to point correspondences and let OpenCV use it's non-linear algorithm to give us the calibration parameters.

# Dependencies and Datasets

You must have `OpenCV 2.4.8+` and `libpopt` (command line args) to run the code. Also, you should have a dataset of calibration images beforehand of a fixed image resolution. Here are two sample images of the checkerboard.

|![]({{ site.baseurl }}assets/images/blog/camera_calibration/left1.jpg)|![]({{ site.baseurl }}assets/images/blog/camera_calibration/left22.jpg)|

It is recommended to get at least 30 images of the checkerboard in all possible orientations of the checkerboard to get good calibration results.

**Note**: In this example, a standard 9x6 calibration board is used. The size of the square is 24.23 mm.

# Code Explained

I will only explain the important parts of the code, and you can find the full source here: [https://github.com/sourishg/stereo-calibration/blob/master/calib_intrinsic.cpp](https://github.com/sourishg/stereo-calibration/blob/master/calib_intrinsic.cpp)

{% highlight cpp %}
vector< vector< Point3f > > object_points;
vector< vector< Point2f > > image_points;
vector< Point2f > corners;
{% endhighlight %}

Declare all the necessary vectors to store the image points and the object points. Image points are the checkerboard corner coordinates in the image whereas object points are the actual 3D coordinate of those checkerboard points.

{% highlight cpp %}
void setup_calibration(int board_width, int board_height, int num_imgs,
                       float square_size, char* imgs_directory, char* imgs_filename,
                       char* extension) {
  Size board_size = Size(board_width, board_height);
  int board_n = board_width * board_height;
{% endhighlight %}

We create a function called `setup_calibration` to find all the corner points of each image and their corresponding 3D world points and prepare the `object_points` and `image_points` vectors. `board_n` is the total number of corner points in the checkerboard. In our example it is $9\times 6=54$. Note that we also take a bunch of args, but I hope the variable names are self explanatory.

{% highlight cpp %}
  for (int k = 1; k <= num_imgs; k++) {
    char img_file[100];
    sprintf(img_file, "%s%s%d.%s", imgs_directory, imgs_filename, k, extension);
    img = imread(img_file, CV_LOAD_IMAGE_COLOR);
    cv::cvtColor(img, gray, CV_BGR2GRAY);
{% endhighlight %}

We loop through all the images in our directory and convert them to grayscale images using the function `cv::cvtColor`.

{% highlight cpp %}
    bool found = false;
    found = cv::findChessboardCorners(img, board_size, corners,
                                      CV_CALIB_CB_ADAPTIVE_THRESH | CV_CALIB_CB_FILTER_QUADS);
    if (found)
    {
      cornerSubPix(gray, corners, cv::Size(5, 5), cv::Size(-1, -1),
                   TermCriteria(CV_TERMCRIT_EPS | CV_TERMCRIT_ITER, 30, 0.1));
      drawChessboardCorners(gray, board_size, corners, found);
    }
{% endhighlight %}

Next we use the `findChessboardCorners` function to find all the checkerboard corners. I would suggest you go through the OpenCV documentation for more details about the arguments of this function. If the corners are found then `found` is set to `true` and the corners are further refined by the `cornerSubPix` function. The `drawChessboardCorners` function is optional, it only helps you visualize the checkerboard corners found.

{% highlight cpp %}
    vector< Point3f > obj;
    for (int i = 0; i < board_height; i++)
      for (int j = 0; j < board_width; j++)
        obj.push_back(Point3f((float)j * square_size, (float)i * square_size, 0));

    if (found) {
      cout << k << ". Found corners!" << endl;
      image_points.push_back(corners);
      object_points.push_back(obj);
    }
  }
}
{% endhighlight %}

Next we store the object points. Ideally we should keep the origin at the camera centre and measure the 3D points of the checkerboard corners manually but you can image how difficult it would be. So we introduce a small but beautiful hack - we keep the world origin as the top left corner point. Mathematically this doesn't change anything (think how). Now the geometry of the checkerboard helps us find the other 3D coordinates of the corners very easily. The $Z$ coordinate is always $0$ since all the points lie on a plane. Since the square size for this example is 24.23 mm (units are important!) then the other points become $(24.23, 0, 0)$, $(48.46, 0, 0)$ and so on.

{% highlight cpp %}
int main(int argc, char const **argv)
{
  int board_width, board_height, num_imgs;
  float square_size;
  char* imgs_directory;
  char* imgs_filename;
  char* out_file;
  char* extension;

  static struct poptOption options[] = {
    { "board_width",'w',POPT_ARG_INT,&board_width,0,"Checkerboard width","NUM" },
    { "board_height",'h',POPT_ARG_INT,&board_height,0,"Checkerboard height","NUM" },
    { "num_imgs",'n',POPT_ARG_INT,&num_imgs,0,"Number of checkerboard images","NUM" },
    { "square_size",'s',POPT_ARG_FLOAT,&square_size,0,"Size of checkerboard square","NUM" },
    { "imgs_directory",'d',POPT_ARG_STRING,&imgs_directory,0,"Directory containing images","STR" },
    { "imgs_filename",'i',POPT_ARG_STRING,&imgs_filename,0,"Image filename","STR" },
    { "extension",'e',POPT_ARG_STRING,&extension,0,"Image extension","STR" },
    { "out_file",'o',POPT_ARG_STRING,&out_file,0,"Output calibration filename (YML)","STR" },
    POPT_AUTOHELP
    { NULL, 0, 0, NULL, 0, NULL, NULL }
  };

  POpt popt(NULL, argc, argv, options, 0);
  int c;
  while((c = popt.getNextOpt()) >= 0) {}

  setup_calibration(board_width, board_height, num_imgs, square_size,
                   imgs_directory, imgs_filename, extension);
{% endhighlight %}

We get all the necessary user input using `libpopt` and call the `setup_calibration` function.

{% highlight cpp %}
  Mat K;
  Mat D;
  vector< Mat > rvecs, tvecs;
  int flag = 0;
  flag |= CV_CALIB_FIX_K4;
  flag |= CV_CALIB_FIX_K5;
  calibrateCamera(object_points, image_points, img.size(), K, D, rvecs, tvecs, flag);
{% endhighlight %}

Now we do the actual calibration using the `calibrateCamera` function. `K` is in the matrix containing the intrinsics as described before. `D` contains the distortion coefficients. The distortion coefficients are used to remove any sort of distortion in the images. You can read more about the distortion coefficients [here](http://docs.opencv.org/2.4/modules/calib3d/doc/camera_calibration_and_3d_reconstruction.html). `rvecs` and `tvecs` are the rotation and translation vectors. We also set `flag` to ignore higher order distortion coefficients $k_4$ and $k_5$.

{% highlight cpp %}
  FileStorage fs(out_file, FileStorage::WRITE);
  fs << "K" << K;
  fs << "D" << D;
  fs << "board_width" << board_width;
  fs << "board_height" << board_height;
  fs << "square_size" << square_size;
  printf("Done Calibration\n");

  return 0;
}
{% endhighlight %}

It is good practice to save the camera matrix `K` and the distortion coefficients `D` in a file so that you can reuse these parameters later on without having to recalibrate. `FileStorage` writes the data in a `YAML` file.

# Building the Code

The following repository contains the full source. The file you are looking for is `calib_intrinsic.cpp`

> [https://github.com/sourishg/stereo-calibration/](https://github.com/sourishg/stereo-calibration/)

I have used `cmake` to build the source and the README should help you build and run the program on your machine.
