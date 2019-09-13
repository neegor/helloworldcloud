from __future__ import unicode_literals
from django.views.generic import TemplateView
from django.http import HttpResponse


def healthzPageView(request):
    return HttpResponse("OK")


def readinessPageView(request):
    return HttpResponse("OK")


class helloWorldView(TemplateView):
    template_name = "index.html"
