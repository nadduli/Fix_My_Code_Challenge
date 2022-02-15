# Fix-my-code-1

## Issues To Resolve

+ [x] 0. Server status
  + **INFO:**
    + I just started a new Flask project and the first thing I'm putting in place is a route for the status of my API (super important for a load balancer implementation).
    + But I don't know why it's not working…
    + Could you look at it and fix it please?
    + My code is [here](status_server/).
    + On terminal 1:
      + ```powershell
        $ python -m api.v1.app
         * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
        ....
        ```
    + On terminal 2:
      + ```powershell
        $ curl -XGET http://0.0.0.0:5000/api/v1/status
        {
          "error": "Not found"
        }
        $
        ```
  + **ISSUE:**
    + The Flask API project had a routing issue. The `app_views` blueprint [here](status_server/api/v1/views/__init__.py) specified the `url_prefix` as `/api/v1`. However, the `status` route handler defined [here](status_server/api/v1/views/index.py) specified the rule as `/api/v1/status`. The `url_prefix` for a blueprint is added to the left side of each route defined under the current blueprint. This means that the route for the path would have to be gotten through `curl -XGET http://0.0.0.0:5000/api/v1/api/v1/status` rather than `curl -XGET http://0.0.0.0:5000/api/v1/status`.
  + **FIX:**
    + Change the rule for the `status` route handler in [here](status_server/api/v1/views/index.py) from `/api/v1/status` to `/status`.

+ [x] 1. My square
  + **INFO:**
    + I love geometry!
    + Look [my square](square.py), it's perfect? No? Should I change something?
  + **ISSUE:**
    + The perimeter and string format of the `square` class were incorrectly defined. There were also some typos and styling issues such as inconsistent naming format, no documentation on the module, class, and some functions.
  + **FIX:**
    + Change the perimeter to be 4 times the `width`.
    + Change the string format to be the `width/width` rather than `width/height`.
    + Remove the unused class variable `height` and change `width` to `__width`.
    + Convert the previous `width` attribute to a class property to prevent type and value pollution.
    + Make the [file](square.py) PEP8 compliant.

+ [x] 2. Step 2: User model
  + **INFO:**
    + I'm running into a serious problem!
    + I just start my OOP project and nothing works…
    + Could you help me please? My code is [here](user.py).
    + Thank you!
  + **ISSUE:**
    + There was a name definition error because a class property was being accessed before it was defined.
  + **FIX:**
    + Move the definition of the `email` class property to appear before its setter.

+ [x] 3. Blog access
  + **INFO:**
    + I finished and deployed my Rails blog but people are contacting me because they can't access any of my blog posts… Weird, it works for me…
    + Could you take a look and fix it? My code base is [here](blog/).
    + Also, when you're done, could you add a new feature please?
    + I would like to add a boolean `online` for each `Post` object with a default value `true`. With this boolean, I will be able to hide/show some blog posts from the listing. I will also need a way to change this boolean in the `Post#edit` route. Could you do this for me?
    + Thank you!
  + **ISSUE:**
    + All the requirements to make the server run weren't listed on the README. The developer could have had all those programs and libraries on his computer, so the web application wouldn't work on another person's computer if that person doesn't have those programs and libraries.
    + The bcrypt gem was raising Exceptions whenever I tried to login as an admin or create a new user.
  + **FIX:**
    + In the README, I declared all the programs and libraries that should be on the user's computer for the web application to work. I also declared the version of Ruby which successfully runs the program, which was Ruby 2.3.
    + I upgraded the version of the bcrypt gem that was in the [Gemfile.lock](blog/Gemfile.lock) and executed `bundle install` again.
    + I generated a migration Ruby script for adding the `online` boolean column for each `Post` using the command `rails generate migration AddOnlineToPosts online:boolean`. I later edited the file to support the requested feature.

+ [x] 4. Never leave the office
  + **INFO:**
    + I'm coming back from 2 weeks of holidays in France and when I arrived at the office, the first words from my marketing co-worker were: "Hi, how was your holiday? by the way, I think I broke the website…"
    + **WHAT???**
    + Ok, let's jump on it and fix [it](react-blog/)!
    + Arf, I have also the pagination to fix… I didn't have time before my break to look at it…
  + **ISSUE:**
    + When building the application using `gulp build-all`, it fails as a result of an error in the jsx file at [react-blog/src/components/Header.jsx](react-blog/src/components/Header.jsx) and a missing `prop-types` dependency.
    + There was a `const` variable used in a for loop in [react-blog/src/actions/SinglePostActions.js](react-blog/src/actions/SinglePostActions.js).
    + There were a lot of typos in [react-blog/src/actions/AllPostActions.js](react-blog/src/actions/AllPostActions.js).
    + There was a semantic error with the string concatenation in the render function in [react-blog/src/components/PostPreview.jsx](react-blog/src/components/PostPreview.jsx).
  + **FIX:**
    + I added the missing `<` symbol in the jsx file and I installed the `prop-types` module.
    + I changed the `const` variable in the for loop in [react-blog/src/actions/SinglePostActions.js](react-blog/src/actions/SinglePostActions.js) to a `let` variable.
    + I fixed the typos in [react-blog/src/actions/AllPostActions.js](react-blog/src/actions/AllPostActions.js).
    + I fixed the semantic error with the string concatenation in the render function in [react-blog/src/components/PostPreview.jsx](react-blog/src/components/PostPreview.jsx).
