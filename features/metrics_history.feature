Feature: analizo metrics-history
  As a software engineering researcher
  I want to analyse the entire history of a project
  To understand its development process

  Scenario: listing what commits should be analyzed
    When I explode t/samples/evolution.tar.gz and run "analizo metrics-history --list ."
    Then the output must match "0a06a6fcc2e7b4fe56d134e89d74ad028bb122ed"
    And the output must not match "ba62278e976944c0334103aa0044535169e1a51e"
    And the output must not match "eb67c27055293e835049b58d7d73ce3664d3f90e"
    And the output must match "aa2d0fcb7879485d5ff1cd189743f91f04bea8ce"
    And the output must match "e8faf88f0e20a193d700b6c68eeb31897dd85e53"
    And the output must match "d7f52e74dc3d8f57640e83d41c5e9f8fcf621c00"
    And the output must match "0d3c023120ad4e9f519a03fff275d048c52671ad"

  Scenario: actually processing
    When I explode t/samples/evolution.tar.gz and run "(analizo metrics-history . && cat metrics.csv)"
    Then the output must match "0a06a6fcc2e7b4fe56d134e89d74ad028bb122ed,eb67c27055293e835049b58d7d73ce3664d3f90e"
    And the output must match "aa2d0fcb7879485d5ff1cd189743f91f04bea8ce,d7f52e74dc3d8f57640e83d41c5e9f8fcf621c00"
    And the output must match "e8faf88f0e20a193d700b6c68eeb31897dd85e53,d7f52e74dc3d8f57640e83d41c5e9f8fcf621c00"
    And the output must match "d7f52e74dc3d8f57640e83d41c5e9f8fcf621c00,0d3c023120ad4e9f519a03fff275d048c52671ad"
    And the output must match "0d3c023120ad4e9f519a03fff275d048c52671ad,,"
