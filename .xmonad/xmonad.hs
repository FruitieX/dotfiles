-------------------------------------------------------------------------------
-- xmonad.hs for xmonad-darcs
-- Author: Øyvind 'Mr.Elendig' Heggstad <mrelendig AT har-ikkje DOT net>
-------------------------------------------------------------------------------
-- Compiler flags --
{-# LANGUAGE NoMonomorphismRestriction #-}

-- Imports --
-- stuff
import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import System.Exit
import XMonad.Util.Run (safeSpawn)
import Graphics.X11.ExtraTypes.XF86

-- actions
import XMonad.Actions.GridSelect

-- hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName

-- layouts
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Renamed
import XMonad.Layout.Tabbed
import XMonad.Layout.PerWorkspace

-------------------------------------------------------------------------------
-- Main --
main :: IO ()
main = xmonad =<< statusBar cmd pp kb conf
  where 
    uhook = withUrgencyHookC NoUrgencyHook urgentConfig
    cmd = "bash -c \"tee >(xmobar -x0) | xmobar -x1\""
    pp = customPP
    kb = toggleStrutsKey
    conf = uhook myConfig

-------------------------------------------------------------------------------
-- Configs --
myConfig = defaultConfig { workspaces = workspaces'
                         , modMask = modMask'
                         , borderWidth = borderWidth'
                         , normalBorderColor = normalBorderColor'
                         , focusedBorderColor = focusedBorderColor'
						 , startupHook = setWMName "LG3D" -- fix for minecraft?!
                         , terminal = terminal'
                         , keys = keys'
                         , layoutHook = layoutHook'
                         , manageHook = manageHook'
						 , focusFollowsMouse = False
						 , clickJustFocuses = False
                         }

-------------------------------------------------------------------------------
-- Window Management --
manageHook' = composeAll [ isFullscreen             --> doFullFloat

                         , className =? "URxvt" <&&> title =? "tmux" --> doShift "1:main"

                         , className =? "Chromium"					--> doShift "2:www"
                         , className =? "Firefox"					--> doShift "2:www"

                         , className =? "URxvt" <&&> title =? "irc"	--> doShift "3:irc"
                         , className =? "Xchat"						--> doShift "3:irc"

                         , className =? "Gimp"						--> doShift "4:gui"
                         , className =? "Vlc"						--> doShift "4:gui"
                         , className =? "Evince"					--> doShift "4:gui"
                         , className =? "Wireshark"					--> doShift "4:gui"
                         , className =? "Mixxx"						--> doShift "4:gui"
                         , className =? "Wine"						--> doShift "4:gui"
                         , className =? "Radiant.x86"				--> doShift "4:gui"
                         , className =? "Mumble"					--> doShift "4:gui"
                         , className =? "Deluge"					--> doShift "4:gui"
                         , title =? 	"Renoise (x86_64)"			--> doShift "4:gui"
                         , title =? 	"LibreOffice"				--> doShift "4:gui"

                         , className =? "Steam"						--> doShift "5:games"
                         , title =? "Steam"							--> doShift "5:games"
                         , title =? "Updating Steam..."				--> doShift "5:games"
                         , className =? "hwengine" <&&> title =? "Hedgewars"	--> doShift "5:games"
                         , className =? "Hedgewars"					--> doShift "5:games"
                         , className =? "Dolphin-emu"				--> doShift "5:games"
                         , className =? "darkplaces-sdl"			--> doShift "5:games"

			 , insertPosition Below Newer
			 , transience'
                         ]


-------------------------------------------------------------------------------
-- Looks --
-- bar
customPP = defaultPP { ppCurrent = xmobarColor "#afd700" "" . wrap "[ " " ]"
					 , ppVisible = xmobarColor "#a1a1a1" "" . wrap "[ " " ]"
					 , ppHidden = xmobarColor "#585858" ""
--                     , ppHiddenNoWindows = xmobarColor "#C9A34E" ""
                     , ppUrgent = xmobarColor "#FF0000" "" . wrap "! " " !" 
                     , ppLayout = xmobarColor "#ffffff" ""
                     , ppTitle =  xmobarColor "#ffffff" "" . shorten 80
                     , ppSep = xmobarColor "#585858" "" " | "
                     }
-- GridSelect
myGSConfig = defaultGSConfig { gs_cellwidth = 160 }

-- urgent notification
urgentConfig = UrgencyConfig { suppressWhen = Focused, remindWhen = Dont }

-- borders
borderWidth' = 8
normalBorderColor'  = "#303030"
focusedBorderColor' = "#0087af"

