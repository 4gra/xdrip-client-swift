<h1>Changes in this repo</h1>
<p>This repo is modified to be compliance with the plugin approach available in the Loop/dev as of Mar 2021.  The steps below are now vastly simpler for Loop/dev branch than they are for Loop/master:

<h1>Build</h1>
<p>This guide will help you integrating JohanDegraeve's xDrip4iO5 aka https://github.com/JohanDegraeve/xdripswift into Loop.</p> 

<p>Here are the steps we're going to take:</p>
<ul>
  <li>Check out Loop Workspace</li>
  <li>Add xdrip-client-swift as a submodule to the Workspace (or just clone it into the folder?)</li>
  <li>Assign to your developer team, noting the App Group (something like: <code>group.com.YOUR_TEAM_ID.loopkit.LoopGroup</code>)</li>
  <li>Check out xdripswift, setting a matching developer team and App Group ID</li>
  <li>(Optional) add the <code>xdrip://</code> URL scheme to xdripswift - https://github.com/julian-groen/xdrip-client-swift/issues/1#issuecomment-646149084 - this provides 'click through' from the reading in Loop to the xDrip interface.</li>
  <li>Build and launch</li>
</ul>

<h1>Troubleshooting</h1>
<p>Loop not getting xDrip data?</p>
<ul>
  <li>Wait a moment. On first launch the plugin will probably be empty, as it doesn't prompt xDrip to re-read.</li>
  <li>Make sure xDrip is receiving readings! (Did you open the correct copy of xDrip?  You might now have two copies.  Delete both, and reinstall.)</li>
  <li>Make sure Loop and xDrip are using the same App Group!  Really!</li>
  <li>Make sure both Loop and xDrip are still running in the background - try killing recent apps, then killing and reopening Loop and xDrip. Make ure they have all the iOS permissions they need.</li>
</ul>


<h1>Older Troubleshooting steps (hopefully nobody needs these now)</h1>

<h2>Update Cartfile dependencies</h2>
<p>Loop and almost all its elements are constituted of many different projects. These projects lay down the proper foundation for Loop to build successfully. For example, the project LoopKit is fundamental in Loop's inner-workings. Elements such as RileyLink, the Dexcom share client, and the xDrip client rely upon it, depend upon it, in order to function properly. These dependencies are declared in what's called the Cartfile. Here we tell Carthage, the dependency manager, where to go on GitHub to find these constituting elements of Loop. Carthage then fetches that information from GitHub, clones it onto your computer, and then builds it. The result of this is also logged into the Cartfile.resolved. Those very long numbers you see at the end of each declared dependency are what we call a SHA-1. It's like a fingerprint - each one is unique, and is attributed to the version of the dependency you told Carthage to go get. This can help us make sure that we've gone and gotten the right version when we want to be vigilant, but don't worry about that for now.</p>
<p>Because we want Loop to also depend upon the xDrip client, we have to edit the Cartfile and tell Carthage where to go get it so it can import the xDrip client. NOTE: To continue this guide I assume you have a recent version of Loop, which is up and running! If you open Loop's Cartfile, you'll notice it has multiple dependencies but is missing the xDrip client. So we want to tell Loop to use the xDrip client. We can tell Loop to use the client by adding this line of text at the end of the Cartfile: <code>gitHub "julian-groen/xdrip-client-swift" "master"</code>. Copy that into Loop's Cartfile, then save and exit. Do the same for the Cartfile.resolved.</p> 
  
<blockquote>
<p>Note that you may have to right click on the Cartfile or the Cartfile.resolved in order to open it with TextEdit. TextEdit is usually the default editor for the Cartfile, but often the default editor for the Cartfile.resolved is Xcode. Try and be consistent with the editor you use when appending the Cartfiles.
</p>
</blockquote> 

<h2>Carthage update (troubleshooting only)</h2>
<p>Time to tell Carthage to do its thing. In Terminal, type :<br><br>
<code>cd ~/LOCATION_OF_LOOP_FOLDER && carthage update</code></p>
<p>If you get any errors, type <code>rm -rf ~/Library/Caches/org.carthage.CarthageKit</code> and then <code>rm -rf ~/Library/Developer/Xcode/DerivedData</code>. Terminal should not tell you anything after you type these out. If you still get an error, Carthage should tell you what went wrong, but often much too vaguely to do anything about it. At the end of its message, it'll tell you that you can "check the log" at <code>/var/folders/...</code>. Highlight this with your curser and copy it with <code>command+c</code>, then type <code>open</code>, paste the file path with <code>command+v</code>, and hit enter. You'll get a detailed log as to what's happening and where to fix it.</p>

<h2>Add xDrip as a CGM source to Loop in Xcode (master branch only)</h2>
<p>Open up your Loop folder and open the Loop project. In the project manager pane on the lefthand side of your screen, navigate into Loop &gt; Managers &gt; CGMManager.swift.</p>
<p>At the top of the file, you'll see a bunch of frameworks being imported via the declaration <code>import LoopKit</code>, or <code>import ShareClient</code>. We also want to import something : the xDrip client. Click at the end of the last framework being imported, hit enter, and type <code>import xDripClient</code>.</p>
<p>A little further down you'll notice the constant <code>allCGMManagers</code> being declared, with the required syntax being <code>CGMManager.Type</code>. Add xDrip to the list by typing : <code>xDripClientManager.self</code>.</p>

<h2>Add the xDrip frameworks (master branch only)</h2>
<p>Time to use the xDrip frameworks that Carthage went and got for us.</p>
<p>At the top of the project manager pane you'll see "Loop" with the app icon symbol next to it, under TARGETS. Click on that. Along the top of the screen, right under the name of the project, you'll see a range of tabs listed horizontally, such as "General", "Capabilities", "Resource tags"... Find "Build Phases" and click on it. You'll see a list of options appear. Near the bottom you'll see "Copy Frameworks with Carthage". Click on that.</p>
<p>Under "Input Files", you'll see a bunch of things that start with <code>$(BUILT_PRODUCTS_DIR)</code>. All of those files are the frameworks that we asked Carthage to get. We're going to add the xDrip client and its UI onto the list, so that Loop can access the files while it's building and running.</p>
<p>Click on the <code>+</code> and type :</p>
<p><code>$(BUILT_PRODUCTS_DIR)/xDripClient.framework/xDripClient</code><br><code>$(BUILT_PRODUCTS_DIR)/xDripClientUI.framework/xDripClientUI</code></p>
<p>Now do the same under "Output Files", click on the <code>+</code> and type :</p>
<p><code>$(BUILT_PRODUCTS_DIR)/$(FRAMEWORKS_FOLDER_PATH)/xDripClient.framework</code><br>
<code>$(BUILT_PRODUCTS_DIR)/$(FRAMEWORKS_FOLDER_PATH)/xDripClientUI.framework</code></p>

<h2>Link binaries (master branch only)</h2>
<p>We've added a reference into the CGM manager, added a reference to the frameworks, now all we have left is to link the files themselves into Loop.</p>
<p>Under that same "Build Phases" tab you'll also see "Link Binary With Libraries". Click on that, and scroll down to the <code>+</code> button. You'll be asked to select the files. We're looking for that same <code>xDripClient.framework</code> and <code>xDripClientUI.framework</code> we just referenced in the last step.</p>
<p>Click <code>Add other...</code> and navigate into your Loop folder. Go into Carthage &gt; Build &gt; iOS and scroll all the way down until you find the <code>xDripClient.framework</code> and the <code>xDripClientUI.framework</code>. Select the <code>.framework</code>, not the <code>.framework.dSYM</code>. We want the one whose icon kind of looks like a Lego.</p>
