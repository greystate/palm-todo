// Generated by CoffeeScript 1.12.0
(function() {
  var $, $$, $on, ZireController, ref, selectContentEditable,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  $ = function(selector, scope) {
    if (scope == null) {
      scope = document;
    }
    if (typeof selector === "object") {
      return selector;
    } else {
      return scope.querySelector(selector);
    }
  };

  $$ = function(selector, scope) {
    if (scope == null) {
      scope = document;
    }
    return scope.querySelectorAll(selector);
  };

  $on = function(selector, type, handler) {
    return ($(selector)).addEventListener(type, handler, false);
  };

  selectContentEditable = function(contentEditableElement) {
    var range, selection;
    range = document.createRange();
    range.selectNodeContents(contentEditableElement);
    selection = window.getSelection();
    selection.removeAllRanges();
    return selection.addRange(range);
  };

  this.app = (ref = window.app) != null ? ref : {};

  ZireController = (function() {
    function ZireController() {
      this.setupHandlers = bind(this.setupHandlers, this);
      this.setupHandlers();
    }

    ZireController.prototype.setupHandlers = function() {
      return $on($('#new-task'), "click", this.addNewTask);
    };

    ZireController.prototype.addNewTask = function() {
      var $label, todo;
      todo = document.createElement("li");
      todo.innerHTML = '<input id="todo-1542" type="checkbox" /><label>New todo</label>';
      $label = $('label', todo);
      $label.contentEditable = true;
      ($('.todolist ul')).appendChild(todo);
      return selectContentEditable($label);
    };

    return ZireController;

  })();

  $on(window, "DOMContentLoaded", function() {
    return app.controller = new ZireController;
  });

}).call(this);