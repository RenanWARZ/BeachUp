import { Injectable } from '@angular/core';
import { Team } from './models/team.model';

@Injectable({
  providedIn: 'root'
})
export class TeamService {
  private readonly STORAGE_KEY = 'teams_data';

  constructor() {}

  getTeams(): Team[] {
    const data = localStorage.getItem(this.STORAGE_KEY);
    return data ? JSON.parse(data) : [];
  }

  addTeam(team: Team): void {
    const teams = this.getTeams();
    team.id = Date.now();
    teams.push(team);
    localStorage.setItem(this.STORAGE_KEY, JSON.stringify(teams));
  }

  deleteTeam(id: number): void {
    const teams = this.getTeams().filter(t => t.id !== id);
    localStorage.setItem(this.STORAGE_KEY, JSON.stringify(teams));
  }
}
