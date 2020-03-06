from __future__ import unicode_literals

from django.http import HttpResponse
from django.views.generic import TemplateView


def healthz_page_view(request):
    return HttpResponse("OK")


def readiness_page_view(request):
    return HttpResponse("OK")


class HelloWorldView(TemplateView):
    template_name = "index.html"
