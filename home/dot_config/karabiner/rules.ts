import fs from "fs";
import { KarabinerRules } from "./types";
import { createHyperSubLayers, app, open, rectangle, shell } from "./utils";

const rules: KarabinerRules[] = [
	// Define the Hyper key itself
	{
		description: "Hyper Key (⌃⌥⇧⌘)",
		manipulators: [
			{
				description: "right_command -> Hyper Key",
				from: {
					key_code: "right_command",
				},
				to: [
					{
						key_code: "left_shift",
						modifiers: ["left_command", "left_control", "left_option"],
					},
				],
				// If right_command is pressed by itself, homerow will show up
				// Homerow configured under `Clicking - Shorctut`
				to_if_alone: [
					{
						key_code: "6",
						modifiers: [
							"left_command",
							"left_control",
							"left_option",
							"left_shift",
						],
					},
				],
				type: "basic",
			},
			{
				description:
					"Avoid starting sysdiagnose with the built-in macOS shortcut cmd+shift+option+ctrl+,",
				from: {
					key_code: "comma",
					modifiers: { mandatory: ["command", "shift", "option", "control"] },
				},
				to: [],
				type: "basic",
			},
			{
				description:
					"Avoid starting sysdiagnose with the built-in macOS shortcut cmd+shift+option+ctrl+.",
				from: {
					key_code: "period",
					modifiers: { mandatory: ["command", "shift", "option", "control"] },
				},
				to: [],
				type: "basic",
			},
			{
				description:
					"Avoid starting sysdiagnose with the built-in macOS shortcut cmd+shift+option+ctrl+/",
				from: {
					key_code: "slash",
					modifiers: { mandatory: ["command", "shift", "option", "control"] },
				},
				to: [],
				type: "basic",
			},
		],
	},
	{
		description: "Tab + number: F1 ~ F12",
		manipulators: [
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "1",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "f1" }],
				type: "basic",
			},
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "2",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "f2" }],
				type: "basic",
			},
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "3",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "f3" }],
				type: "basic",
			},
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "4",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "f4" }],
				type: "basic",
			},
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "5",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "f5" }],
				type: "basic",
			},
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "6",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "f6" }],
				type: "basic",
			},
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "7",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "f7" }],
				type: "basic",
			},
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "8",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "f8" }],
				type: "basic",
			},
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "9",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "f9" }],
				type: "basic",
			},
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "0",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "f10" }],
				type: "basic",
			},
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "hyphen",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "f11" }],
				type: "basic",
			},
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "equal_sign",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "f12" }],
				type: "basic",
			},
		],
	},
	{
		description: "Tab + backspace to delete",
		manipulators: [
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "delete_or_backspace",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "delete_forward" }],
				type: "basic",
			},
			{
				from: {
					key_code: "tab",
					modifiers: { optional: ["any"] },
				},
				parameters: {
					"basic.to_if_alone_timeout_milliseconds": 250,
					"basic.to_if_held_down_threshold_milliseconds": 250,
				},
				to: [
					{
						set_variable: {
							name: "tab pressed",
							value: 1,
						},
					},
				],
				to_after_key_up: [
					{
						set_variable: {
							name: "tab pressed",
							value: 0,
						},
					},
				],
				to_if_alone: [{ key_code: "tab" }],
				type: "basic",
			},
		],
	},
	{
		description: "Tab + hjkl to arrow keys",
		manipulators: [
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "j",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "down_arrow" }],
				type: "basic",
			},
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "k",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "up_arrow" }],
				type: "basic",
			},
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "h",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "left_arrow" }],
				type: "basic",
			},
			{
				conditions: [
					{
						name: "tab pressed",
						type: "variable_if",
						value: 1,
					},
				],
				from: {
					key_code: "l",
					modifiers: { optional: ["any"] },
				},
				to: [{ key_code: "right_arrow" }],
				type: "basic",
			},
			{
				from: {
					key_code: "tab",
					modifiers: { optional: ["any"] },
				},
				parameters: {
					"basic.to_if_alone_timeout_milliseconds": 250,
					"basic.to_if_held_down_threshold_milliseconds": 250,
				},
				to: [
					{
						set_variable: {
							name: "tab pressed",
							value: 1,
						},
					},
				],
				to_after_key_up: [
					{
						set_variable: {
							name: "tab pressed",
							value: 0,
						},
					},
				],
				to_if_alone: [{ key_code: "tab" }],
				type: "basic",
			},
		],
	},

	...createHyperSubLayers({
		r: {
			j: open("raycast://extensions/lardissone/raindrop-io/search"),
			k: open("raycast://extensions/mblode/google-search/index"),
			l: open("raycast://extensions/raycast/file-search/search-files"),
			semicolon: open("raycast://extensions/vishaltelangre/google-drive/index"),
			// quote: open("raycast://extensions/mathieudutour/wolfram-alpha/index"),
			y: open(
				"raycast://extensions/tonka3000/youtube/search-videos?arguments=%7B%22query%22%3A%22%22%7D",
			),
			u: open("raycast://extensions/raycast/apple-reminders/create-reminder"),
			i: open("https://google.com/search?q=&tbm=isch"),
			// i: open("raycast://extensions/raycast/apple-reminders/my-reminders"),
			o: open("raycast://extensions/raycast/github/search-repositories"),
			p: open("raycast://extensions/nhojb/brew/search"),
			h: open("raycast://extensions/mattisssa/spotify-player/search"),
			e: open(
				"raycast://extensions/raycast/emoji-symbols/search-emoji-symbols",
			),
		},
	}),
];

fs.writeFileSync(
	"karabiner.json",
	JSON.stringify(
		{
			global: {
				show_in_menu_bar: true,
			},
			profiles: [
				{
					name: "Default",
					complex_modifications: {
						rules,
					},

					selected: true,
					simple_modifications: [
						{
							from: { key_code: "caps_lock" },
							to: [{ key_code: "left_control" }],
						},
					],
					virtual_hid_keyboard: {
						keyboard_type_v2: "ansi",
					},
				},
			],
		},
		null,
		2,
	),
);