-- workspaces
workspaces' = ["1:main", "2:www", "3:irc", "4:gui", "5:games", "6:scratch"]

-- layouts
layoutHook' = onWorkspace "5:games" full tile ||| mtile ||| full
  where
    rt = ResizableTall 1 (2/100) (1/2) []
    tile = renamed [Replace "[]="] $ smartBorders rt
    mtile = renamed [Replace "M[]="] $ smartBorders $ Mirror rt
    full = renamed [Replace "[F]"] $ noBorders Full

-------------------------------------------------------------------------------
-- Terminal --
terminal' = "urxvt"

-------------------------------------------------------------------------------
-- Keys/Button bindings --
-- modmask
modMask' = mod4Mask

-- keys
toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

keys' :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
keys' conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- launching and killing programs
    [ ((modMask,               xK_Return), safeSpawn (XMonad.terminal conf) []) 
    , ((modMask .|. shiftMask, xK_p     ), safeSpawn "gmrun" [])
    , ((modMask,               xK_p     ), spawn "dmenu_run -fn \"-*-terminus-*-*-*-*-18-*-*-*-*-*-*-*\"")
    , ((modMask,               xK_f     ), spawn "firefox-aurora")
    , ((modMask .|. shiftMask, xK_f     ), spawn "firefox-aurora -P -new-instance")
    , ((modMask .|. shiftMask, xK_c		), kill)

    -- multimedia
    , ((0, xF86XK_AudioRaiseVolume      ), safeSpawn "amixer" ["-q", "set", "Master", "1+"])
    , ((0, xF86XK_AudioLowerVolume      ), safeSpawn "amixer" ["-q", "set", "Master", "1-"])
    , ((0, xF86XK_AudioMute             ), safeSpawn "amixer" ["-q", "set", "Master", "toggle"])
    --, ((0, xF86XK_AudioPlay      		), safeSpawn "/home/rasse/dev/sh/mpc.sh" ["play"])
    --, ((0, xF86XK_AudioStop      		), safeSpawn "/home/rasse/dev/sh/mpc.sh" ["pause"])
    --, ((0, xF86XK_AudioPrev      		), safeSpawn "/home/rasse/dev/sh/mpc.sh" ["prev"])
    --, ((0, xF86XK_AudioNext      		), safeSpawn "/home/rasse/dev/sh/mpc.sh" ["next"])
    , ((0, xF86XK_AudioPlay      		), safeSpawn "/usr/bin/cmus-remote" ["--pause"])
    , ((0, xF86XK_AudioStop      		), safeSpawn "/usr/bin/cmus-remote" ["--stop"])
    , ((0, xF86XK_AudioPrev      		), safeSpawn "/usr/bin/cmus-remote" ["--prev"])
    , ((0, xF86XK_AudioNext      		), safeSpawn "/usr/bin/cmus-remote" ["--next"])

    -- grid
    , ((modMask,               xK_g     ), goToSelected myGSConfig)

    -- layouts
    , ((modMask,               xK_space ), sendMessage NextLayout)
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- floating layer stuff
    , ((modMask,               xK_t     ), withFocused $ windows . W.sink)

    -- refresh
    , ((modMask,               xK_n     ), refresh)

    -- focus
    , ((modMask,               xK_Tab   ), windows W.focusDown)
    , ((modMask,               xK_j     ), windows W.focusDown)
    , ((modMask,               xK_k     ), windows W.focusUp)
    , ((modMask,               xK_m     ), windows W.focusMaster)

    -- swapping
    , ((modMask .|. shiftMask, xK_Return), windows W.swapMaster)
    , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- increase or decrease number of windows in the master area
    , ((modMask .|. shiftMask, xK_e ), sendMessage (IncMasterN 1))
    , ((modMask .|. shiftMask, xK_u), sendMessage (IncMasterN (-1)))

    -- resizing
    , ((modMask,               xK_h     ), sendMessage Shrink)
    , ((modMask,               xK_l     ), sendMessage Expand)
    , ((modMask .|. shiftMask, xK_h     ), sendMessage MirrorShrink)
    , ((modMask .|. shiftMask, xK_l     ), sendMessage MirrorExpand)

    -- quit, or restart
    --, ((modMask .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modMask              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    -- mod-[1..9] %! Switch to workspace N
    -- mod-shift-[1..9] %! Move client to workspace N
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    -- mod-[comma,period] %! switch to twinview screen 1/2
    -- mod-shift-[comma,period] %! move window to screen 1/2
    [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_comma, xK_period] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

-------------------------------------------------------------------------------

