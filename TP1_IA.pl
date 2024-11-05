
:- dynamic task/4.


% Create a task
create_task(TaskID, Description, Assignee) :-
    \+ task(TaskID, _, _, _),          
    assert(task(TaskID, Description, Assignee, false)), 
    write('Task created successfully.'), nl.

% Mark task as completed
mark_completed(TaskID) :-
    task(TaskID, Description, Assignee, _),
    retract(task(TaskID, Description, Assignee, _)),  
    assert(task(TaskID, Description, Assignee, true)), 
    write('Task marked as completed.'), nl.

% Display all tasks
display_tasks :-
    task(TaskID, Description, Assignee, Completed),
    write('Task ID: '), write(TaskID), nl,
    write('Description: '), write(Description), nl,
    write('Assignee: '), write(Assignee), nl,
    write('Completed: '), write(Completed), nl, nl,
    fail.
display_tasks.

% Display tasks assigned to a specific user lor assignee
display_tasks_assigned_to(User) :-
    task(TaskID, Description, User, Completed),
    write('Task ID: '), write(TaskID), nl,
    write('Description: '), write(Description), nl,
    write('Completed: '), write(Completed), nl, nl,
    fail.
display_tasks_assigned_to(_).

% Display completed tasks
display_completed_tasks :-
    task(TaskID, Description, Assignee, true),
    write('Task ID: '), write(TaskID), nl,
    write('Description: '), write(Description), nl,
    write('Assignee: '), write(Assignee), nl, nl,
    fail.
display_completed_tasks.



