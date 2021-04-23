{
  "files.associations": {
    "__locale": "cpp",
    "system_error": "cpp"
  },
  "code-runner.executorMap": {
    "c": "cd $dir && gcc $fileName&& ./a.out",
    "cpp": "cd $dir && g++ -std=c++17 -I ../../ac-library -W -fsanitize=address -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC $fileName && ./a.out"
  },
  "ego.power-tools": {
    "values": { "lang": "nim" },
    "commands": {
      "atcoder.gen": {
        "name": "atcoder.gen",
        "script": "../powertools/lib/gen.js",
        "options": {
          "params": [
            "--workspace ${workspaceRoot}",
            "--lang ${lang}",
            "--template ${workspaceRoot}/powertools/atcoder-templates/template_${lang}.txt"
          ]
        }
      },
      "atcoder.test": {
        "name": "atcoder.test",
        "script": "../powertools/lib/test.js",
        "forFile": true,
        "options": {
          "compiler": "nim cpp ${activeFile}"
        }
      },
      "atcoder.submit": {
        "name": "atcoder.submit",
        "script": "../powertools/lib/submit.js",
        "forFile": true,
        "ifFile": true,
        "options": {
          "compiler": "python ${workspaceRoot}/ac-library-nim/expander.py --lib ${workspaceRoot}/ac-library-nim ${activeFile} && nim cpp ${activeFile}",
          "params": ["--code combined.nim", "-u"]
        }
      }
    },
    "buttons": [
      {
        "text": "generate",
        "action": {
          "type": "command",
          "command": "atcoder.gen"
        }
      },
      {
        "text": "test",
        "action": {
          "type": "command",
          "command": "atcoder.test"
        }
      },
      {
        "text": "submit",
        "action": {
          "type": "command",
          "command": "atcoder.submit"
        }
      }
    ]
  },
  "python.pythonPath": "/Users/morita1/.pyenv/versions/program-comp/bin/python"
}
