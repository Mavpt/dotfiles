-- ------IMPORTS------
-- Base
import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.SpawnOnce
import XMonad.Util.Run

import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map as M
-- ------Appearance------
myFont          = "xft:Meslo LGS NF:regular:pixelsize=12"
myColorBg       = "#2E3440"
myColorFg       = "#ECEFF4"

myBorderWidth   = 2

myNormalBorderColor  = "#4C566A"
myFocusedBorderColor = "#5E81AC"

-- ------Default Programs------
myTerminal      = "alacritty"
myEditor        = "nvim"
myBrowser       = "brave-browser"

-- ------Modifier Keys------
myModMask       = mod4Mask

-- ------Focus------
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- ------Workspaces------
myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]

-- ------Key bindings------
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
        ------ xmonad
        -- Quit xmonad
        [ ((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess))

        -- Restart xmonad
        , ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
        
        ------ Layouts
        --  Reset layout on current workspace
        , ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)

        -- Change layout
        , ((modm, xK_space ), sendMessage NextLayout)

        -- Shrink the master area
        , ((modm, xK_h), sendMessage Shrink)

        -- Expand the master area
        , ((modm, xK_l), sendMessage Expand)

        -- Increment the nmber of windows in the master area
        , ((modm, xK_comma), sendMessage (IncMasterN 1))

        -- Deincrement the number of windows in the master area
        , ((modm, xK_period), sendMessage (IncMasterN (-1)))
        
        ------ Windows
        -- Close focused window
        , ((modm .|. shiftMask, xK_c), kill)

        -- Resize viewed windows to the correct size
        , ((modm, xK_n), refresh)

        -- Move focus to the next window
        , ((modm, xK_j), windows W.focusDown)

        -- Move focus to the previous window
        , ((modm, xK_k), windows W.focusUp)

        -- Move focus to the master window
        , ((modm, xK_m), windows W.focusMaster)

        -- Swap the focused window and the master window
        , ((modm, xK_Return), windows W.swapMaster)

        -- Swap the focused window with the next window
        , ((modm .|. shiftMask, xK_j), windows W.swapDown)

        -- Swap the focused window with the previous window
        , ((modm .|. shiftMask, xK_k), windows W.swapUp)

        -- Push window back into tiling
        , ((modm, xK_t), withFocused $ windows . W.sink)

        ------Programs
        -- Rofi
        , ((modm, xK_space), spawn "rofi -show drun")

        -- Terminal
        , ((modm, xK_Return), spawn $ XMonad.terminal conf)
        ]
        ++

------ Screens
-- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
-- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
        [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
                | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
                , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
        ++

------ Workspaces
-- mod-[1..9], Switch to workspace N
-- mod-shift-[1..9], Move client to workspace N
        [((m .|. modm, k), windows $ f i)
                | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
                , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

-- ------Mouse bindings------
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

-- ------Layouts------
myLayout = avoidStruts(tiled ||| Mirror tiled ||| Full)
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = Tall nmaster delta ratio

    -- The default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio   = 1/2

    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

-- ------Window rules------
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

-- ------Event handling------
myEventHook = mempty

-- ------Status bars and logging------
myLogHook = return ()

-- ------Startup hook------
myStartupHook = do
        spawnOnce "lxsession"
        spawnOnce "setwallpaper"
        spawnOnce "picom --experimental-backends --backend glx --xrender-sync-fence"
        spawnOnce "blueman-applet"
        spawnOnce "transmission-daemon"
        spawnOnce "flameshot"
        spawnOnce "mpd"
        spawnOnce "mpDris2"
        spawnOnce "remaps"


------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do
        xmproc <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobarrc.hs"
        xmproc <- spawnPipe "xmobar -x 1 ~/.config/xmobar/xmobarrc.hs"
        xmonad $ docks defaults

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = defaultConfig {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }
