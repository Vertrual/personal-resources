REFER TO https://roblox.github.io/lua-style-guide/ FOR "OFFICAL" STYLING

1. Use descriptive and obvious names.
    - Don't use abbreviations, use full English words. `Player` is better than `Plr`.
    - Name things as directly as possible. `WasCalled` is better than `HasBeenCalled`. `notify` is better than `DoNotification`.
    - Name booleans as if they are yes or no questions. `IsFirstRun` is better than `FirstRun`.
    - Name functions using verb forms: `Increment` is better than `PlusOne`. `Unzip` is better than `FilesFromZip`.
    - Name event handlers to express when they run. `OnClick` is better than `Click`.
    - Put statements and expressions in positive form.
        - `IsFlying` instead of `IsNotFlying`. `Late` intead of `NotOnTime`.
        - Lead with positive conditionals. Avoid `if not Something then ... else ... end`.
        - If we only care about the inverse of a variable, turn it into a positive name. `MissingValue` instead of `not HasValue`.
2. Function signatures should be obvious and straightforward at the call site.
    - Avoid boolean arguments that change behavior. Boolean parameters are a [code smell](https://medium.com/@amlcurran/clean-code-the-curse-of-a-boolean-parameter-c237a830b7a3).
    - Avoid `nil` arguments in function calls. Use an optional dictionary with options as the last (or only) parameter instead.
3. Write less code.
    - Be concise: less code means fewer places for bugs to hide which means fewer bugs.
    - Make use of well-supported open source libraries when possible. Try to only spend your time on problems that don't already have solutions.
      Note: Problem solving on your own is still useful, that is how you learn after all. If its an easy solution and not a major project to fix do it on your own.
    - Omit needless variables. Don't assign names to values you only use once.
    - Write good abstractions. Don't repeat yourself.
4. Colocate code related by feature rather than type. Keep related code together.
    - This reduces tight coupling of distinct features.
    - Each feature should manage its own state, and explicitly define methods to access and change that state.
5. Keep code reusable and only tackle one job per function.
    - Don't make one function that both loads and calculates data; allow already loaded data to be calculated, etc.
    - Prefer functions with few or no side effects. This increases testability and re-usability and deters unexpected or unplanned behavior. Side effects are inevitable, but keep them explicitly defined and obvious.
6. "If a feature is sometimes dangerous, and there is a better option, then always use the better option." –Douglas Crockford
    - Avoid using features and patterns that consistently lead to mistakes. Humans are fallible, and you *will* make mistakes.
7. Prefer stateful instances (e.g. classes) rather than excessive data structuring. In other words, if something can exist more than once, then it should be a "class".
    - Avoid global state
    - Prefer composition over inheritance: All class hierarchies are eventually wrong for new use cases. Ask "has a", "uses a", or "can do" instead of "is a".
    - Ensure that anything that is created can also be cleaned up, especially event listeners and state that is associated with objects (instances/classes) that may not exist forever. Be tidy.
    - Prefer getter and setter functions when providing public read and write access to privately managed state. You can't tell the future, and someday you might need to do some processing rather than setting a simple property.
8. Prefer generic solutions which can be applied to many problems rather than specific solutions that can only be applied to one.
    - When a generic solution is not ideal, then write parallel code for parallel concepts. When we repeat similar patterns for similar problems, anybody familiar with the pattern can quickly understand what the code does.
9. Optimize code for reading, not for writing.
    - Comments should answer "why", not "what".
    - Be idiomatic. Follow convention. Use a style guide. When we write code consistently, it makes it easier for others and future you to parse and understand quickly.
    - Code shouldn't be surprising. Overzealous use of meta-programming can lead to future mistakes because of wrong assumptions.
10. Exceptions should be exceptional.
    - Don't indoctrinate exceptions or errors as standard control flow. Not only does this make your code potentially surprising, but it also introduces complexity. Our standard control flow can handle those cases too.
    - Return a success value or state monad. This forces the user to consider the failure case (no accidental uncaught errors!) and makes room for soft-fail situations.
    - Reserve errors for when your program reaches an unrecoverable state. (e.g., unexpected situations or improper function usage)
11. Code should be boring. Dont try and make it all pretty, have it functional and stick to the style guide.
13. Untestable code is bad code.
14. Variable casing. (Optional and personal preference, check out the [Roblox Lua Style guide](https://roblox.github.io/lua-style-guide/#naming) for the "offical" styling.
    - It is up to you as to which which case style you would prefer to use as it really doesn’t matter. It is only used for improving your code readability. (I personally prefer PascalCase)
    - Keep your style constant in you code, dont switch from one to another.
    - Use LOUD_SNAKE_CASE as a way of storing values you want to keep the same.
    - Use `_` as a way to show that something is private and should not be used outside of what its being used for.

    <!-- Based off: https://gist.github.com/evaera/fee751d4e228dd262fe1174ba142a719#file-clean-code-md -->
