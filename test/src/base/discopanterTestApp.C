//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html
#include "discopanterTestApp.h"
#include "discopanterApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "MooseSyntax.h"

InputParameters
discopanterTestApp::validParams()
{
  InputParameters params = discopanterApp::validParams();
  params.set<bool>("use_legacy_material_output") = false;
  params.set<bool>("use_legacy_initial_residual_evaluation_behavior") = false;
  return params;
}

discopanterTestApp::discopanterTestApp(const InputParameters & parameters) : MooseApp(parameters)
{
  discopanterTestApp::registerAll(
      _factory, _action_factory, _syntax, getParam<bool>("allow_test_objects"));
}

discopanterTestApp::~discopanterTestApp() {}

void
discopanterTestApp::registerAll(Factory & f, ActionFactory & af, Syntax & s, bool use_test_objs)
{
  discopanterApp::registerAll(f, af, s);
  if (use_test_objs)
  {
    Registry::registerObjectsTo(f, {"discopanterTestApp"});
    Registry::registerActionsTo(af, {"discopanterTestApp"});
  }
}

void
discopanterTestApp::registerApps()
{
  registerApp(discopanterApp);
  registerApp(discopanterTestApp);
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
// External entry point for dynamic application loading
extern "C" void
discopanterTestApp__registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  discopanterTestApp::registerAll(f, af, s);
}
extern "C" void
discopanterTestApp__registerApps()
{
  discopanterTestApp::registerApps();
}
